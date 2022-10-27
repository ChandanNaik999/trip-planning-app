import 'dart:convert';

import '../../filters/models/create_trip.response.dart';

SaveTripRequest saveTripRequestFromJson(String str) =>
    SaveTripRequest.fromJson(json.decode(str));

String saveTripRequestToJson(SaveTripRequest data) =>
    json.encode(data.toJson());

class SaveTripRequest {
  SaveTripRequest({
    required this.places,
    required this.trip,
  });

  Map<String, PlaceDetails> places;
  Trip trip;

  factory SaveTripRequest.fromJson(Map<String, dynamic> json) =>
      SaveTripRequest(
        places: Map.from(json["places"]).map((k, v) =>
            MapEntry<String, PlaceDetails>(k, PlaceDetails.fromJson(v))),
        trip: Trip.fromJson(json["trip"]),
      );

  Map<String, dynamic> toJson() => {
        "places": Map.from(places)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trip": trip.toJson(),
      };
}
