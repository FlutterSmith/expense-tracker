import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  Box<Expense>? _expenseBox;

  List<Expense> get expenses => _expenses;

  Future<void> loadExpenses() async {
    _expenseBox = Hive.box<Expense>('expenses');
    _expenses = _expenseBox!.values.toList();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await _expenseBox!.put(expense.id, expense);
    _expenses = _expenseBox!.values.toList();
    notifyListeners();
  }

  Future<void> deleteExpense(String id) async {
    await _expenseBox!.delete(id);
    _expenses = _expenseBox!.values.toList();
    notifyListeners();
  }

  Future<void> updateExpense(Expense expense) async {
    await _expenseBox!.put(expense.id, expense);
    _expenses = _expenseBox!.values.toList();
    notifyListeners();
  }

  double get totalExpense {
    return _expenses.fold(0.0, (sum, expense) => sum + expense.amount);
  }

  double get totalIncome {
    return 3257.00;
  }

  Map<String, double> get expensesByCategory {
    final Map<String, double> data = {};
    for (var expense in _expenses) {
      data[expense.category] = (data[expense.category] ?? 0) + expense.amount;
    }
    return data;
  }

  Map<String, double> get monthlyExpenses {
    final Map<String, double> monthlyData = {};
    for (var expense in _expenses) {
      final key = "${expense.date.month}-${expense.date.year}";
      monthlyData[key] = (monthlyData[key] ?? 0) + expense.amount;
    }
    return monthlyData;
  }
}
