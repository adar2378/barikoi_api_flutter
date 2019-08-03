// To parse this JSON data, do
//
//     final placeGc = placeGcFromJson(jsonString);

import 'dart:convert';

List<PlaceGc> placeGcFromJson(String str) =>
    new List<PlaceGc>.from(json.decode(str).map((x) => PlaceGc.fromJson(x)));

String placeGcToJson(List<PlaceGc> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class PlaceGc {
  String address;
  String area;
  String city;
  int postCode;
  String uCode;
  String longitude;
  String latitude;
  String pType;
  String subType;

  PlaceGc({
    this.address,
    this.area,
    this.city,
    this.postCode,
    this.uCode,
    this.longitude,
    this.latitude,
    this.pType,
    this.subType,
  });

  factory PlaceGc.fromJson(Map<String, dynamic> json) {
    return PlaceGc(
      address: json["Address"],
      area: json["area"],
      city: json["city"],
      postCode: json["postCode"],
      uCode: json["uCode"],
      longitude: json["longitude"],
      latitude: json["latitude"],
      pType: json["pType"],
      subType: json["subType"],
    );
  }
  Map<String, dynamic> toJson() => {
        "Address": address,
        "area": area,
        "city": city,
        "postCode": postCode,
        "uCode": uCode,
        "longitude": longitude,
        "latitude": latitude,
        "pType": pType,
        "subType": subType,
      };
}
