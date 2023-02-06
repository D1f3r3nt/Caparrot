import 'package:caparrot/utils/utils.dart';
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
        Navigator.pushReplacementNamed(context, 'home');
      }
    });

    return Scaffold(
      backgroundColor: Palete.green70,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/escudo.png'),
              fit: BoxFit.cover,
              opacity: 0.5,
            ),
          ),
          child: Center(
            child: CircularProgressIndicator(
              color: Palete.black90,
            ),
          ),
        ),
      ),
    );
  }
}
