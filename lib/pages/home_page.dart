import 'dart:async';
import 'dart:math';

import 'package:caparrot/widgets/maps.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late Animation<double> _animation;
  late AnimationController _animationController;
  late bool _gpsEnabled;
  bool _currentLocation = false;

  StreamSubscription? _gpsSubscription;
  Position? _position;

  late AppLifecycleState appLifecycleState;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    appLifecycleState = state;
    setState(() {});
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.paused) {
      Provider.of<MusicProvider>(context, listen: false).pauseMusic();
    }

    if (state == AppLifecycleState.resumed) {
      Provider.of<MusicProvider>(context, listen: false).resumeMusic();
    }
  }

  @override
  void initState() {
    addmarker();
    WidgetsBinding.instance.addObserver(this);
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

  Set<Marker> markerse = new Set<Marker>();

  void addmarker() async {
    var icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/grouxo.png', width: 200));

    markerse.add(Marker(
        markerId: MarkerId('Groucho'),
        position: LatLng(39.769769, 3.024726),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/pallaso1.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('Pallaso1'),
        position: LatLng(39.767288, 3.019917),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/moro1.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('moro1'),
        position: LatLng(39.772571, 3.017440),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/pallaso2.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('pallaso2.png'),
        position: LatLng(39.766295, 3.028885),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/moro2.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('moro2'),
        position: LatLng(39.774360, 3.026629),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/jepeto.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('jepeto'),
        position: LatLng(39.7723900, 3.0142323),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/turco.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('turco'),
        position: LatLng(39.7719045, 3.0304000),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/guardia.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('guardia'),
        position: LatLng(39.770432, 3.028005),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/guardia2.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('guardia2'),
        position: LatLng(39.773200, 3.015913),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/marx1.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('marx1'),
        position: LatLng(39.772593, 3.023394),
        visible: true,
        icon: icon,
        onTap: () {}));
    icon = BitmapDescriptor.fromBytes(
        await assetToBytes('assets/marx2.png', width: 200));
    markerse.add(Marker(
        markerId: MarkerId('marx2'),
        position: LatLng(39.767952, 3.017169),
        visible: true,
        icon: icon,
        onTap: () {}));
    Provider.of<OkProvider>(context, listen: false).slectedMenuOpt = 1;
  }

  @override
  Widget build(BuildContext context) {
    // Musica
    Provider.of<MusicProvider>(context).play2();
    // Progreso
    Provider.of<FirebaseCrudProvider>(context).getUser();

    Random rnd;

    addmarker();

    // Markers aleatorios por SaPobla
    /*for (int i = 0; i < 10; i++) {
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
    }*/

    if (_currentLocation) {
      if (!_gpsEnabled) {
        return const GpsNotEnabled();
      }

      return Scaffold(
        body: SafeArea(
          child: Maps(
            markers: markerse,
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
