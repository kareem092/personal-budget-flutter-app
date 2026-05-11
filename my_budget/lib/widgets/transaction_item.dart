import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.icon,
    required this.color,
  });

  final String title;
  final String amount;
  final String date;
  final String category;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, textAlign: TextAlign.right),
        subtitle: Text("$category • $date", textAlign: TextAlign.right),
        trailing: Text(amount,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
            )),
      ),
    );
  }
}