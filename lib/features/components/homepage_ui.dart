import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomepageUI extends StatefulWidget {
  const HomepageUI({super.key});

  @override
  State<HomepageUI> createState() => _HomepageUIState();
}

class _HomepageUIState extends State<HomepageUI> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFF9FAFA),
              Color(0xFF3CB1EA)
            ]
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('IUIS', style: Theme.of(context).textTheme.bodyLarge),
            NavigationRail(
              backgroundColor: Colors.transparent,
              destinations: navOptions(), 
              selectedIndex: _selectedIndex,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
            ),
          ],
        ),
      ),
    ]);
  }

  navOptions() {
    final options = [
      ['Dashboard', PhosphorIcons.squaresFour],
      ['Account', PhosphorIcons.user],
      ['Academics', PhosphorIcons.graduationCap],
      ['Enrollment', PhosphorIcons.notebook],
      ['Inbox', PhosphorIcons.chatCircle],
    ];

    return [...options.asMap().entries.map((data) {
      var name = data.value[0] as String;
      var icon = data.value[1] as Function;

      return NavigationRailDestination(
          icon: PhosphorIcon(
            icon(_selectedIndex == data.key
                ? PhosphorIconsStyle.fill
                : PhosphorIconsStyle.bold),
          ),
          label: Text(name));
    })];
  }
}
