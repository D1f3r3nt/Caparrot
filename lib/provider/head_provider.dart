import 'dart:convert';

import 'package:caparrot/models/head_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class HeadProvider extends ChangeNotifier {
  List<HeadModel> heads = [];

  void getData() async {
    final response = await rootBundle.loadString('data/heads.json');
    List dataMap = json.decode(response);

    dataMap.forEach((value) => heads.add(HeadModel.fromMap(value)));
    notifyListeners();
  }
}
