import 'package:caparrot/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AchievementsDb {
  late FirebaseFirestore _db;
  late CollectionReference _collection;

  AchievementsDb() {
    _db = FirebaseFirestore.instance;
    _collection = _db.collection('logros');
  }

  Future<List<AchievementModel>> getAchievements() async {
    QuerySnapshot snapshot = await _collection.get();
    return snapshot.docs
        .map((doc) =>
            AchievementModel.fromJson(doc.data() as Map<String, dynamic>))
        .toList();
  }
}
