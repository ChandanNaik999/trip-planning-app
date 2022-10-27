import 'dart:convert';

import 'create_trip.response.dart';

DndModel dndModelFromJson(String str) => DndModel.fromJson(json.decode(str));

String dndModelToJson(DndModel data) => json.encode(data.toJson());

class DndModel {
  DndModel({
    required this.places,
    required this.trips,
  });

  Map<String, PlaceDetails> places;
  List<DndTrip> trips;

  factory DndModel.fromJson(Map<String, dynamic> json) => DndModel(
        places: Map.from(json["places"]).map((k, v) =>
            MapEntry<String, PlaceDetails>(k, PlaceDetails.fromJson(v))),
        trips:
            List<DndTrip>.from(json["trips"].map((x) => DndTrip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": Map.from(places)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trips": List<dynamic>.from(trips.map((x) => x.toJson())),
      };
}

class DndTrip {
  DndTrip({
    required this.tripId,
    required this.image,
    required this.tripName,
    required this.startDate,
    required this.endDate,
    required this.route,
  });

  String tripId;
  String image;
  String tripName;
  String startDate;
  String endDate;
  List<DndRoute> route;

  factory DndTrip.fromJson(Map<String, dynamic> json) => DndTrip(
        tripId: json["tripId"],
        image: json["image"],
        tripName: json["tripName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        route:
            List<DndRoute>.from(json["route"].map((x) => DndRoute.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "image": image,
        "tripName": tripName,
        "startDate": startDate,
        "endDate": endDate,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
      };

  factory DndTrip.copy({required DndTrip obj}) {
    return DndTrip(
      tripId: obj.tripId,
      tripName: obj.tripName,
      image: obj.image,
      startDate: obj.startDate,
      endDate: obj.endDate,
      route: obj.route.map((e) => DndRoute.copy(obj: e)).toList(),
    );
  }
}

class DndRoute {
  DndRoute({
    required this.id,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.items,
  });

  String id;
  String date;
  String startTime;
  String endTime;
  List<PlaceEditable> items;

  factory DndRoute.fromJson(Map<String, dynamic> json) => DndRoute(
        id: json["id"],
        date: json["date"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        items: List<PlaceEditable>.from(
            json["items"].map((x) => PlaceEditable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "startTime": startTime,
        "endTime": endTime,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };

  factory DndRoute.copy({required DndRoute obj}) {
    return DndRoute(
      id: obj.id,
      date: obj.date,
      startTime: obj.startTime,
      endTime: obj.endTime,
      items: obj.items.map((e) => PlaceEditable.copy(obj: e)).toList(),
    );
  }
}
