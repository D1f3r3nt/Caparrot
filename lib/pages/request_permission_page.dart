import 'dart:async';

import 'package:caparrot/utils/request_permission_controller.dart';
import 'package:caparrot/utils/popup.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RequestPermissionPage extends StatefulWidget {
  const RequestPermissionPage({Key? key}) : super(key: key);

  @override
  State<RequestPermissionPage> createState() => _RequestPermissionPageState();
}

class _RequestPermissionPageState extends State<RequestPermissionPage>
    with WidgetsBindingObserver {
  //Instancia clase RequestPermissionController
  final _controller = RequestPermissionController();
  late StreamSubscription _subscription;
  bool _fromSettings = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    _controller.request();

    _subscription = _controller.onStatusChanged.listen((status) {
      if (status == PermissionStatus.granted) {
        Future.delayed(Duration.zero,
            () => Navigator.pushReplacementNamed(context, 'home'));
      } else {
        _fromSettings = popUpUbi(context, openAppSettings());
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && _fromSettings) {
      final status = await _controller.check();
      if (status == PermissionStatus.granted) {
        Navigator.pushReplacementNamed(context, 'home');
      }
    }
    _fromSettings = false;
  }

  //Eliminar recursos
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subscription.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          color: Colors.greenAccent,
        ),
      ),
    );
  }
}
