import 'package:app_hehe_yes/backend/app_database.dart';
import 'package:app_hehe_yes/backend/static_data.dart';
import 'package:flutter/material.dart';

class ChallengesScreen extends StatelessWidget {
  final UserData user;
  final List<int> achivements;
  const ChallengesScreen(
      {super.key, required this.user, required this.achivements});

  void _completeChallenge(int index) async {
    final db = AppDatabase();
    await db.insertAchievement(
        AchievementsCompanion.insert(
            achievementIndex: index, userID: user.userID),
        user.userID);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Challenges"), backgroundColor: Colors.teal),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Complete these challenges to earn XP!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                final achIdx = 5 * (user.level - 1) + index;
                return ChallengeTile(
                  index: achIdx,
                  completeChallenge: _completeChallenge,
                  data: AchievementList.getAchievementAt(achIdx),
                  complete: achivements.contains(achIdx),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class ChallengeTile extends StatefulWidget {
  final int index;
  final Function completeChallenge;
  final AchievementData data;
  final bool complete;

  const ChallengeTile({
    super.key,
    required this.index,
    required this.completeChallenge,
    required this.data,
    this.complete = false,
  });
  @override
  ChallengeTileState createState() => ChallengeTileState();
}

class ChallengeTileState extends State<ChallengeTile> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    if (widget.complete) {
      isFinished = true;
    }

    return ListTile(
      title: Text(widget.data.name),
      trailing: ElevatedButton(
        onPressed: () {
          if (isFinished) {
            return;
          }
          widget.completeChallenge(widget.index);
          setState(() {
            isFinished = true;
          });
        },
        child: Text(isFinished ? "Complete" : "notComplete"),
      ),
    );
  }
}
