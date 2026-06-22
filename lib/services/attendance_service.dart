import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceService {
  final FirebaseFirestore _firestore =
      FirebaseFirestore.instance;

  Future<void> addAttendance({
    required String studentId,
    required String studentName,
    required String status,
  }) async {
    await _firestore.collection('attendance').add({
      'studentId': studentId,
      'studentName': studentName,
      'status': status,
      'date': DateTime.now().toString(),
    });
  }

  Stream<QuerySnapshot> getAttendance() {
    return _firestore
        .collection('attendance')
        .snapshots();
  }
}