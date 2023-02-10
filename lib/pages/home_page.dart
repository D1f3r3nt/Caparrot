import 'dart:async';
import 'dart:math';

import 'package:caparrot/widgets/maps.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late bool _gpsEnabled;
  bool _currentLocation = false;

  StreamSubscription? _gpsSubscription;
  Position? _position;

  @override
  void initState() {
    // Para la ubicacion
    verifyGps();

    // Para el menu desplegable
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    // Para el menu desplegable
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Musica
    Provider.of<MusicProvider>(context).play2();

    final Set<Marker> markers = new Set<Marker>();
    Random rnd;

    markers.add(const Marker(
      markerId: MarkerId('Caparrot-1'),
      position: LatLng(39.7693131, 3.0239083),
    ));

    // Markers aleatorios por SaPobla
    for (int i = 0; i < 10; i++) {
      rnd = Random();
      double num = rnd.nextDouble() * (39.774562 - 39.764581) + 39.764581;
      double num2 = rnd.nextDouble() * (3.028013 - 3.019063) + 3.019063;
      markers.add(
        Marker(
            markerId: MarkerId('marker-$i'),
            position: LatLng(num, num2),
            visible: true,
            onTap: () {}),
      );
    }

    if (_currentLocation) {
      if (!_gpsEnabled) {
        return const GpsNotEnabled();
      }

      return Scaffold(
        body: SafeArea(
          child: Maps(
            markers: markers,
            position: _position!,
          ),
        ),
        floatingActionButton: AnimatedMenu(
          animation: _animation,
          animationController: _animationController,
        ),
      );
    }
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void verifyGps() async {
    dynamic _gps = await Geolocator.isLocationServiceEnabled();
    _position = await Geolocator.getCurrentPosition();

    setState(() {
      _gpsEnabled = _gps;
      _currentLocation = true;
      _gpsSubscription =
          Geolocator.getServiceStatusStream().listen((status) async {
        _gpsEnabled = status == ServiceStatus.enabled;
        _position = await Geolocator.getLastKnownPosition();
      });
    });
  }
}
