import 'package:flutter/material.dart';
import 'budget_screen.dart';
import 'challenges_screen.dart';
import 'stats_screen.dart';
import 'history_screen.dart';
import 'goals_screen.dart';
import 'profile_screen.dart';
import 'income_screen.dart';
import 'expense_screen.dart';
import 'settings_screen.dart';
import 'subscription_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cash Quest',
      theme: isDarkMode
          ? ThemeData.dark()
          : ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFEB6734)),
              scaffoldBackgroundColor: Color(0xFFE5D8B1),
              useMaterial3: true,
            ),
      home: HomeScreen(toggleDarkMode: toggleDarkMode, isDarkMode: isDarkMode),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final Function toggleDarkMode;
  final bool isDarkMode;
  const HomeScreen({super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalMoney = 1000.0;
  int xp = 0;
  int level = 1;
  String selectedCurrency = "EUR";
  List<String> achievements = [];
  Map<String, double> budgets = {"Food": 200, "Transport": 100, "Entertainment": 150};
  Map<String, double> spending = {};
  List<Map<String, dynamic>> transactionHistory = [];

  void addTransaction(double amount, bool isIncome, String category) {
    setState(() {
      totalMoney += isIncome ? amount : -amount;
      transactionHistory.add({
        "amount": amount,
        "type": isIncome ? "Income" : "Expense",
        "category": category,
        "date": DateTime.now(),
      });

      if (!isIncome) {
        spending[category] = (spending[category] ?? 0) + amount;
        if (spending[category]! > budgets[category]!) {
          achievements.add("Overspent in $category!");
        }
      }
    });
  }

  void changeCurrency(String newCurrency) {
    setState(() {
      selectedCurrency = newCurrency;
    });
  }

  void completeChallenge(String challengeTitle) {
    setState(() {
      xp += 20;
      achievements.add("Completed Challenge: $challengeTitle");
      if (xp >= 100) {
        xp = 0;
        level++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cash Quest'),
        backgroundColor: Color.fromARGB(255, 181, 139, 203),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    toggleDarkMode: widget.toggleDarkMode,
                    changeCurrency: changeCurrency,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Total Balance: $selectedCurrency ${totalMoney.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineMedium),
          Text('Level: $level | XP: $xp/100', style: const TextStyle(fontSize: 18, color: Colors.black54)),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IncomeScreen(onSubmit: addTransaction),
                    ),
                  );
                },
                child: const Text('+'),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExpenseScreen(onSubmit: addTransaction),
                    ),
                  );
                },
                child: const Text('-'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart, color: Colors.grey), label: "Stats"),
          BottomNavigationBarItem(icon: Icon(Icons.history, color: Colors.grey), label: "History"),
          BottomNavigationBarItem(icon: Icon(Icons.savings, color: Colors.grey), label: "Goals"),
          BottomNavigationBarItem(icon: Icon(Icons.person, color: Colors.grey), label: "Profile"),
        ],
        onTap: (index) {
          List<Widget> screens = [
            StatsScreen(transactionHistory: transactionHistory),
            HistoryScreen(transactionHistory: transactionHistory),
            GoalsScreen(),
            ProfileScreen(level: level, xp: xp, achievements: achievements),
          ];
          Navigator.push(context, MaterialPageRoute(builder: (context) => screens[index]));
        },
      ),
    );
  }
}
