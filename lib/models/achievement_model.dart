import 'package:meta/meta.dart';
import 'dart:convert';

class AchievementModel {
  AchievementModel({
    required this.image,
    required this.description,
    required this.title,
  });

  String image;
  String description;
  String title;

  factory AchievementModel.fromRawJson(String str) =>
      AchievementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      AchievementModel(
        image: json["image"],
        description: json["description"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
        "title": title,
      };
}
