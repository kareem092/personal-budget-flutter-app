import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});

  final List<Map<String, dynamic>> transactions = [
    {"title": "Salary", "amount": 3000, "date": "2026-04-10", "isIncome": true},
    {"title": "Food", "amount": 50, "date": "2026-04-11", "isIncome": false},
    {
      "title": "Transport",
      "amount": 20,
      "date": "2026-04-12",
      "isIncome": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transactions")),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final item = transactions[index];

          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item["title"]),
              subtitle: Text(item["date"]),
              trailing: Text(
                item["isIncome"]
                    ? "+ ${item["amount"]}"
                    : "- ${item["amount"]}",
                style: TextStyle(
                  color: item["isIncome"] ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
