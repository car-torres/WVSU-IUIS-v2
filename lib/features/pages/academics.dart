import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/class_offerings.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class Academics extends StatelessWidget {
  const Academics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThemedText('Academics', size: GlobalFontSize.heading),
        const SizedBox(
          height: 24,
        ),
        const ClassOfferings()
      ],
    );
  }
}

