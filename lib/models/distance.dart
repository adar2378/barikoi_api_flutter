// To parse this JSON data, do
//
//     final distance = distanceFromJson(jsonString);

import 'dart:convert';

Distance distanceFromJson(String str) => Distance.fromJson(json.decode(str));

String distanceToJson(Distance data) => json.encode(data.toJson());

class Distance {
    String distance;

    Distance({
        this.distance,
    });

    factory Distance.fromJson(Map<String, dynamic> json) => new Distance(
        distance: json["Distance"],
    );

    Map<String, dynamic> toJson() => {
        "Distance": distance,
    };
}
