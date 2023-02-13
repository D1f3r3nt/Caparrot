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

  Future<List<UserModel>> getUserById() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot snapshot =
        await _collection.where('userId', isEqualTo: 'aaa').get();

    return snapshot.docs
        .map((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
