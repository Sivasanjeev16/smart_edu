import 'package:flutter/material.dart';
import 'mark_attendance_screen.dart';
import 'add_activity_screen.dart';
import 'reports_screen.dart';
import '../../services/session_service.dart';

class TeacherDashboard extends StatelessWidget {
  const TeacherDashboard({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Dashboard"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Card(
              child: ListTile(
                leading: const Icon(Icons.check),
                title: const Text("Mark Attendance"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const MarkAttendanceScreen(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.add),
                title: const Text("Add Activity"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const AddActivityScreen(),
                    ),
                  );
                },
              ),
            ),

            Card(
              child: ListTile(
                leading: const Icon(Icons.bar_chart),
                title: const Text("Reports"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ReportsScreen(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}