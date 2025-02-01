import 'package:flutter_bloc/flutter_bloc.dart';
import 'expense_event.dart';
import 'expense_state.dart';
import 'package:hive/hive.dart';
import '../models/expense.dart';
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  ExpenseBloc() : super(ExpenseLoading()) {
    on<LoadExpenses>(_onLoadExpenses);
    on<AddExpense>(_onAddExpense);
    on<UpdateExpense>(_onUpdateExpense);
    on<DeleteExpense>(_onDeleteExpense);
  }
  Future<void> _onLoadExpenses(LoadExpenses event, Emitter<ExpenseState> emit) async {
    try {
      var box = Hive.box<Expense>('expenses');
      List<Expense> expenses = box.values.toList();
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
  Future<void> _onAddExpense(AddExpense event, Emitter<ExpenseState> emit) async {
    try {
      var box = Hive.box<Expense>('expenses');
      await box.put(event.expense.id, event.expense);
      List<Expense> expenses = box.values.toList();
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
  Future<void> _onUpdateExpense(UpdateExpense event, Emitter<ExpenseState> emit) async {
    try {
      var box = Hive.box<Expense>('expenses');
      await box.put(event.expense.id, event.expense);
      List<Expense> expenses = box.values.toList();
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
  Future<void> _onDeleteExpense(DeleteExpense event, Emitter<ExpenseState> emit) async {
    try {
      var box = Hive.box<Expense>('expenses');
      await box.delete(event.id);
      List<Expense> expenses = box.values.toList();
      emit(ExpenseLoaded(expenses));
    } catch (e) {
      emit(ExpenseError(e.toString()));
    }
  }
}
