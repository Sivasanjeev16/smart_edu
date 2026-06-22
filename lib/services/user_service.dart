import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> createUser({
    required String uid,
    required String name,
    required String email,
    required String role,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'role': role,
      'createdAt': Timestamp.now(),
    });
  }

  Future<DocumentSnapshot> getUser(String uid) async {
    return await _firestore
        .collection('users')
        .doc(uid)
        .get();
  }
}