import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  final Function completeChallenge;
  
  const ChallengesScreen({super.key, required this.completeChallenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Challenges"), backgroundColor: Colors.teal),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Complete these challenges to earn XP!", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ChallengeTile(title: "Save \$50 this week", completeChallenge: completeChallenge),
          ChallengeTile(title: "Spend less than \$10 today", completeChallenge: completeChallenge),
          ChallengeTile(title: "Avoid eating out for 3 days", completeChallenge: completeChallenge),
        ],
      ),
    );
  }
}

class ChallengeTile extends StatelessWidget {
  final String title;
  final Function completeChallenge;

  const ChallengeTile({super.key, required this.title, required this.completeChallenge});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: ElevatedButton(
        onPressed: () {
          completeChallenge(title);
        },
        child: const Text("Complete"),
      ),
    );
  }
}
