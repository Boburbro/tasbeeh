import 'package:flutter/material.dart';
import 'package:tasbeeh/data/local/local_database_service.dart';
import 'package:tasbeeh/presentations/home/home_screen.dart';

void main() async {
  final dbService = LocalDatabaseService();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "JosefinSans",
        scaffoldBackgroundColor: Colors.deepPurple[300],
        primaryColor: Colors.deepPurple,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white),
          titleMedium: TextStyle(color: Colors.white),
          titleSmall: TextStyle(color: Colors.white),
          labelLarge: TextStyle(color: Colors.white),
          labelMedium: TextStyle(color: Colors.white),
          labelSmall: TextStyle(color: Colors.white),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
