import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyBudgetApp());
}

class MyBudgetApp extends StatelessWidget {
  MyBudgetApp({super.key});

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
