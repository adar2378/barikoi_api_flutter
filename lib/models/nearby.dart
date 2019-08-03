// To parse this JSON data, do
//
//     final nearby = nearbyFromJson(jsonString);

import 'dart:convert';

Nearby nearbyFromJson(String str) => Nearby.fromJson(json.decode(str));

String nearbyToJson(Nearby data) => json.encode(data.toJson());

class Nearby {
  List<PlaceNearby> places;

  Nearby({
    this.places,
  });

  factory Nearby.fromJson(Map<String, dynamic> json) => new Nearby(
        places: new List<PlaceNearby>.from(
            json["Place"].map((x) => PlaceNearby.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Place": new List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class PlaceNearby {
  int id;
  double distanceInMeters;
  String longitude;
  String latitude;
  String pType;
  String address;
  String area;
  String city;
  int postCode;
  String subType;
  String uCode;
  String stAsTextLocation;

  PlaceNearby({
    this.id,
    this.distanceInMeters,
    this.longitude,
    this.latitude,
    this.pType,
    this.address,
    this.area,
    this.city,
    this.postCode,
    this.subType,
    this.uCode,
    this.stAsTextLocation,
  });

  factory PlaceNearby.fromJson(Map<String, dynamic> json) => new PlaceNearby(
        id: json["id"],
        distanceInMeters: json["distance_in_meters"].toDouble(),
        longitude: json["longitude"],
        latitude: json["latitude"],
        pType: json["pType"],
        address: json["Address"],
        area: json["area"],
        city: json["city"],
        postCode: json["postCode"],
        subType: json["subType"],
        uCode: json["uCode"],
        stAsTextLocation: json["ST_AsText(location)"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "distance_in_meters": distanceInMeters,
        "longitude": longitude,
        "latitude": latitude,
        "pType": pType,
        "Address": address,
        "area": area,
        "city": city,
        "postCode": postCode,
        "subType": subType,
        "uCode": uCode,
        "ST_AsText(location)": stAsTextLocation,
      };
}
