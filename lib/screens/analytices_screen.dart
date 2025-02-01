import 'package:expense_tracker/screens/expense_chart.dart';
import 'package:flutter/material.dart';
class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map<String, double> dummyData = {'Jan': 300, 'Feb': 450, 'Mar': 200, 'Apr': 500};
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Analytics', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            ExpenseChart(monthlyData: dummyData),
          ],
        ),
      ),
    );
  }
}
