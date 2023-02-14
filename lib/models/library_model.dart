import 'package:caparrot/models/models.dart';

class LibraryModel {
  LibraryModel({
    required this.image,
    required this.description,
    required this.title,
  });

  String image;
  String description;
  String title;

  factory LibraryModel.fromRawJson(String str) =>
      LibraryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LibraryModel.fromJson(Map<String, dynamic> json) => LibraryModel(
      image: json["image"],
      description: json["description"],
      title: json["title"]);

  Map<String, dynamic> toJson() => {
        "image": image,
        "description": description,
        "title": title,
      };
}
