// lib/academics_main.dart
import 'package:flutter/material.dart';
import 'features/academic_page'; // Adjust path as necessary

void main() {
  runApp(AcademicsApp());
}

class AcademicsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IUIS - Academics Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AcademicsPage(),
    );
  }
}
