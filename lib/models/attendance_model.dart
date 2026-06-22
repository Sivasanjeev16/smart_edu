class AttendanceModel {
  final String studentId;
  final String date;
  final String status;

  AttendanceModel({
    required this.studentId,
    required this.date,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'studentId': studentId,
      'date': date,
      'status': status,
    };
  }
}