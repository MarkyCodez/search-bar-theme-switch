import 'package:flutter/material.dart';
import 'package:notes_app/pages/home_page.dart';
import './themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: lightMode,
      darkTheme: darkMode,
      home: const MyHomePage(),
    );
  }
}
