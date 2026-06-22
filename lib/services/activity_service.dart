import 'package:cloud_firestore/cloud_firestore.dart';

class ActivityService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> addActivity({
    required String title,
    required String description,
  }) async {
    await _firestore.collection('activities').add({
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString(),
    });
  }

  Stream<QuerySnapshot> getActivities() {
    return _firestore
        .collection('activities')
        .snapshots();
  }
}