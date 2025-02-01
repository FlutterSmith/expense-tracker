import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/expense.dart';
class TransactionList extends StatelessWidget {
  final List<Expense> expenses;
  const TransactionList({Key? key, required this.expenses}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) return Center(child: Text('No transactions'));
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        var expense = expenses[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text(expense.title[0])),
            title: Text(expense.title),
            subtitle: Text(DateFormat.yMMMd().format(expense.date)),
            trailing: Text('\$${expense.amount.toStringAsFixed(2)}'),
          ),
        );
      },
    );
  }
}
