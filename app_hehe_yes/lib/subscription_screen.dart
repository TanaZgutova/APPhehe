import 'package:flutter/material.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final List<Map<String, String>> subscriptions = [
    {"name": "Netflix", "amount": "15.99", "date": "1st of every month"},
    {"name": "Spotify", "amount": "9.99", "date": "5th of every month"},
    {"name": "Gym", "amount": "29.99", "date": "10th of every month"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Subscriptions"), backgroundColor: Colors.purple),
      body: ListView.builder(
        itemCount: subscriptions.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(subscriptions[index]["name"]!),
            subtitle: Text(
                "Amount: \$${subscriptions[index]["amount"]} - Due: ${subscriptions[index]["date"]}"),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                setState(() {
                  subscriptions.removeAt(index);
                });
              },
            ),
          );
        },
      ),
    );
  }
}
