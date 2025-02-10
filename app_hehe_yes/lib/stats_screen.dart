import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactionHistory;

  // ✅ **Fixed: Added `transactionHistory` parameter**
  const StatsScreen({super.key, required this.transactionHistory});

  @override
  Widget build(BuildContext context) {
    Map<String, double> categoryTotals = {};

    for (var transaction in transactionHistory) {
      if (transaction["type"] == "Expense") {
        categoryTotals[transaction["category"]] =
            (categoryTotals[transaction["category"]] ?? 0) + transaction["amount"];
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Spending Stats"), backgroundColor: const Color.fromARGB(255, 79, 214, 160)),
      body: Center(
       
        child: categoryTotals.isEmpty
            ? const Text("No expenses yet!", style: TextStyle(fontSize: 20))
            : PieChart(
                PieChartData(
                  sections: categoryTotals.entries.map((entry) {
                    return PieChartSectionData(
                      value: entry.value,
                      title: '${entry.key}: \$${entry.value.toStringAsFixed(2)}',
                      radius: 40,
                    );
                  }).toList(),
                ),
              ),
      ),
    );
  }
}
