import 'dart:convert';

FilterModel tripsFromJson(String str) => FilterModel.fromJson(json.decode(str));

String tripsToJson(FilterModel data) => json.encode(data.toJson());

class FilterModel {
  FilterModel({
    this.place,
    this.category,
    this.noOfPeople,
    this.startDate,
    this.startTime,
    this.endDate,
    this.endTime,
    this.startPlace,
    this.endPlace,
  });

  String? place;
  String? category;
  int? noOfPeople;
  String? startDate;
  String? startTime;
  String? endDate;
  String? endTime;
  String? startPlace;
  String? endPlace;

  factory FilterModel.fromJson(Map<String, dynamic> json) => FilterModel(
        place: json["place"],
        category: json["category"],
        noOfPeople: json["noOfPeople"],
        startDate: json["startDate"],
        startTime: json["startTime"],
        endDate: json["endDate"],
        endTime: json["endTime"],
        startPlace: json["startPlace"],
        endPlace: json["endPlace"],
      );

  Map<String, dynamic> toJson() => {
        "place": place,
        "category": category,
        "noOfPeople": noOfPeople,
        "startDate": startDate,
        "startTime": startTime,
        "endDate": endDate,
        "endTime": endTime,
        "startPlace": startPlace,
        "endPlace": endPlace,
      };
}
