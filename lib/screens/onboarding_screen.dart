import 'package:expense_tracker/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  final Function(Locale) setLocale;
  final Function(ThemeMode) setThemeMode;
  const OnboardingScreen(
      {Key? key, required this.setLocale, required this.setThemeMode})
      : super(key: key);
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/onboarding_wallet.png', height: 200),
          Text(AppLocalizations.of(context)!.translate('welcome'),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              widget.setLocale(const Locale('en'));
              widget.setThemeMode(ThemeMode.light);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => MainScreen()));
            },
            child: Text(AppLocalizations.of(context)!.translate('get_started')),
          ),
          ElevatedButton(
            onPressed: () {
              widget.setLocale(const Locale('es'));
              widget.setThemeMode(ThemeMode.dark);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => MainScreen()));
            },
            child: Text(
              AppLocalizations.of(context)!.translate(
                'get_started_spanish',
              ),
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ]),
      ),
    );
  }
}
