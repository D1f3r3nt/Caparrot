import 'package:caparrot/models/models.dart';

class UserModel {
  UserModel({
    required this.userId,
    required this.caparrots,
    required this.logros,
    required this.biblioteca,
  });

  String userId;
  List<int> caparrots;
  List<int> logros;
  List<int> biblioteca;

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        caparrots: List<int>.from(json["caparrots"].map((x) => x)),
        logros: List<int>.from(json["logros"].map((x) => x)),
        biblioteca: List<int>.from(json["biblioteca"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "caparrots": List<dynamic>.from(caparrots.map((x) => x)),
        "logros": List<dynamic>.from(logros.map((x) => x)),
        "biblioteca": List<dynamic>.from(biblioteca.map((x) => x)),
      };

  UserModel copy() => UserModel(
        userId: userId,
        caparrots: caparrots,
        logros: logros,
        biblioteca: biblioteca,
      );
}
