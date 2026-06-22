import 'package:flutter/material.dart';

class AddActivityScreen extends StatelessWidget {
  const AddActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Activity"),
      ),
      body: const Center(
        child: Text("Add Activity"),
      ),
    );
  }
}