import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GpsNotEnabled extends StatelessWidget {
  const GpsNotEnabled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Para el uso de nuestra aplicacion,es necasario acceder a su ubicacion.\nPor favor, active la ubicacion",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Geolocator.openLocationSettings();
              },
              child: const Text("Activar GPS"),
            )
          ],
        ),
      ),
    );
  }
}
