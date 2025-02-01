import 'package:expense_tracker/blocs/expense_event.dart';
import 'package:expense_tracker/localization/app_localization.dart';
import 'package:expense_tracker/models/budget.g.dart';
import 'package:expense_tracker/models/category.g.dart';
import 'package:expense_tracker/models/espense.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'themes/app_theme.dart';
import 'screens/onboarding_screen.dart';
import 'blocs/expense_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/expense.dart';
import 'models/category.dart';
import 'models/budget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(BudgetAdapter());
  await Hive.openBox<Expense>('expenses');
  await Hive.openBox<Category>('categories');
  await Hive.openBox<Budget>('budgets');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');
  ThemeMode _themeMode = ThemeMode.light;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ExpenseBloc()..add(LoadExpenses())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: _locale,
        supportedLocales: const [Locale('en'), Locale('es')],
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: _themeMode,
        home: OnboardingScreen(setLocale: setLocale, setThemeMode: setThemeMode),
      ),
    );
  }
}
