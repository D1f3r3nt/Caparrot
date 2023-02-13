import 'package:flutter/cupertino.dart';

class OkProvider extends ChangeNotifier {
  int _slectedMenuOpt = 0;

  int get slectedMenuOpt {
    return this._slectedMenuOpt;
  }

  set slectedMenuOpt(int index) {
    this._slectedMenuOpt = index;
    notifyListeners();
  }
}
