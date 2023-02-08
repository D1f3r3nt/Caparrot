import 'dart:async';
import 'dart:math';

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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late bool _gpsEnabled;
  late Widget cargar;
  bool loading = false;

  StreamSubscription? _gpsSubscription;
  Position? _initialPosition;

  @override
  void initState() {
    verifyGps();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Provider.of<MusicProvider>(context).play2();

    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();
    Set<Marker> markers = new Set<Marker>();

    markers.add(Marker(
        markerId: MarkerId('marker-99'),
        position: LatLng(39.7693131, 3.0239083)));

    Random rnd;

    for (int i = 0; i < 10; i++) {
      rnd = new Random();
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

    if (!loading) {
      cargar = Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      if (!_gpsEnabled) {
        gpsNotActive();
      }
      //_declareInitialPosition();
      cargar = Scaffold(
        body: SafeArea(
          child: GoogleMap(
            markers: markers,
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
                target: LatLng(30, 33),
                zoom: 18, tilt: 60),
            onMapCreated: (GoogleMapController controller) {
              setState(() {});
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
    return cargar;
  }

  Center gpsNotActive() {
    return Center(
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
              turnOnGPS();
            },
            child: const Text("Activar GPS"),
          )
        ],
      ),
    );
  }

  void verifyGps() async {
    _gpsEnabled = await Geolocator.isLocationServiceEnabled();
    loading = true;
    _gpsSubscription = Geolocator.getServiceStatusStream().listen(
      (status) async {
        _gpsEnabled = status == ServiceStatus.enabled;
        _initialPosition = await Geolocator.getLastKnownPosition();
      },
    );
  }

  Future<Position> _declareInitialPosition() async {
    _initialPosition = await Geolocator.getCurrentPosition();
    return _initialPosition!;
  }

  Future<void> turnOnGPS() => Geolocator.openLocationSettings();
}
