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

  void home(BuildContext context) {
    final _controller = Provider.of<SplashController>(context);

    WidgetsBinding.instance
        .addPostFrameCallback((_) => _controller.checkPermission());

    _controller.addListener(() {
      if (_controller.routeName != null) {
        Navigator.pushReplacementNamed(context, _controller.routeName!);
      }
    });
  }
}
