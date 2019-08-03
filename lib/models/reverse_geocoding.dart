// To parse this JSON data, do
//
//     final reverseGeocoding = reverseGeocodingFromJson(jsonString);

import 'dart:convert';

ReverseGeocoding reverseGeocodingFromJson(String str) =>
    ReverseGeocoding.fromJson(json.decode(str));

String reverseGeocodingToJson(ReverseGeocoding data) =>
    json.encode(data.toJson());

class ReverseGeocoding {
  List<PlaceRGC> place;

  ReverseGeocoding({
    this.place,
  });

  factory ReverseGeocoding.fromJson(Map<String, dynamic> json) =>
      new ReverseGeocoding(
        place: new List<PlaceRGC>.from(
            json["Place"].map((x) => PlaceRGC.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Place": new List<dynamic>.from(place.map((x) => x.toJson())),
      };
}

class PlaceRGC {
  int id;
  double distanceWithinMeters;
  String address;
  String area;
  String city;

  PlaceRGC({
    this.id,
    this.distanceWithinMeters,
    this.address,
    this.area,
    this.city,
  });

  factory PlaceRGC.fromJson(Map<String, dynamic> json) => new PlaceRGC(
        id: json["id"],
        distanceWithinMeters: json["distance_within_meters"].toDouble(),
        address: json["Address"],
        area: json["area"],
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distance_within_meters": distanceWithinMeters,
        "Address": address,
        "area": area,
        "city": city,
      };
}
