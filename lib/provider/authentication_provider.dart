import 'package:caparrot/firebase/firebase.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final _emailAuth = EmailAuth();
  final _googleAuth = GoogleAuth();

  // Email
  void emailLogin(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    await _emailAuth.logIn(
      context,
      email: email,
      password: password,
    );
    Navigator.pushReplacementNamed(context, '/');
  }

  void emailSingUp(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
  }) async {
    await _emailAuth.singUp(
      context,
      email: email,
      password: password,
      name: name,
    );
    Navigator.pushReplacementNamed(context, '/');
  }

  void emailNewPassword(BuildContext context, {required String email}) {
    _emailAuth.newPassword(context, email: email);
  }

  // Google
  void googleLogin(BuildContext context) async {
    await _googleAuth.login();
    Navigator.pushReplacementNamed(context, '/');
  }

  // Logout
  void logout(BuildContext context) async {
    await _emailAuth.logOut(context);
    await _googleAuth.logout();
    Navigator.pushReplacementNamed(context, '/');
  }
}
