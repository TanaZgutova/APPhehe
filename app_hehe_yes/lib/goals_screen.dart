import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Saving Quests"), backgroundColor: Colors.green),
      body: const Center(child: Text("Complete these to get XP!")),
    );
  }
}
