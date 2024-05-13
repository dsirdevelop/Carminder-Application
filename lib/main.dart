import 'package:carminder/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Maintenance App',
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: Colors.lightBlue[200], // Light blue as primary color
          secondary: Colors.lightBlue[200], // Light blue as secondary color
        ),
      ),
      home: HomePage(),
    );
  }
}
