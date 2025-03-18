import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Saving Quests"),
          backgroundColor: const Color.fromARGB(255, 147, 179, 85)),
      body: const Center(child: Text("Complete these to get XP!")),
    );
  }
}
