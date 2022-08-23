// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Firstfour> usersFromJson(String str) => List<Firstfour>.from(json.decode(str).map((x) => Firstfour.fromJson(x)));

String usersToJson(List<Firstfour> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Firstfour {
  Firstfour({
    required this.group,
    required this.studentnumber,
  });

  String group;
  String studentnumber;

  factory Firstfour.fromJson(Map<String, dynamic> json) => Firstfour(
    group: json["group"],
    studentnumber: json["studentnumber"],
  );

  Map<String, dynamic> toJson() => {
    "group": group,
    "studentnumber": studentnumber,
  };
}
