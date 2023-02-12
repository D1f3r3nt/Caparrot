import 'package:caparrot/firebase/database/achievements_db.dart';
import 'package:caparrot/models/models.dart';
import 'package:flutter/material.dart';

class FirebaseCrudProvider extends ChangeNotifier {
  final AchievementsDb _achievementsDb = AchievementsDb();

  List<AchievementModel> achievemets = [];

  void getAchievements() async {
    achievemets = await _achievementsDb.getAchievements();
    notifyListeners();
  }
}
