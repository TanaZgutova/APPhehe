import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  final Function(double, bool, String) onSubmit;

  const IncomeScreen({super.key, required this.onSubmit});

  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  final TextEditingController amountController = TextEditingController();
  final List<String> categories = ["Salary", "Freelance", "Investments", "Gifts", "Bonuses", "Side Hustles"];
  String selectedCategory = "Salary";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Income"), backgroundColor: Colors.green),
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
                widget.onSubmit(amount, true, selectedCategory);
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
