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
      content: const Text("Para acceder a la aplicacion, deberá ir a ajustes"
          "y autorizar ubicacion de manera manual."),
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
