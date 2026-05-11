 import 'package:flutter/material.dart';
import 'package:my_budget/widgets/transaction_item.dart';

final List<TransactionItem> dummyTransactionItem=[
   TransactionItem(title: "كارفور هايبر ماركت", amount: "- 450.00 رس", date: "24 أكتوبر 2023", category: "بقالة", icon: Icons.shopping_cart, color: Colors.red),
                TransactionItem(title: "تحويل راتب", amount: "+ 12,500.00 رس", date: "25 أكتوبر 2023", category: "دخل", icon: Icons.attach_money, color: Colors.green),
                TransactionItem(title: "مطعم البيك", amount: "- 85.50 رس", date: "22 أكتوبر 2023", category: "مطاعم", icon: Icons.restaurant, color: Colors.red),
              
];