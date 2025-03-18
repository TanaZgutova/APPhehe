import 'package:app_hehe_yes/backend/app_database.dart';
import 'package:app_hehe_yes/backend/static_data.dart';
import 'backend/secure_storage.dart';
import 'package:flutter/material.dart';
import 'stats_screen.dart';
import 'history_screen.dart';
import 'goals_screen.dart';
import 'profile_screen.dart';
import 'income_screen.dart';
import 'expense_screen.dart';
import 'settings_screen.dart';

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
  const HomeScreen(
      {super.key, required this.toggleDarkMode, required this.isDarkMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserData? _userData;
  List<AchievementData> _achievements = [];
  Map<String, double> budgets = {
    "Food": 200,
    "Transport": 100,
    "Entertainment": 150
  };
  Map<String, double> spending = {};
  List<TransactionHistory> _transactionHistory = [];
  final db = AppDatabase();
  bool _finished = false;

  void _addTransaction(double amount, bool isIncome, int categoryIdx) async {
    await db.inserTransaction(TransactionsCompanion.insert(
      amount: amount,
      userID: _userData!.userID,
      categoryIndex: categoryIdx,
      withdraw: isIncome,
    ));
    var transactionHistory = await db.getTransactionsForUser(_userData!.userID);
    var achievements = await db.getAchievementsOfUser(_userData!.userID);

    setState(() {
      _transactionHistory = transactionHistory;
      _achievements = achievements;
    });

    // if (!isIncome) {
    //   spending[category] = (spending[category] ?? 0) + amount;
    //   if (spending[category]! > budgets[category]!) {
    //     achievements.add("Overspent in $category!");
    //   }
  }

  Future<SecureData?> _getUserName() async {
    return await SecureStorageService.readSecureData("LOGIN");
  }

  Future<int> _setUserName(String userName) async {
    return await SecureStorageService.writeSecureData("LOGIN", userName);
  }

  Future<void> _loadAppData() async {
    // await SecureStorageService.clearSecureData();
    var user = await _getUserName();
    if (user == null) {
      var uid = await _setUserName("MORE");
      await db.insertUser(
          UsersCompanion.insert(username: "MORE", hiddenValue: uid));
      user = SecureData(userName: "MORE", id: uid);
    }
    var userData = await db.loginUser(user.userName, user.id);

    if (userData.darkmode != widget.isDarkMode) {
      widget.toggleDarkMode();
    }
    var transactionHistory = await db.getTransactionsForUser(userData.userID);
    var achievements = await db.getAchievementsOfUser(userData.userID);

    setState(() {
      _userData = userData;
      _transactionHistory = transactionHistory;
      _achievements = achievements;
      _finished = true;
    });
  }

  @override
  void initState() {
    setState(() {
      _finished = false;
    });
    super.initState();
    _loadAppData();
    setState(() {
      _finished = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_finished && _userData == null) {
      // urob login obrazovku
      return CircularProgressIndicator();
    } else if (!_finished) {
      return CircularProgressIndicator();
    }

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
                    user: _userData!,
                  ),
                ),
              ).then((_) async {
                final db = AppDatabase();
                final userData = await db.getUser(_userData!.userID);
                setState(() {
                  _userData = userData;
                });
              });
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'Total Balance: ${_userData!.budget.toStringAsFixed(2)} ${CurrencyList.getCurrencyAt(_userData!.currencyIndex).displayName}',
              style: Theme.of(context).textTheme.headlineMedium),
          Text('Level: ${_userData!.level} | XP: ${_userData!.xp}/100',
              style: const TextStyle(
                  fontSize: 18, color: Color.fromARGB(255, 133, 142, 146))),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          IncomeScreen(onSubmit: _addTransaction),
                    ),
                  ).then((_) async {
                    final db = AppDatabase();
                    final transactions = await db.getTransactionsForUser(_userData!.userID);
                    setState(() {
                      _transactionHistory = transactions;
                    });
                  });
                },
                child: const Text('+'),
              ),
              const SizedBox(width: 75),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ExpenseScreen(onSubmit: _addTransaction),
                    ),
                  ).then((_) async {
                    final db = AppDatabase();
                    final transactions = await db.getTransactionsForUser(_userData!.userID);
                    setState(() {
                      _transactionHistory = transactions;
                    });
                  });
                },
                child: const Text('-'),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart, color: Colors.grey), label: "Stats"),
          BottomNavigationBarItem(
              icon: Icon(Icons.history, color: Colors.grey), label: "History"),
          BottomNavigationBarItem(
              icon: Icon(Icons.savings, color: Colors.grey), label: "Goals"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.grey), label: "Profile"),
        ],
        onTap: (index) {
          List<Widget> screens = [
            StatsScreen(transactionHistory: _transactionHistory),
            HistoryScreen(transactionHistory: _transactionHistory),
            GoalsScreen(),
            ProfileScreen(userData: _userData!, achievements: _achievements),
          ];
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screens[index]));
        },
      ),
    );
  }
}
