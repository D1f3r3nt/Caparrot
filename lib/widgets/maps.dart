import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  Position position;
  Set<Marker> markers;

  Maps({
    required this.position,
    required this.markers,
  });

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late CameraPosition _myPosition;
  GoogleMapController? _controller;
  bool _modifyPosition = true;

  @override
  void initState() {
    super.initState();
    listenUbi();
  }

  @override
  Widget build(BuildContext context) {
    _myPosition = CameraPosition(
      target: LatLng(widget.position.latitude, widget.position.longitude),
      zoom: 18,
      tilt: 60,
    );

    return Stack(
      children: [
        GoogleMap(
          markers: widget.markers,
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _myPosition,
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          compassEnabled: false,
          onMapCreated: (GoogleMapController controller) => setState(() {
            _controller = controller;
            changeMapMode();
          }),
          onTap: (_) => setState(() {
            _modifyPosition = false;
          }),
        ),
        FloatingActionButton.small(
          onPressed: () async {
            Position pos = await Geolocator.getCurrentPosition();

            setState(() {
              if (_controller != null) {
                _controller!.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(pos.latitude, pos.longitude),
                    zoom: 18,
                    tilt: 60,
                  ),
                ));
              }
              _modifyPosition = true;
            });
          },
          child: const Icon(Icons.person_pin_circle_outlined),
        )
      ],
    );
  }

  changeMapMode() {
    getJsonFile("assets/map_style.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller!.setMapStyle(mapStyle);
  }

  void listenUbi() {
    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 20,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position? position) {
      if (position != null && _controller != null && _modifyPosition) {
        _controller!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 18,
            tilt: 60,
          ),
        ));
      }
    });
  }
}
