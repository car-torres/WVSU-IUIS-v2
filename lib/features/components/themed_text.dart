import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';


class ThemedText extends StatelessWidget {
  final TextStyle? size;
  final Color? color;
  final String text;

  const ThemedText(this.text, { super.key, this.size, this.color });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: (size ?? GlobalFontSize.standard).copyWith(color: color),);
  }
}