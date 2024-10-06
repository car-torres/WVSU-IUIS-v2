import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/enrollment_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const EnrollmentPage(),
    );
  }
}
