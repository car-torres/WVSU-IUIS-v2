import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/homepage_ui.dart';

class Homepage extends StatelessWidget {
  const Homepage({ super.key });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: HomepageUI(),
      ),
    );
  }
}

