import 'package:flutter/material.dart';
import 'package:habit_tracker_desktop/screens/main/main_ui_base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      themeMode: ThemeMode.light,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F6F6),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1D1D1D),
      ),
      home: const MainUIBase(),
    );
  }
}
