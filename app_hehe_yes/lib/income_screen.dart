import 'package:app_hehe_yes/backend/static_data.dart';
import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  final Function(double, bool, int) onSubmit;

  const IncomeScreen({super.key, required this.onSubmit});

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final TextEditingController amountController = TextEditingController();
  int selectedCategoryIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Add Income"),
          backgroundColor: const Color.fromARGB(255, 147, 179, 85)),
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
              items:
                  CategoryList.getIncomeCategories().asMap().entries.map((category) {
                return DropdownMenuItem<int>(
                    value: category.key, child: Text(category.value));
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                double amount = double.tryParse(amountController.text) ?? 0;
                widget.onSubmit(amount, true, selectedCategoryIdx);
                Navigator.pop(context);
              },
              child: const Text("Save Income"),
            ),
          ],
        ),
      ),
    );
  }
}
