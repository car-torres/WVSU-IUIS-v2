import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/pages/academics.dart';
import 'package:wvsu_iuis_v2/features/pages/account.dart';
import 'package:wvsu_iuis_v2/features/pages/dashboard.dart';
import 'package:wvsu_iuis_v2/features/pages/enrollment.dart';
import 'package:wvsu_iuis_v2/features/pages/inbox.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  bool _isExtended = false;

  final _pages = [
    const Dashboard(),
    const Account(),
    const Academics(),
    const Enrollment(),
    const Inbox()
  ];

  Widget? _currentPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [GlobalColor.shadeLight, GlobalColor.accentOne]),
          ),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isExtended = true),
            onExit: (_) => setState(() => _isExtended = false),
            child: NavigationRail(
              labelType: NavigationRailLabelType.none,
              groupAlignment: 0,
              leading: Row(
                children: [
                  SvgPicture.asset(
                    'assets/wvsu_logo.svg',
                    width: 48,
                    height: 48,
                  ),
                  ClipRect(
                    child: UnconstrainedBox(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: _isExtended ? 55 : 0,
                        child: Text(
                          'IUIS',
                          softWrap: false,
                          textAlign: TextAlign.right,
                          style: GlobalFontSize.subheading
                              .copyWith(color: GlobalColor.shadeLight),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              backgroundColor: Colors.transparent,
              destinations: _navOptions(),
              unselectedIconTheme:
                  const IconThemeData(color: GlobalColor.shadeLight),
              selectedIconTheme:
                  const IconThemeData(color: GlobalColor.accentOne),
              indicatorColor: GlobalColor.shadeLight,
              indicatorShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              extended: _isExtended,
              selectedIndex: _selectedIndex,
              minExtendedWidth: 200,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                  _currentPage = _pages[index];
                });
              },
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
              color: GlobalColor.gray,
              padding: const EdgeInsets.all(24),
              child: _currentPage ?? _pages[0],
            )),
        SizedBox(
          width: 300,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: SidebarCard(children: [
                    ThemedText('Upcoming Events',
                        size: GlobalFontSize.subheading2),
                  ]),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SidebarCard(children: [
                    ThemedText('Messages', size: GlobalFontSize.subheading2),
                  ]),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: SidebarCard(children: [
                    ThemedText('Documents', size: GlobalFontSize.subheading2),
                  ]),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }

  List<NavigationRailDestination> _navOptions() {
    final options = [
      ['Dashboard', PhosphorIcons.squaresFour],
      ['Account', PhosphorIcons.user],
      ['Academics', PhosphorIcons.graduationCap],
      ['Enrollment', PhosphorIcons.notebook],
      ['Inbox', PhosphorIcons.chatCircle],
    ];

    return [
      ...options.asMap().entries.map((data) {
        var name = data.value[0] as String;
        var icon = data.value[1] as Function;

        return NavigationRailDestination(
            padding: const EdgeInsets.symmetric(vertical: 8),
            selectedIcon: PhosphorIcon(icon(PhosphorIconsStyle.fill)),
            icon: PhosphorIcon(
              icon(PhosphorIconsStyle.bold),
            ),
            label: Text(
              name,
              style:
                  GlobalFontSize.button.copyWith(color: GlobalColor.shadeLight),
            ));
      })
    ];
  }
}

final class SidebarCard extends StatelessWidget {
  final List<Widget> children;

  const SidebarCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: GlobalColor.gray),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: children,
      ),
    );
  }
}
