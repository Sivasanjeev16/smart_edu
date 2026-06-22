import 'package:flutter/material.dart';

class MarkAttendanceScreen extends StatelessWidget {
  const MarkAttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mark Attendance"),
      ),
      body: const Center(
        child: Text("Attendance Management"),
      ),
    );
  }
}