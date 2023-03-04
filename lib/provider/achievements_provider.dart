import 'package:caparrot/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;

class AchievementsProvider extends ChangeNotifier {
  List<AchievementModel> achievements = [];

  void getData() async {
    final response = await rootBundle.loadString('data/logros.json');
    List dataMap = json.decode(response);

    dataMap
        .forEach((value) => achievements.add(AchievementModel.fromJson(value)));

    notifyListeners();
  }
}
