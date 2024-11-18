import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hyperlink/hyperlink.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:wvsu_iuis_v2/features/backend/database.dart';
import 'package:wvsu_iuis_v2/features/components/helpers.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignIn>
    with SingleTickerProviderStateMixin {
  static const List<Tab> tabs = [
    Tab(text: "Login"),
    Tab(text: "Forgot Password"),
  ];

  late TabController _tabController;
  bool _agreementChecked = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Form(
                child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    "assets/wvsu_logo.svg",
                    width: 80,
                    height: 80,
                  ),
                  const SizedBox(height: 48),
                  GradientText("Integrated University Information System",
                      style: GlobalFontSize.heading
                          .copyWith(fontSize: 48, height: 1.2, shadows: [
                        Shadow(
                          color: GlobalColor.shadeDark.withAlpha(30),
                          offset: const Offset(0, 4),
                          blurRadius: 6,
                        )
                      ]),
                      colors: const [
                        GlobalColor.accentOne,
                        GlobalColor.brand,
                      ]),
                  const SizedBox(height: 48),
                  ...withGap(height: 24, children: [
                    ThemedText("Sign in to your account to continue.",
                        size: GlobalFontSize.standard),
                    TabBar(controller: _tabController, tabs: tabs),
                    Expanded(
                      // height: 300,
                      child: TabBarView(
                        controller: _tabController,
                        children: [_loginForm(), _forgotPasswordForm()],
                      ),
                    )
                  ]),
                ],
              ),
            )),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/test.jpg'), // Background image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return ListView(
      shrinkWrap: true,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4,
        ),
        ...withGap(height: 24, children: [
          TextFormField(
            style: GlobalFontSize.standard,
            decoration: InputDecoration(
              suffixIcon: const PhosphorIcon(
                PhosphorIconsFill.user,
                size: 14,
              ),
              labelText: "Student ID",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: GlobalFontSize.standard,
              hintText: "Example: 2024M0123",
              enabledBorder: GlobalStyles.inputBorder,
              focusedBorder: GlobalStyles.inputBorder,
              hintStyle: GlobalFontSize.standard
                  .copyWith(color: GlobalColor.shadeDark.withAlpha(128)),
            ),
          ),
          TextFormField(
            style: GlobalFontSize.standard,
            obscureText: true,
            decoration: InputDecoration(
              suffixIcon: const PhosphorIcon(
                PhosphorIconsFill.key,
                size: 14,
              ),
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelStyle: GlobalFontSize.standard,
              enabledBorder: GlobalStyles.inputBorder,
              focusedBorder: GlobalStyles.inputBorder,
              hintStyle: GlobalFontSize.standard
                  .copyWith(color: GlobalColor.shadeDark.withAlpha(128)),
            ),
          ),
          CheckboxListTile(
            tileColor: Colors.transparent,
            hoverColor: Colors.transparent,
            selectedTileColor: Colors.teal,
            controlAffinity: ListTileControlAffinity.leading,
            value: _agreementChecked,
            onChanged: (value) {
              setState(() {
                _agreementChecked = value ?? false;
              });
            },
            title: HyperLink(
              text:
                  'I have read and agree to the terms of the [Data Privacy Agreement](https://wvsu.edu.ph)',
              linkStyle:
                  GlobalFontSize.standard.copyWith(color: GlobalColor.brand),
              textStyle: GlobalFontSize.standard
                  .copyWith(color: GlobalColor.shadeDark),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: GlobalColor.shadeDark.withAlpha(30),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                  spreadRadius: -2,
                )
              ]),
              child: TextButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                    padding: const WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                    backgroundColor:
                        const WidgetStatePropertyAll(GlobalColor.brand),
                  ),
                  onPressed: () {},
                  child: ThemedText("Log in",
                      size: GlobalFontSize.button,
                      color: GlobalColor.shadeLight)),
            ),
          )
        ])
      ],
    );
  }

  Widget _forgotPasswordForm() {
    return const Column(
      children: [Text("Hello World")],
    );
  }
}
