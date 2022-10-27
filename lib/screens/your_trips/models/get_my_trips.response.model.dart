import 'dart:convert';

import 'trip.model.dart';

Trips tripsFromJson(String str) => Trips.fromJson(json.decode(str));

String tripsToJson(Trips data) => json.encode(data.toJson());

class Trips {
  Trips({
    required this.trips,
  });

  List<Trip> trips;

  factory Trips.fromJson(Map<String, dynamic> json) => Trips(
        trips: List<Trip>.from(json["trips"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "trips": List<dynamic>.from(trips.map((x) => x)),
      };
}
