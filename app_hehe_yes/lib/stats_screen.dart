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
    var chartWidth = MediaQuery.of(context).size.width * 0.8;
    var chartHeight = MediaQuery.of(context).size.height * 0.8;
    return Scaffold(
      appBar: AppBar(title: const Text("Spending Stats"), backgroundColor: const Color.fromARGB(255, 136, 164, 177)),
      body: Center(
       
        child: categoryTotals.isEmpty
            ? const Text("No expenses yet!", style: TextStyle(fontSize: 20))
            : 
            ConstrainedBox(
                constraints: BoxConstraints(maxHeight: chartHeight, maxWidth: chartWidth),// change this line to affect the size !!
              child: PieChart(
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
      ),
    );
  }
}
