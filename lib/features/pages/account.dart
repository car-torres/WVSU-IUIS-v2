import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wvsu_iuis_v2/features/components/custom_text_field.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';
import 'package:wvsu_iuis_v2/features/backend/database.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State createState() => _AccountState();
}

class _AccountState extends State<Account> {
  String _oldPassword = "";
  String _newPassword = "";

  Future<void> _validatePassword(BuildContext context) async {
    final studentID = localStorage.getItem('student-id') ?? '';

    String? errorMessage =
        await Database.validatePassword(studentID, _oldPassword);
    // Validate password from Firebase

    if (!context.mounted) return;

    if (errorMessage != null) {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: ThemedText("Password Change Error",
                    size: GlobalFontSize.subheading),
                content: ThemedText(errorMessage ?? '',
                    size: GlobalFontSize.standard),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Close'),
                      child: const Text('Close'))
                ],
              ));
      return;
    }

    if (!RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[A-Z])(?=.*[0-9]).{8,}$')
        .hasMatch(_newPassword)) {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: ThemedText("Password Change Error",
                    size: GlobalFontSize.subheading),
                content: ThemedText(
                    'Passwords must contain 1 special character, 1 uppercase letter, and 1 number.',
                    size: GlobalFontSize.standard),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Close'),
                      child: const Text('Close'))
                ],
              ));
      return;
    }

    errorMessage = await Database.update(studentID, 'password', _newPassword);

    if (!context.mounted) return;
    if (errorMessage != null) {
      await showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: ThemedText("Password Change Error",
                    size: GlobalFontSize.subheading),
                content: ThemedText(errorMessage ?? '',
                    size: GlobalFontSize.standard),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context, 'Close'),
                      child: const Text('Close'))
                ],
              ));
      return;
    }

    await showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: ThemedText("Password Change Success",
                  size: GlobalFontSize.subheading),
              content: ThemedText('Password Changed Successfully',
                  size: GlobalFontSize.standard),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, 'Close'),
                    child: const Text('Close'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemedText(
            'Account Information',
            size: GlobalFontSize.heading,
          ),
          const SizedBox(height: 24),
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1730470316489-0379f25dfabb?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ThemedText(
                            'Rei Ebenezer G. Duhina',
                            size: GlobalFontSize.subheading,
                            color: GlobalColor.accentOne,
                          ),
                          const SizedBox(height: 4),
                          Opacity(
                            opacity: 0.6,
                            child: RichText(
                              text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: const [
                                  TextSpan(
                                    text: 'Student ID: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(text: '2022M0128'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add edit functionality here
                      },
                      style: GlobalStyles.buttonStyle,
                      child: ThemedText(
                        'Edit Personal Information',
                        size: GlobalFontSize.button,
                        color: GlobalColor.shadeLight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ThemedText('Academic Information',
                    size: GlobalFontSize.subheading2),
                const SizedBox(height: 8),
                Opacity(
                  opacity: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                                text: 'Program/Degree: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                                text:
                                    'Bachelor of Science in Computer Science'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                                text: 'Year Level: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: '3rd year'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                                text: 'Status: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: 'Regular'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ThemedText('Personal Information',
                    size: GlobalFontSize.subheading2),
                const SizedBox(height: 8),
                Opacity(
                  opacity: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'Email: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'reiebenezer.duhina@wvsu.edu.ph',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: const [
                            TextSpan(
                              text: 'Address: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(
                              text: 'Purok 1, Yapo, Barbaza, Antique 5706',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          CustomCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ThemedText('Change Password', size: GlobalFontSize.subheading),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Old Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _oldPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'New Password',
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _newPassword = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  style: GlobalStyles.buttonStyle,
                  onPressed: () => _validatePassword(context),
                  child: ThemedText('Update Password',
                      size: GlobalFontSize.button,
                      color: GlobalColor.shadeLight),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
