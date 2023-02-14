import 'package:caparrot/models/models.dart';
import 'package:caparrot/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UsersDb {
  late FirebaseFirestore _db;
  late CollectionReference _collection;

  UsersDb() {
    _db = FirebaseFirestore.instance;
    _collection = _db.collection('users');
  }

  Future<UserModel> getUserById() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot snapshot =
        await _collection.where('userId', isEqualTo: currentUser!.uid).get();

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
    var newUser = UserModel(userId: id, logros: [], caparrots: []);
    await _collection.add(newUser.toJson());
  }
}
