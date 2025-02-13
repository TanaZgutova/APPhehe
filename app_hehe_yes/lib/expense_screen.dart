import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  final Function(double, bool, String) onSubmit;

  const ExpenseScreen({super.key, required this.onSubmit});

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final TextEditingController amountController = TextEditingController();
  final List<String> categories = ["Food", "Rent", "Bills", "Gaming", "Transport", "Shopping", "Subscriptions", "Health", "Education", "Entertainment"];
  String selectedCategory = "Food";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense"), backgroundColor: const Color.fromARGB(255, 235, 103, 52)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Enter Amount:"),
            TextField(controller: amountController, keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            const Text("Select Category:"),
            DropdownButton<String>(
              value: selectedCategory,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue!;
                });
              },
              items: categories.map((String category) {
                return DropdownMenuItem<String>(value: category, child: Text(category));
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(amountController.text) ?? 0;
                widget.onSubmit(amount, false, selectedCategory);
                Navigator.pop(context);
              },
              child: const Text("Save Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
