import 'package:expenses_tracker/models/espense.g.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/expense.dart';
import 'providers/expense_provider.dart';
import 'screens/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  await Hive.openBox<Expense>('expenses');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ExpenseProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BudgetCalc Expense Tracker',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFF6F35A5),
            secondary: const Color(0xFFB39DDB),
          ),
          scaffoldBackgroundColor: const Color(0xFFF7F2FA),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.black87),
          ),
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
