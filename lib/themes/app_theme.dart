import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6F35A5),
    colorScheme: const ColorScheme.light(primary: Color(0xFF6F35A5), secondary: Color(0xFFB39DDB)),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
  );
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6F35A5),
    colorScheme: const ColorScheme.dark(primary: Color(0xFF6F35A5), secondary: Color(0xFFB39DDB)),
    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
  );
}
