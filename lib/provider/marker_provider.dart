import 'package:flutter/material.dart';

class MarkerProvider extends ChangeNotifier {
  int _markers = 0;

  int get markers {
    return _markers;
  }

  set markers(int index) {
    _markers = index;
    notifyListeners();
  }
}
