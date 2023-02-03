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
