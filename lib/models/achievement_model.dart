import 'package:caparrot/models/models.dart';

class AchievementModel {
  AchievementModel({
    required this.image,
    required this.description,
    required this.title,
    required this.id,
  });

  String image;
  String description;
  String title;
  int id;

  factory AchievementModel.fromRawJson(String str) =>
      AchievementModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      AchievementModel(
          image: json["image"],
          description: json["description"],
          title: json["title"],
          id: json["id"]);

  Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
        "title": title,
        "id": id,
      };
}
