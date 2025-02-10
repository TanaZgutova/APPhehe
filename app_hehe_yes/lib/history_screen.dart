import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, dynamic>> transactionHistory;

  // ✅ **Fixed: Added `transactionHistory` parameter**
  const HistoryScreen({super.key, required this.transactionHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transaction History"), backgroundColor: Colors.purple),
      body: transactionHistory.isEmpty
          ? const Center(child: Text("No transactions yet!"))
          : ListView.builder(
              itemCount: transactionHistory.length,
              itemBuilder: (context, index) {
                final transaction = transactionHistory[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      "${transaction['type']} - \$${transaction['amount'].toStringAsFixed(2)}",
                      style: TextStyle(
                        color: transaction['type'] == "Income" ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text("Category: ${transaction['category']}"),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${transaction['date'].day}/${transaction['date'].month}/${transaction['date'].year}"),
                        Text("${transaction['date'].hour}:${transaction['date'].minute}"),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
