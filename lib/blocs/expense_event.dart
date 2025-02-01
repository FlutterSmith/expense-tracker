import 'package:equatable/equatable.dart';
import '../models/expense.dart';
abstract class ExpenseEvent extends Equatable {
  const ExpenseEvent();
  @override
  List<Object> get props => [];
}
class LoadExpenses extends ExpenseEvent {}
class AddExpense extends ExpenseEvent {
  final Expense expense;
  const AddExpense(this.expense);
  @override
  List<Object> get props => [expense];
}
class UpdateExpense extends ExpenseEvent {
  final Expense expense;
  const UpdateExpense(this.expense);
  @override
  List<Object> get props => [expense];
}
class DeleteExpense extends ExpenseEvent {
  final String id;
  const DeleteExpense(this.id);
  @override
  List<Object> get props => [id];
}
