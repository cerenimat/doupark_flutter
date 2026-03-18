import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const DouParkApp());
}

class DouParkApp extends StatelessWidget {
  const DouParkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DouPark',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const LoginScreen(),
    );
  }
}