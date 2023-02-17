import 'package:caparrot/models/library_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LibraryDb {
  late FirebaseFirestore _db;
  late CollectionReference _collection;

  LibraryDb() {
    _db = FirebaseFirestore.instance;
    _collection = _db.collection('biblioteca');
  }

  Future<List<LibraryModel>> getLibraries() async {
    QuerySnapshot snapshot = await _collection.get();
    return snapshot.docs
        .map((doc) => LibraryModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
