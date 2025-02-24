import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final int level;
  final int xp;
  final List<String> achievements;

  const ProfileScreen({super.key, required this.level, required this.xp, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your Profile", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Level: $level", style: const TextStyle(fontSize: 20)),
            Text("XP: $xp/100", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            const Text("Achievements", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ...achievements.map((achievement) => Text("🏆 $achievement")),
          ],
        ),
      ),
    );
  }
}
