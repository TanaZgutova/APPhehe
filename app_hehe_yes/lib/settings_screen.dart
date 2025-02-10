import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final Function toggleDarkMode;
  final Function(String) changeCurrency;

  // ✅ **Fixed: Make currencies list const**
  static const List<String> currencies = ["USD", "EUR", "GBP", "JPY", "INR"];

  const SettingsScreen({super.key, required this.toggleDarkMode, required this.changeCurrency});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), backgroundColor: Colors.grey),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Appearance", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text("Dark Mode"),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (value) {
              toggleDarkMode();
            },
          ),
          const Divider(),
          const Text("Select Currency", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          DropdownButton<String>(
            value: "USD",
            onChanged: (String? newValue) {
              changeCurrency(newValue!);
            },
            items: currencies.map<DropdownMenuItem<String>>((String currency) {
              return DropdownMenuItem<String>(value: currency, child: Text(currency));
            }).toList(),
          ),
        ],
      ),
    );
  }
}
