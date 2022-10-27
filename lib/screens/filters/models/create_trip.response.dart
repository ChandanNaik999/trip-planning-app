import 'dart:convert';

CreateTripResponse createTripResponseFromJson(String str) =>
    CreateTripResponse.fromJson(json.decode(str));

String createTripResponseToJson(CreateTripResponse data) =>
    json.encode(data.toJson());

class CreateTripResponse {
  CreateTripResponse({
    required this.places,
    required this.trips,
  });

  Map<String, PlaceDetails> places;
  List<Trip> trips;

  factory CreateTripResponse.fromJson(Map<String, dynamic> json) =>
      CreateTripResponse(
        places: Map.from(json["places"]).map((k, v) =>
            MapEntry<String, PlaceDetails>(k, PlaceDetails.fromJson(v))),
        trips: List<Trip>.from(json["trips"].map((x) => Trip.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "places": Map.from(places)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "trips": List<dynamic>.from(trips.map((x) => x.toJson())),
      };
}

class PlaceDetails {
  PlaceDetails({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  factory PlaceDetails.fromJson(Map<String, dynamic> json) => PlaceDetails(
        id: json["id"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
      };
}

class Trip {
  Trip({
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
  List<PlaceEditable> route;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        tripId: json["tripId"],
        image: json["image"],
        tripName: json["tripName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        route: List<PlaceEditable>.from(
            json["route"].map((x) => PlaceEditable.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "image": image,
        "tripName": tripName,
        "startDate": startDate,
        "endDate": endDate,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
      };
}

class PlaceEditable {
  PlaceEditable({
    required this.id,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
  });

  String id;
  String startDate;
  String startTime;
  String endDate;
  String endTime;

  factory PlaceEditable.fromJson(Map<String, dynamic> json) => PlaceEditable(
        id: json["id"],
        startDate: json["startDate"],
        startTime: json["startTime"],
        endDate: json["endDate"],
        endTime: json["endTime"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "startDate": startDate,
        "startTime": startTime,
        "endDate": endDate,
        "endTime": endTime,
      };

  factory PlaceEditable.copy({required PlaceEditable obj}) {
    return PlaceEditable(
      id: obj.id,
      startDate: obj.startDate,
      startTime: obj.startTime,
      endDate: obj.endDate,
      endTime: obj.endTime,
    );
  }
}
