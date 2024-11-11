import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ThemedText('Dashboard', size: GlobalFontSize.heading),
        const SizedBox(height: 24),
        Row(
          children: [
            CustomCard(
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(child: Image.network('https://images.unsplash.com/photo-1730470316489-0379f25dfabb?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', width: 80, height: 80, fit: BoxFit.cover,)),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThemedText(
                            'Rei Ebenezer Duhina',
                            size: GlobalFontSize.subheading,
                            color: GlobalColor.accentOne,
                          ),
                          Opacity(
                            opacity: 0.6,
                            child: Text(
                              'Student ID: 2022M0128',
                              style: GlobalFontSize.standard,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(width: 24),
            const Expanded(child: CustomCard(child: Row(
              children: [
                CircularProgressIndicator(
                  value: 0.44,
                  color: GlobalColor.brand,
                  strokeCap: StrokeCap.round,
                  strokeWidth: 12,
                )
              ],
            )))
          ],
        )
      ],
    );
  }
}
