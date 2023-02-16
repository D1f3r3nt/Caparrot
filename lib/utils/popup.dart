import 'package:caparrot/models/achievement_model.dart';
import 'package:caparrot/models/library_model.dart';
import 'package:caparrot/utils/palete.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';

void popUpCredits(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Pau casesnoves', textAlign: TextAlign.center),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text('Joan Manel Ramirez Cuart'),
                SizedBox(height: 5),
                Text('Antonio Mármol Crespillo'),
                SizedBox(height: 5),
                Text('Andrés Muñoz Pérez'),
                SizedBox(height: 5),
                Text('Marc Santisteban Ruiz'),
                SizedBox(height: 5),
                Text('Daniel Sayago González'),
              ],
            ),
          ));
}

bool popUpUbi(BuildContext context, dynamic function) {
  bool response = false;

  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("No se pudo recuperar la ubicacion."),
      content: const Text(
          "Para acceder a la aplicacion, deberá ir a ajustes y autorizar ubicacion de manera manual."),
      actions: [
        TextButton(
            onPressed: () async {
              Navigator.pop(context);
              response = await function;
            },
            child: const Text("Ajustes")),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancelar"))
      ],
    ),
  );

  return response;
}

void popUpLibrary(BuildContext context, LibraryModel model) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Palete.white90,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              model.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void popUpAchievements(BuildContext context, AchievementModel model) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Palete.white90,
        title: CardLogro(model: model, has: true),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              model.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              model.description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 15,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void popUpTest(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Palete.white90,
        title: const Center(
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/jepeto.png'),
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Jepeto',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'En que año se construyo el ayuntamiento?',
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Palete.black90,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            TypeTest(),
          ],
        ),
      );
    },
  );
}
