import 'package:app_hehe_yes/backend/app_database.dart';
import 'package:app_hehe_yes/backend/static_data.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final UserData userData;
  final List<int> achievements;

  const ProfileScreen(
      {super.key, required this.userData, required this.achievements});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Profile"), backgroundColor: Colors.orange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your Profile",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Level: ${userData.level}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text("Achievements",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Expanded(
              child: achievements.isEmpty
                  ? Text("no Achievements yet!")
                  : ListView.builder(
                      itemCount: achievements.length,
                      itemBuilder: (context, index) {
                        final achievement =
                            AchievementList.getAchievementAt(index);
                        return Text(
                            "${achievement.name}: ${achievement.description}");
                      }),
            )
          ],
        ),
      ),
    );
  }
}
