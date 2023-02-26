import 'package:caparrot/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class EmailAuth {
  Future<void> singUp(
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

  Future<void> logIn(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Snackbar.errorSnackbar(context, 'Usuari no encontrat');
      } else if (e.code == 'wrong-password') {
        Snackbar.errorSnackbar(context, 'Contraseña incorrecte');
      }
    }
  }

  Future<void> logOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      print('Email error: $e');
    }
  }

  Future<void> newPassword(BuildContext context,
      {required String email}) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Snackbar.correctSnackbar(
      context,
      'Se ha enviado un email con los pasos a seguir, revise su bandeja de entrada',
    );
  }
}
