import 'package:caparrot/firebase/database/achievements_db.dart';
import 'package:caparrot/firebase/database/library_db.dart';
import 'package:caparrot/firebase/database/users_db.dart';

import 'package:caparrot/models/models.dart';
import 'package:flutter/material.dart';

import '../models/library_model.dart';

class FirebaseCrudProvider extends ChangeNotifier {
  final AchievementsDb _achievementsDb = AchievementsDb();
  final UsersDb _usersDb = UsersDb();
  final LibraryDb _libraryDb = LibraryDb();

  List<AchievementModel> achievemets = [];
  List<LibraryModel> librarys = [];
  UserModel? user;

  void getAchievements() async {
    achievemets = await _achievementsDb.getAchievements();
    notifyListeners();
  }

  void getLibrarys() async {
    librarys = await _libraryDb.getLibraries();
    notifyListeners();
  }

  void getUser() async {
    user = await _usersDb.getUserById();
    notifyListeners();
  }

  void logout() {
    user = null;
  }

  void addHead(HeadModel model) {
    _usersDb.addHead(user!, model);
  }

  void addLibrary(LibraryModel model) {
    _usersDb.addLibrary(user!, model);
  }
}
