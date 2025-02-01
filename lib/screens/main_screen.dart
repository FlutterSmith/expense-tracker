import 'package:expense_tracker/screens/analytices_screen.dart';
import 'package:expense_tracker/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'add_expense_screen.dart';
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
    _pages = [const HomeScreen(), const AnalyticsScreen(), const SettingsScreen()];
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _addNewExpense() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => const AddExpenseScreen()));
  }
  @override
  Widget build(BuildContext context) {
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
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            selectedItemColor: const Color(0xFF6F35A5),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
            ],
          ),
        ),
      ),
    );
  }
}
