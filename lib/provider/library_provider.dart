import 'package:caparrot/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class LibraryProvider extends ChangeNotifier {
  List<LibraryModel> libraries = [];

  void getData() async {
    final response = await rootBundle.loadString('data/biblioteca.json');
    List dataMap = json.decode(response);

    dataMap.forEach((value) => libraries.add(LibraryModel.fromJson(value)));
    notifyListeners();
  }
}
