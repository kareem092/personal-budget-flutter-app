import 'package:flutter/material.dart';

class AddIncomeScreen extends StatelessWidget {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Income")),
      body: const Center(child: Text("Add Income Screen")),
    );
  }
}
