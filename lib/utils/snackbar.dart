import 'package:caparrot/utils/palete.dart';
import 'package:flutter/material.dart';

class Snackbar {
  static void errorSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Palete.white20,
            ),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }

  static void correctSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.green,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done,
              color: Palete.white20,
            ),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}
