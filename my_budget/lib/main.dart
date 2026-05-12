import 'package:flutter/material.dart';
import 'package:my_budget/screens/AddExpenseScreen.dart';
// import 'package:easy_localization/easy_localization.dart';
import 'package:my_budget/screens/AddIncomeScreen.dart';
// import 'package:my_budget/screens/SettingScreen.dart';
// import 'package:my_budget/screens/TransactionsScreen.dart';
// import 'package:my_budget/screens/TransferScreen.dart';
import 'screens/HomeScreen.dart';
import 'screens/SearchScreen.dart';

void main() {
  
  runApp(
   const MyBudgetApp(),
    );
}

class MyBudgetApp extends StatelessWidget {
 const MyBudgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Budget',
      theme: ThemeData(primarySwatch: Colors.teal),

      home: HomeScreen(),

    );
  }
}
