import 'package:flutter/material.dart';

class BudgetScreen extends StatelessWidget {
  final Map<String, double> budgets;
  final Map<String, double> spending;

  const BudgetScreen({super.key, required this.budgets, required this.spending});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Budget Overview"), backgroundColor: Colors.blueGrey),
      body: ListView(
        children: budgets.keys.map((category) {
          double spent = spending[category] ?? 0;
          return ListTile(
            title: Text("$category - Budget: \$${budgets[category]!.toStringAsFixed(2)}"),
            subtitle: Text("Spent: \$${spent.toStringAsFixed(2)}"),
            trailing: spent > budgets[category]!
                ? const Icon(Icons.warning, color: Colors.red)
                : const Icon(Icons.check_circle, color: Colors.green),
          );
        }).toList(),
      ),
    );
  }
}
