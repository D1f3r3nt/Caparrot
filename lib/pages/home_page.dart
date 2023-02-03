import 'dart:async';

import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  // Posicion del ayuntamiento de SA Pobla
  final CameraPosition _puntInicial = CameraPosition(
    target: LatLng(39.7693131, 3.0239083),
    zoom: 18,
    tilt: 60,
  );

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _puntInicial,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
      floatingActionButton: AnimatedMenu(
        animation: _animation,
        animationController: _animationController,
      ),
    );
  }
}
