import 'package:flutter/material.dart';
import './backend/app_database.dart';
import './backend/static_data.dart';

class HistoryScreen extends StatelessWidget {
  final List<TransactionHistory> transactionHistory;
  // ✅ **Fixed: Added `transactionHistory` parameter**
  const HistoryScreen({super.key, required this.transactionHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Transaction History"),
          backgroundColor: Colors.purple),
      body: transactionHistory.isEmpty
          ? const Center(child: Text("No transactions yet!"))
          : ListView.builder(
              itemCount: transactionHistory.length,
              itemBuilder: (context, index) {
                final transaction = transactionHistory[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      "${CategoryList.getCategoryAt(transaction.categoryIndex)} - \$${transaction.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: transaction.withdraw ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        "Category: ${CategoryList.getCategoryAt(transaction.categoryIndex)}"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${transaction.date.day}/${transaction.date.month}/${transaction.date.year}"),
                        Text(
                            "${transaction.date.hour}:${transaction.date.minute}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
