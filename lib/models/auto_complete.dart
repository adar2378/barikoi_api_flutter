// To parse this JSON data, do
//
//     final autoComplete = autoCompleteFromJson(jsonString);

import 'dart:convert';

AutoComplete autoCompleteFromJson(String str) =>
    AutoComplete.fromJson(json.decode(str));

String autoCompleteToJson(AutoComplete data) => json.encode(data.toJson());

class AutoComplete {
  List<PlaceAC> places;

  AutoComplete({
    this.places,
  });

  factory AutoComplete.fromJson(Map<String, dynamic> json) => new AutoComplete(
        places: new List<PlaceAC>.from(
            json["places"].map((x) => PlaceAC.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": new List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class PlaceAC {
  int id;
  String address;
  String city;
  String area;
  String uCode;

  PlaceAC({
    this.id,
    this.address,
    this.city,
    this.area,
    this.uCode,
  });

  factory PlaceAC.fromJson(Map<String, dynamic> json) =>
      new PlaceAC(
        id: json["id"],
        address: json["Address"],
        city: json['city'],
        area: json["area"],
        uCode: json["uCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Address": address,
        "city": city,
        "area": area,
        "uCode": uCode,
      };
}
