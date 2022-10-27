import 'dart:convert';

Trip tripFromJson(String str) => Trip.fromJson(json.decode(str));

String tripToJson(Trip data) => json.encode(data.toJson());

class Trip {
  Trip({
    required this.tripId,
    required this.image,
    required this.tripName,
    required this.startDate,
    required this.endDate,
    required this.route,
    required this.status,
  });

  String tripId;
  String image;
  String tripName;
  String startDate;
  String endDate;
  List<Place> route;
  String status;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        tripId: json["tripId"],
        image: json["image"],
        tripName: json["tripName"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        route: List<Place>.from(json["route"].map((x) => Place.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "tripId": tripId,
        "image": image,
        "tripName": tripName,
        "startDate": startDate,
        "endDate": endDate,
        "route": List<dynamic>.from(route.map((x) => x.toJson())),
        "status": status,
      };
}

class Place {
  Place({
    required this.id,
    required this.name,
    required this.image,
    this.visited = false,
    required this.startDate,
    required this.startTime,
    required this.endDate,
    required this.endTime,
  });

  String id;
  String name;
  bool visited;
  String startDate;
  String startTime;
  String endDate;
  String endTime;
  String image;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        name: json["name"],
        visited: json["visited"] ?? false,
        startDate: json["startDate"],
        startTime: json["startTime"],
        endDate: json["endDate"],
        endTime: json["endTime"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "visited": visited,
        "startDate": startDate,
        "startTime": startTime,
        "endDate": endDate,
        "endTime": endTime,
        "image": image,
      };
}
