import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/expense_bloc.dart';
import '../blocs/expense_event.dart';
import '../models/expense.dart';
class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);
  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}
class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(context: context, initialDate: _selectedDate, firstDate: DateTime(2000), lastDate: DateTime.now());
    if (picked != null) setState(() => _selectedDate = picked);
  }
  void _submit() {
    if (_formKey.currentState!.validate()) {
      var expense = Expense(id: Uuid().v4(), title: _titleController.text, amount: double.tryParse(_amountController.text) ?? 0.0, date: _selectedDate, category: _categoryController.text);
      context.read<ExpenseBloc>().add(AddExpense(expense));
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense'), backgroundColor: Theme.of(context).primaryColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(controller: _titleController, decoration: InputDecoration(labelText: 'Expense Title'), validator: (value) => value == null || value.isEmpty ? 'Enter title' : null),
              TextFormField(controller: _amountController, decoration: InputDecoration(labelText: 'Amount'), keyboardType: TextInputType.number, validator: (value) => value == null || value.isEmpty ? 'Enter amount' : null),
              TextFormField(controller: _categoryController, decoration: InputDecoration(labelText: 'Category'), validator: (value) => value == null || value.isEmpty ? 'Enter category' : null),
              SizedBox(height: 20),
              ListTile(title: Text("Date: ${_selectedDate.toLocal()}".split(' ')[0]), trailing: Icon(Icons.calendar_today), onTap: _pickDate),
              SizedBox(height: 30),
              ElevatedButton(onPressed: _submit, child: Text('Add Expense')),
            ],
          ),
        ),
      ),
    );
  }
}
