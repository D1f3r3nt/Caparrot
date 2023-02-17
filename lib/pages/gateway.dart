import 'package:caparrot/preferences/preferences.dart';
import 'package:caparrot/provider/provider.dart';
import 'package:caparrot/utils/utils.dart';
import 'package:caparrot/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Gateway extends StatelessWidget {
  const Gateway({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (FirebaseAuth.instance.currentUser == null) {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        home(context);
      }
    });

    return Scaffold(
      backgroundColor: Palete.green70,
      body: LoadingPage(),
    );
  }

  void home(BuildContext context) async {
    final _controller = Provider.of<SplashProvider>(context, listen: false);

    // Tutorial
    if (Preferences.isFirstTime) {
      Navigator.pushReplacementNamed(context, 'tutorial');
      return;
    }

    await _controller.checkPermission();
    // Para cambiar la musica entre paginas
    if (_controller.routeName! == 'home') {
      Provider.of<MusicProvider>(context, listen: false).play2();
    }
    Navigator.pushReplacementNamed(context, _controller.routeName!);
  }
}
