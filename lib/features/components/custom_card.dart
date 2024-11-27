import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24), 
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 6,
              spreadRadius: -2,
              color: Color.fromRGBO(0, 0, 0, .05)
            ),
            BoxShadow(
              offset: Offset(0, 10),
              blurRadius: 15,
              spreadRadius: -3,
              color: Color.fromRGBO(0, 0, 0, .1),
            )
          ],
          color: GlobalColor.shadeLight,
          borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        child: child);
  }
}
