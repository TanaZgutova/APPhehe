import 'package:app_hehe_yes/backend/static_data.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatefulWidget {
  final Function(double, bool, int) onSubmit;

  const ExpenseScreen({super.key, required this.onSubmit});

  @override
  _ExpenseScreenState createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  final TextEditingController amountController = TextEditingController();
  int selectedCategoryIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add Expense"),
          backgroundColor: const Color.fromARGB(255, 235, 103, 52)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Enter Amount:"),
            TextField(
                controller: amountController,
                keyboardType: TextInputType.number),
            const SizedBox(height: 10),
            const Text("Select Category:"),
            DropdownButton<int>(
              value: selectedCategoryIdx,
              onChanged: (int? newValue) {
                setState(() {
                  selectedCategoryIdx = newValue!;
                });
              },
              items: CategoryList.getExpenseCategories()
                  .asMap()
                  .entries
                  .map((category) {
                return DropdownMenuItem<int>(
                    value: category.key, child: Text(category.value));
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(amountController.text) ?? 0;
                widget.onSubmit(amount, false, selectedCategoryIdx);
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
