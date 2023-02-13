import 'package:caparrot/firebase/database/achievements_db.dart';
import 'package:caparrot/firebase/database/users_db.dart';
import 'package:caparrot/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseCrudProvider extends ChangeNotifier {
  final AchievementsDb _achievementsDb = AchievementsDb();
  final UsersDb _usersDb = UsersDb();

  List<AchievementModel> achievemets = [];

  void getAchievements() async {
    achievemets = await _achievementsDb.getAchievements();
    _usersDb.getUserById();
    notifyListeners();
  }
}
