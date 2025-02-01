import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'overview_screen.dart';
import 'add_expense_screen.dart';
import '../providers/expense_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [const HomeScreen(), const OverviewScreen()];
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  void _addNewExpense() {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const AddExpenseScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewExpense,
        backgroundColor: const Color(0xFF6F35A5),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 4.0,
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xFF6F35A5),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart, color: Color(0xFF6F35A5)),
                  label: 'Overview'),
            ],
          ),
        ),
      ),
    );
  }
}
