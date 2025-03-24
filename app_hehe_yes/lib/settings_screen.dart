import 'package:app_hehe_yes/backend/app_database.dart';
import 'package:app_hehe_yes/backend/static_data.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Function toggleDarkMode;
  final UserData user;

  const SettingsScreen(
      {super.key, required this.toggleDarkMode, required this.user});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late UserData _user;

  Future<void> _loadUserData() async {
    final db = AppDatabase();
    final userData = await db.getUser(widget.user.userID);

    setState(() {
      _user = userData;
    });
  }

  @override
  void initState() {
    _user = widget.user;
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text("Settings"), backgroundColor: Colors.grey),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Appearance",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) async {
              widget.toggleDarkMode();
              final db = AppDatabase();

              await db.updateUserData(_user.userID, darkmode: value);
              final userData = await db.getUser(_user.userID);
              setState(() {
                _user = userData;
              });
            },
          ),
          const Divider(),
          const Text("Select Currency",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          DropdownButton<int>(
            value: _user.currencyIndex,
            onChanged: (int? newValue) async {
              final db = AppDatabase();

              await db.updateUserData(_user.userID, currencyIndex: newValue!);
              final userData = await db.getUser(_user.userID);
              setState(() {
                _user = userData;
              });
            },
            items: CurrencyList.getCurrencies()
                .asMap()
                .entries
                .map<DropdownMenuItem<int>>((currency) {
              return DropdownMenuItem<int>(
                  value: currency.key, child: Text(currency.value.displayName));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
