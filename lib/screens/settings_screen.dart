import 'package:flutter/material.dart';
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Settings', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ElevatedButton(onPressed: () {}, child: Text('Change Theme')),
            ElevatedButton(onPressed: () {}, child: Text('Change Language')),
          ],
        ),
      ),
    );
  }
}
