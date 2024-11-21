import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

  String _studentID = "";
  String _password = "";
  String _email = "";
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
              child: ListView(
                shrinkWrap: true,
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
                    TabBar(
                      controller: _tabController,
                      tabs: tabs,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                    ),
                    SizedBox(
                      height: 300,
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
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/bg.jpg'), // Background image path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    GlobalColor.accentOne.withAlpha(128),
                    GlobalColor.shadeLight.withAlpha(128),
                  ]),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 4,
        ),
        ...withGap(height: 24, children: [
          _textField(
            label: "Student ID",
            hint: "Example: 2024M0123",
            icon: PhosphorIconsBold.user,
            onChanged: (id) => _studentID = id,
          ),
          _textField(
              label: "Password",
              icon: PhosphorIconsBold.key,
              obscureText: true,
              onChanged: (id) => _password = id),
          CheckboxListTile(
            tileColor: Colors.transparent,
            hoverColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(0),
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
                  onPressed: () async => await _validateLogin(context),
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
    return Column(
      children: [
        const SizedBox(
          height: 4,
        ),
        ...withGap(height: 24, children: [
          _textField(
            label: "Email",
            hint: "firstname.lastname@wvsu.edu.ph",
            icon: PhosphorIconsBold.envelope,
            onChanged: (email) => _email = email,
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
                  child: ThemedText("Send Verification Message",
                      size: GlobalFontSize.button,
                      color: GlobalColor.shadeLight)),
            ),
          )
        ])
      ],
    );
  }

  TextFormField _textField({
    String? label,
    String? hint,
    void Function(String)? onChanged,
    PhosphorFlatIconData? icon,
    bool obscureText = false,
  }) {
    return TextFormField(
      style: GlobalFontSize.standard,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: icon != null ? PhosphorIcon(icon, size: 14) : null,
        labelText: label,
        hintText: hint,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: GlobalFontSize.standard,
        enabledBorder: GlobalStyles.inputBorder,
        focusedBorder: GlobalStyles.inputBorder,
        errorBorder: GlobalStyles.inputBorder,
        focusedErrorBorder: GlobalStyles.inputBorder,
        hintStyle: GlobalFontSize.standard
            .copyWith(color: GlobalColor.shadeDark.withAlpha(128)),
      ),
    );
  }

   _validateLogin(BuildContext context) async {
    String? v = _fieldsAreEmpty();
    if (v != null) {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: ThemedText("Login Error", size: GlobalFontSize.subheading),
                content: ThemedText(v, size: GlobalFontSize.standard),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Close'),
                      child: const Text('Close'))
                ],
              ));
      return;
    }

    Database.validatePassword(_studentID, _password).then((val) async {
      if ((val != null || !_agreementChecked) && context.mounted) {
        await showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  title: ThemedText("Login Error", size: GlobalFontSize.subheading),
                  content: ThemedText(val ?? 'Error message', size: GlobalFontSize.standard),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'Close'),
                        child: const Text('Close'))
                  ],
                ));

        return;
      }

      if (context.mounted) {
        context.go('/');
      }
    });
  }

  String? _fieldsAreEmpty() {
    if (_studentID.isEmpty) return 'The Student ID field is empty!';
    if (_password.isEmpty) return 'The password field is empty!';

    return _agreementChecked ? null : 'You have not checked the agreement box!';
  }
}
