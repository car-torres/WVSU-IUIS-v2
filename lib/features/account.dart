import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';
import 'package:wvsu_iuis_v2/features/backend/database.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  String? _passwordError;
  bool _isPasswordValid = true;

  Future<void> _validatePassword() async {
    final studentID = '2022M0128'; // Replace with dynamic student ID
    final oldPassword = _oldPasswordController.text;

    // Validate password from Firebase
    final errorMessage = await Database.validatePassword(studentID, oldPassword);
    setState(() {
      _passwordError = errorMessage;
    });
  }

  bool _validateNewPassword(String password) {
    final regex =
        RegExp(r'^(?=.*[!@#$%^&*(),.?":{}|<>])(?=.*[A-Z])(?=.*[0-9]).{8,}$');
    return regex.hasMatch(password);
  }

  Future<void> _showSuccessPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: const EdgeInsets.all(16),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ThemedText(
                'Password changed successfully',
                size: GlobalFontSize.standard,
                color: GlobalColor.accentOne,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemedText('Account Information', size: GlobalFontSize.heading),
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
                                children: [
                                  const TextSpan(
                                    text: 'Student ID: ',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const TextSpan(text: '2022M0128'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Add edit functionality here
                      },
                      child: const Text('Edit Personal Information'),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ThemedText('Academic Information', size: GlobalFontSize.subheading),
                const SizedBox(height: 8),
                Opacity(
                  opacity: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                                text: 'Program/Degree: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: 'Bachelor of Science in Computer Science'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                                text: 'Year Level: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: '3rd year'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                                text: 'Status: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const TextSpan(text: 'Regular'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                ThemedText('Personal Information', size: GlobalFontSize.subheading),
                const SizedBox(height: 8),
                Opacity(
                  opacity: 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: 'Email: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
                              text: 'reiebenezer.duhina@wvsu.edu.ph',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(
                              text: 'Address: ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(
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
                TextField(
                  controller: _oldPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Old Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: _passwordError,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _newPasswordController,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordValid = _validateNewPassword(value);
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorText: _isPasswordValid
                        ? null
                        : 'Password must contain 1 special character, 1 uppercase, and 1 number.',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    await _validatePassword();
                    if (_isPasswordValid && _passwordError == null) {
                      await _showSuccessPopup(context);
                    }
                  },
                  child: const Text('Update Password'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
