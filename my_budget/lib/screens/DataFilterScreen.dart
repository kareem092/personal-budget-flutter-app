import 'package:flutter/material.dart';

class DataFilterScreen extends StatefulWidget {
  DataFilterScreen({super.key});

  @override
  State<DataFilterScreen> createState() => _DataFilterScreenState();
}

class _DataFilterScreenState extends State<DataFilterScreen> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> pickStartDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  Future<void> pickEndDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        endDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date Filter")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickStartDate,
              child: Text(
                startDate == null
                    ? "Select Start Date"
                    : "Start Date: ${startDate.toString().split(" ")[0]}",
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: pickEndDate,
              child: Text(
                endDate == null
                    ? "Select End Date"
                    : "End Date: ${endDate.toString().split(" ")[0]}",
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Filter Applied")));
              },
              child: Text("Apply Filter"),
            ),
          ],
        ),
      ),
    );
  }
}
