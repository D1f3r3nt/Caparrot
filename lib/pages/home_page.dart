import 'dart:async';
import 'dart:math';

import 'package:caparrot/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../provider/provider.dart';

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

  late GoogleMapController _con;

  @override
  void initState() {
    addmarker();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  changeMapMode() {
    getJsonFile("assets/map_style.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _con.setMapStyle(mapStyle);
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
    Provider.of<MusicProvider>(context).play2();

    final Completer<GoogleMapController> _controller =
        Completer<GoogleMapController>();

    if (Provider.of<OkProvider>(context).slectedMenuOpt == 1) {
      return Scaffold(
        body: SafeArea(
          child: GoogleMap(
            markers: markerse,
            compassEnabled: false,
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            mapType: MapType.normal,
            initialCameraPosition: _puntInicial,
            onMapCreated: (GoogleMapController controller) {
              _con = controller;
              setState(() {});
              _controller.complete(controller);
              changeMapMode();
            },
          ),
        ),
        floatingActionButton: AnimatedMenu(
          animation: _animation,
          animationController: _animationController,
        ),
      );
    } else {
      return Scaffold(body: Container());
    }
  }
}
