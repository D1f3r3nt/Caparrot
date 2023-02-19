import 'package:caparrot/models/head_model.dart';
import 'package:caparrot/models/library_model.dart';
import 'package:caparrot/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersDb {
  late FirebaseFirestore _db;
  late CollectionReference _collection;

  UsersDb() {
    _db = FirebaseFirestore.instance;
    _collection = _db.collection('users');
  }

  Future<UserModel?> getUserById() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) return null;

    QuerySnapshot snapshot =
        await _collection.where('userId', isEqualTo: currentUser.uid).get();

    if (snapshot.size == 0) {
      _crateUser(currentUser.uid);
      snapshot =
          await _collection.where('userId', isEqualTo: currentUser.uid).get();
    }

    return snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList()
        .first;
  }

  void _crateUser(dynamic id) async {
    var newUser =
        UserModel(userId: id, logros: [], caparrots: [], biblioteca: []);
    await _collection.add(newUser.toJson());
  }

  void _addAchievement(
    UserModel model,
    int id,
  ) async {
    UserModel modify = model.copy();

    if (modify.logros.contains(id)) return;

    modify.logros.add(id);

    QuerySnapshot querySnapshot =
        await _collection.where('userId', isEqualTo: model.userId).get();
    DocumentReference doc = querySnapshot.docs[0].reference;

    await doc.update(modify.toJson());
  }

  void addHead(
    UserModel model,
    HeadModel headModel,
  ) async {
    UserModel modify = model.copy();

    if (modify.caparrots.contains(headModel.id)) return;

    modify.caparrots.add(headModel.id);

    if (modify.caparrots.length == 1) {
      // Logro de primer caparrot ID 1
      _addAchievement(model, 1);
    } else if (modify.caparrots.length == 5) {
      // Logro de cinco caparrots ID 2
      _addAchievement(model, 2);
    } else if (modify.caparrots.length == 11) {
      // Logro de todos los caparrots ID 3
      _addAchievement(model, 3);
      // Fin del juego
      if (modify.biblioteca.length == 7) _addAchievement(model, 7);
    }

    QuerySnapshot querySnapshot =
        await _collection.where('userId', isEqualTo: model.userId).get();
    DocumentReference doc = querySnapshot.docs[0].reference;

    await doc.update(modify.toJson());
  }

  void addLibrary(
    UserModel model,
    LibraryModel libraryModel,
  ) async {
    UserModel modify = model.copy();

    if (modify.biblioteca.contains(libraryModel.id)) return;

    modify.biblioteca.add(libraryModel.id);

    if (modify.biblioteca.length == 1) {
      // Logro de primera historia ID 4
      _addAchievement(model, 4);
    } else if (modify.biblioteca.length == 5) {
      // Logro de quinta historia ID 5
      _addAchievement(model, 5);
    } else if (modify.biblioteca.length == 7) {
      // Logro de todas las historias ID 6
      _addAchievement(model, 6);
      // Fin del juego
      if (modify.caparrots.length == 11) _addAchievement(model, 7);
    }

    QuerySnapshot querySnapshot =
        await _collection.where('userId', isEqualTo: model.userId).get();
    DocumentReference doc = querySnapshot.docs[0].reference;

    await doc.update(modify.toJson());
  }
}
