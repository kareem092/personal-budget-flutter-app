import 'package:flutter/material.dart';

class AddIncomeScreen extends StatefulWidget {
  AddIncomeScreen({super.key});

  @override
  State<AddIncomeScreen> createState() => _AddIncomeScreenState();
}

class _AddIncomeScreenState extends State<AddIncomeScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  String selectedCategory = "Salary";
  DateTime selectedDate = DateTime.now();

  List<String> categories = ["Salary", "Gift", "Freelance", "Bonus", "Other"];

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void saveIncome() {
    String amount = amountController.text;
    String note = noteController.text;

    if (amount.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Please enter the amount")));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Income saved successfully")));

    amountController.clear();
    noteController.clear();

    setState(() {
      selectedCategory = "Salary";
      selectedDate = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Income"), centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Amount",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter amount",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            Text(
              "Note",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: noteController,
              decoration: InputDecoration(
                hintText: "Enter note",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),

            Text(
              "Category",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            SizedBox(height: 16),

            Text(
              "Date",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: pickDate,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}",
                ),
              ),
            ),

            SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: saveIncome,
                child: Text("Save Income"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
