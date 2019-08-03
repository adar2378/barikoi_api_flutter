import 'dart:async';
import 'dart:convert';

import 'package:barikoi/exceptions.dart';
import 'package:flutter/widgets.dart';

import 'models/auto_complete.dart';
import 'models/distance.dart';
import 'models/geocoding.dart';
import 'models/nearby.dart';
import 'models/reverse_geocoding.dart';
import 'package:http/http.dart' as http;

class BarikoiApi {
  /// The api key. Must be obtained from https://barikoi.com/home
  final String apiKey;
  final String _baseurl = "barikoi.xyz";
  final String _apiUrl = "/v1/api/search/";
  final Duration _timeoutDuration = Duration(seconds: 15);
  String _reveseGeocodingUrl;
  String _geoCodeUrl;
  String _autoCompleteUrl;
  String _nearByUrl;
  String _distanceUrl;
  BarikoiApi({@required this.apiKey}) {
    assert(apiKey != null);
    _reveseGeocodingUrl = "reverse/geocode/$apiKey/place";
    _geoCodeUrl = "geocode/$apiKey/place/";
    _autoCompleteUrl = "autocomplete/$apiKey/place";
    _nearByUrl = "nearby/$apiKey/0.5/10";
    _distanceUrl = "distance/$apiKey/";
  }

  /// calls the reverseGeocoding api and returns [List<PlaceRGC>], from where user can access address, city, division etc
  Future<List<PlaceRGC>> reverseGeoCoding(
      {@required String lat, @required String lon}) async {
    assert(lat != null && lon != null);
    http.Client _client = http.Client();
    var result;
    try {
      final response = await _client
          .get(Uri.https(_baseurl, _apiUrl + _reveseGeocodingUrl,
              {"longitude": lon, "latitude": lat}))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        final jsonString = jsonDecode(response.body);
        if (jsonString['message'] == null) {
          final reverseGeocoding = reverseGeocodingFromJson(response.body);
          result = reverseGeocoding.place;
        } else {
          throw OutSideDhakaException('Outside Dhaka');
        }
      } else if (response.statusCode == 429) {
        throw (LimitExceededException('Request limit is over'));
      }
    } on TimeoutException {
      throw (TimeoutException('request timed out'));
    } on OutSideDhakaException {
      throw OutSideDhakaException('Outside Dhaka');
    } on LimitExceededException {
      throw (LimitExceededException('Request limit is over'));
    } catch (e) {
      throw (e.toString());
    } finally {
      _client.close();
    }

    return result;
  }

  /// calls the geoCoding api and returns [List<PlaceGc>], from where user can access address, city, division etc
  Future<List<PlaceGc>> geoCoding({@required String placeId}) async {
    assert(placeId != null);
    http.Client _client = http.Client();
    var result;
    try {
      final response = await _client
          .get(Uri.https(
            _baseurl,
            _apiUrl + _geoCodeUrl + placeId,
          ))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        if (response.body.startsWith("{")) {
          throw NotFoundException('Not found');
        }
        print("here");
        final places = placeGcFromJson(response.body);
        result = places;
      } else if (response.statusCode == 429) {
        throw (LimitExceededException('Request limit is over'));
      }
    } on TimeoutException {
      throw (TimeoutException('request timed out'));
    } catch (e) {
      throw (e);
    } finally {
      _client.close();
    }

    return result;
  }

  /// calls the autoComplete api and returns [List<PlaceAC>], from where user can access address, city, division etc
  Future<List<PlaceAC>> autoComplete({@required String query}) async {
    assert(query != null);
    var result;
    http.Client _client = http.Client();
    try {
      final response = await _client
          .get(Uri.https(_baseurl, _apiUrl + _autoCompleteUrl, {'q': query}))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        final jsonString = jsonDecode(response.body);
        if (jsonString['message'] == null) {
          final autoCompletePlaces = autoCompleteFromJson(response.body);
          result = autoCompletePlaces.places;
        } else {
          throw NotFoundException('Not Found');
        }
      } else if (response.statusCode == 429) {
        throw (LimitExceededException('Request limit is over'));
      }
    } on TimeoutException {
      throw (TimeoutException('request timed out'));
    } catch (e) {
      throw (e);
    } finally {
      _client.close();
    }
    return result;
  }

  /// calls the nearby api and returns [List<PlaceNearby>], from where user can access address, city, division etc
  Future<List<PlaceNearby>> nearby(
      {@required String lat, @required String lon}) async {
    assert(lat != null && lon != null);
    http.Client _client = http.Client();
    var result;
    try {
      final response = await _client
          .get(Uri.https(_baseurl, _apiUrl + _nearByUrl,
              {"longitude": lon, "latitude": lat}))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        final jsonString = jsonDecode(response.body);
        if (jsonString['message'] == null) {
          final nearbyPlaces = nearbyFromJson(response.body);
          result = nearbyPlaces.places;
        } else {
          throw OutSideDhakaException('Outside Dhaka');
        }
      } else if (response.statusCode == 429) {
        throw (LimitExceededException('Request limit is over'));
      }
    } on TimeoutException {
      throw (TimeoutException('request timed out'));
    } on OutSideDhakaException {
      throw OutSideDhakaException('Outside Dhaka');
    } on LimitExceededException {
      throw (LimitExceededException('Request limit is over'));
    } catch (e) {
      throw (e.toString());
    } finally {
      _client.close();
    }

    return result;
  }

  /// Calls the distance api and returns the distance between two cooridnates
  Future<String> distance({
    @required String sourceLongitude,
    @required String sourceLatitude,
    @required String targetLongitude,
    @required String targetLatitude,
  }) async {
    var result;
    http.Client _client = http.Client();
    try {
      final response = await _client
          .get(Uri.https(
              _baseurl,
              _apiUrl +
                  _distanceUrl +
                  sourceLongitude +
                  "," +
                  sourceLatitude +
                  "/" +
                  targetLongitude +
                  "," +
                  targetLatitude))
          .timeout(_timeoutDuration);
      if (response.statusCode == 200) {
        final jsonString = jsonDecode(response.body);
        print(jsonString['message']);

        final distance = distanceFromJson(response.body);
        result = distance.distance;
      } else if (response.statusCode == 429) {
        throw (LimitExceededException('Request limit is over'));
      } else if (response.statusCode == 404) {
        throw NotFoundException('Not Found');
      }
    } on TimeoutException {
      throw (TimeoutException('request timed out'));
    } on NotFoundException {
      throw NotFoundException("Not found");
    } catch (e) {
      print(e.toString());
      throw (e);
    } finally {
      _client.close();
    }
    return result;
  }
}
