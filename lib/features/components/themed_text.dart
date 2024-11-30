import 'package:flutter/material.dart';


class ThemedText extends StatelessWidget {
  final TextStyle size;
  final Color? color;
  final String text;

  const ThemedText(this.text, { super.key, required this.size, this.color });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: size.copyWith(color: color),);
  }
}