import 'dart:convert';

class HeadModel {
  HeadModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.markerImage,
    required this.tresD,
    required this.image,
    required this.historia,
    required this.pregunta,
    required this.respuestas,
    required this.indexRespuesta,
    required this.headModelContinue,
  });

  String name;
  double latitude;
  double longitude;
  String markerImage;
  String tresD;
  String image;
  String historia;
  String pregunta;
  List<String> respuestas;
  int indexRespuesta;
  String headModelContinue;

  factory HeadModel.fromJson(String str) => HeadModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory HeadModel.fromMap(Map<String, dynamic> json) => HeadModel(
        name: json["name"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        markerImage: json["markerImage"],
        tresD: json["tresD"],
        image: json["image"],
        historia: json["historia"],
        pregunta: json["pregunta"],
        respuestas: List<String>.from(json["respuestas"].map((x) => x)),
        indexRespuesta: json["indexRespuesta"],
        headModelContinue: json["continue"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "markerImage": markerImage,
        "tresD": tresD,
        "image": image,
        "historia": historia,
        "pregunta": pregunta,
        "respuestas": List<dynamic>.from(respuestas.map((x) => x)),
        "indexRespuesta": indexRespuesta,
        "continue": headModelContinue,
      };
}
