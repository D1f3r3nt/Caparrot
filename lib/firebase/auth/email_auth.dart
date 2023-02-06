import 'package:caparrot/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EmailAuth {
  static void singUp(
    BuildContext context, {
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      credential.user!.updateDisplayName(name);

      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Snackbar.errorSnackbar(context, 'La contrasenya es masa débil');
      } else if (e.code == 'email-already-in-use') {
        Snackbar.errorSnackbar(context, 'Aquest email ya existeix');
      }
    } catch (e) {
      print(e);
    }
  }

  static void logIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Snackbar.errorSnackbar(context, 'Usuari no encontrat');
      } else if (e.code == 'wrong-password') {
        Snackbar.errorSnackbar(context, 'Contraseña incorrecte');
      }
    }
  }

  static void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacementNamed(context, '/');
  }

  static void newPassword(BuildContext context, {required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Snackbar.correctSnackbar(
        context, 'Se ha enviado un email con los pasos a seguir');
  }
}
