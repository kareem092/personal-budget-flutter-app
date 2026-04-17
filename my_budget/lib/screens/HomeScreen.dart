import 'package:flutter/material.dart';
import '../widgets/InfoCard.dart';
import '../widgets/sectionTitle.dart';
import 'AddIncomeScreen.dart';
import 'AddExpenseScreen.dart';
import 'TransactionsScreen.dart';
import 'DataFilterScreen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double totalIncome = 5000;
    double totalExpense = 2000;
    double balance = totalIncome - totalExpense;

    return Scaffold(
      appBar: AppBar(title: Text("My Budget"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: "Overview"),
            SizedBox(height: 12),

            InfoCard(
              title: "Total Income",
              value: totalIncome.toString(),
              color: Colors.green,
              icon: Icons.arrow_downward,
            ),
            SizedBox(height: 12),

            InfoCard(
              title: "Total Expense",
              value: totalExpense.toString(),
              color: Colors.red,
              icon: Icons.arrow_upward,
            ),
            SizedBox(height: 12),

            InfoCard(
              title: "Current Balance",
              value: balance.toString(),
              color: Colors.blue,
              icon: Icons.account_balance_wallet,
            ),

            SizedBox(height: 24),
            SectionTitle(title: "Quick Actions"),
            SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddIncomeScreen()),
                      );
                    },
                    child: Text("Add Income"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => AddExpenseScreen()),
                      );
                    },
                    child: Text("Add Expense"),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => TransactionsScreen()),
                      );
                    },
                    child: Text("Transactions"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DataFilterScreen()),
                      );
                    },
                    child: Text("Filter"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
