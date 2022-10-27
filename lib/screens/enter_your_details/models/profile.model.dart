import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.name,
    required this.dob,
  });

  String name;
  String dob;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json['name'],
        dob: json['dob'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'dob': dob,
      };
}
