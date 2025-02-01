import 'package:expenses_tracker/screens/expense_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({Key? key}) : super(key: key);

  Widget _statTile({
    required String title,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ExpenseBarChart(monthlyData: expenseProvider.monthlyExpenses),
              ),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Statistics',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statTile(
                          title: 'Total Income',
                          value: '\$${expenseProvider.totalIncome.toStringAsFixed(2)}',
                          color: Colors.greenAccent,
                        ),
                        _statTile(
                          title: 'Total Expenses',
                          value: '\$${expenseProvider.totalExpense.toStringAsFixed(2)}',
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
