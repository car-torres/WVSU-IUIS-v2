import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:localstorage/localstorage.dart';
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

  final _pages = {
    '/dashboard': const Dashboard(),
    '/account': const Account(),
    '/academics': const Academics(),
    '/enrollment': const Enrollment(),
    '/inbox': const Inbox(),
  };

  Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    int index = [..._pages.keys].indexWhere(
        (route) => GoRouter.of(context).state?.uri.toString() == route);
    if (index == -1) index = 0;

    setState(() {
      _selectedIndex = index;
      _currentPage = _pages.values.elementAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 24),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Background image path
                fit: BoxFit.cover,
                opacity: 0.2,
                alignment: Alignment.centerLeft),
            gradient: LinearGradient(colors: [
              GlobalColor.accentOne,
              GlobalColor.shadeLight,
            ]),
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
              trailing: TextButton(
                  onPressed: () {
                    localStorage.clear();
                    context.go('/login');
                  },
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const PhosphorIcon(
                          PhosphorIconsBold.arrowBendUpLeft,
                          color: GlobalColor.shadeLight,
                        ),
                        ClipRect(
                          child: UnconstrainedBox(
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 200),
                              width: _isExtended ? 55 : 0,
                              child: Text(
                                'Log out',
                                softWrap: false,
                                textAlign: TextAlign.right,
                                style: GlobalFontSize.button
                                    .copyWith(color: GlobalColor.shadeLight),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
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
              onDestinationSelected: (index) {
                setState(() {
                  _selectedIndex = index;
                  _currentPage = _pages.values.elementAt(index);
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
          width: 240,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SidebarCard(
                        children: [
                          ThemedText('Upcoming Events', size: GlobalFontSize.subheading2),
                          const SizedBox(height: 7),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ThemedText(
                                          'Sept',
                                          size: GlobalFontSize.small,
                                        ),
                                        ThemedText(
                                          '12',
                                          size: GlobalFontSize.subheading.copyWith(
                                              color: GlobalColor.brand),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ThemedText(
                                      'Wearing of Complete School Uniform (Freshmen)',
                                      size: GlobalFontSize.standard,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Container(
                                    width: 50,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Colors.grey, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        ThemedText(
                                          'Sept',
                                          size: GlobalFontSize.small,
                                        ),
                                        ThemedText(
                                          '20',
                                          size: GlobalFontSize.subheading.copyWith(
                                              color: GlobalColor.brand),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ThemedText(
                                      'Pag-iririmaw 2024',
                                      size: GlobalFontSize.standard,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      SidebarCard(
                        children: [
                          ThemedText('Messages', size: GlobalFontSize.subheading2),
                          const SizedBox(height: 7),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.bell(),
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ThemedText(
                                      'ADMIN: Registration/Enrollment is now closed',
                                      size: GlobalFontSize.standard,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.envelope(),
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ThemedText(
                                      'Enrollment Confirmation',
                                      size: GlobalFontSize.standard,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 7),
                              Row(
                                children: [
                                  Icon(
                                    PhosphorIcons.envelope(),
                                    size: 14,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: ThemedText(
                                      'Scholarship/Discount Confirmation',
                                      size: GlobalFontSize.standard,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: HyperLink(
                              text: '[Open Messages in Inbox](/inbox)',
                              linkStyle:
                                  GlobalFontSize.standard.copyWith(color: GlobalColor.brand),
                              linkCallBack: (msg) => context.go(msg),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      SidebarCard(
                        children: [
                          ThemedText('Documents', size: GlobalFontSize.subheading2),
                          const SizedBox(height: 8),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ThemedText(
                                    'Generate COR',
                                    size: GlobalFontSize.standard,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      PhosphorIcons.download(),
                                      size: 20,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  ThemedText(
                                    'Generate Schedule',
                                    size: GlobalFontSize.standard,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      PhosphorIcons.download(),
                                      size: 20,
                                    ),
                                    onPressed: null,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
