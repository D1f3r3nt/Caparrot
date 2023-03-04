import 'package:caparrot/firebase/database/users_db.dart';

import 'package:caparrot/models/models.dart';
import 'package:flutter/material.dart';

import '../models/library_model.dart';

class FirebaseCrudProvider extends ChangeNotifier {
  final UsersDb _usersDb = UsersDb();

  List<AchievementModel> achievemets = [];
  List<LibraryModel> librarys = [];
  UserModel? user;

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
