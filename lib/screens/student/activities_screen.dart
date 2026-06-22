import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activities"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.event),
              title: Text("AI Workshop"),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text("Coding Contest"),
            ),
          ],
        ),
      ),
    );
  }
}