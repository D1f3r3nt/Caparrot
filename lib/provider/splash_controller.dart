import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart'; //Solo importa ChNo
import 'package:permission_handler/permission_handler.dart';

//Si localizacion ha sido aceptada envia directo a login
class SplashController extends ChangeNotifier {
  final Permission _locationPermission = Permission.locationWhenInUse;
  String? _routeName;

  SplashController();

  Future<void> checkPermission() async {
    final isGranted = await _locationPermission.isGranted;
    _routeName = isGranted ? 'home' : 'location_permission';
  }

  String? get routeName => _routeName;
}
