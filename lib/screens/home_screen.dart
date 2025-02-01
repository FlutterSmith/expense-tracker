import 'package:expense_tracker/screens/transaction_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/expense_bloc.dart';
import '../blocs/expense_state.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExpenseBloc, ExpenseState>(
      builder: (context, state) {
        if (state is ExpenseLoading) return Center(child: CircularProgressIndicator());
        if (state is ExpenseLoaded) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [Color(0xFF7E57C2), Color(0xFFB39DDB)]),
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
                    ),
                    child: Column(
                      children: [
                        Text('Total Balance', style: TextStyle(color: Colors.white70, fontSize: 16)),
                        SizedBox(height: 8),
                        Text('\$${(10000 - state.expenses.fold(0.0, (prev, e) => prev + e.amount)).toStringAsFixed(2)}', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  TransactionList(expenses: state.expenses),
                ],
              ),
            ),
          );
        }
        return Center(child: Text('Error'));
      },
    );
  }
}
