import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/inbox_page.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Inbox',
        theme: ThemeData(
          colorScheme: const ColorScheme.light(
              primary: GlobalColor.brand,
              secondary: GlobalColor.accentOne,
              surface: GlobalColor.shadeLight,
              surfaceDim: GlobalColor.gray,
              onSurface: GlobalColor.shadeDark),
          useMaterial3: true,
        ),
        home: const Inbox());
  }
}
