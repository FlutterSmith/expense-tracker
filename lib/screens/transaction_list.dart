import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';

class TransactionList extends StatelessWidget {
  final List<Expense> expenses;
  const TransactionList({Key? key, required this.expenses}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(child: Text('No transactions yet.'));
    }

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF6F35A5),
              child: Text(
                expense.title.isNotEmpty
                    ? expense.title.substring(0, 1).toUpperCase()
                    : '?',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(expense.title),
            subtitle: Text(
              '${expense.category}\n${DateFormat.yMMMd().format(expense.date)}',
            ),
            trailing: Text(
              '- \$${expense.amount.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.redAccent),
            ),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
