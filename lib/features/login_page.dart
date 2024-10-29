import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/homepage.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  bool _isAgreed = false; // Checkbox state
  bool _isEmailValid = false; // Email validation state
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _emailController.addListener(_validateEmail);
  }

  // Function to show an alert
  void _showAlert(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      },
    );

    // Automatically close the dialog after 2 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    });
  }

  // Email validation function
  void _validateEmail() {
    String email = _emailController.text;
    bool isValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(email);
    setState(() {
      _isEmailValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left side: form fields
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Row(
                    children: [
                      Image.asset(
                        'assets/test.jpg',
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        'assets/test.jpg',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Title Text
                  const Text(
                    'Integrated University\nInformation System',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to your account to continue.',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),

                  // TabBar for Login and Forgot Password
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: 'Login'),
                      Tab(text: 'Forgot Password'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // TabBarView for content switching
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        // Login Tab
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Student ID Number",
                                hintText: "Ex. 2022M0099",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Password",
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Checkbox(
                                  value: _isAgreed,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      _isAgreed = value ?? false;
                                    });
                                  },
                                ),
                                const Expanded(
                                  child: Text(
                                    "I have read and agree to the terms of the Data Privacy Agreement",
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _isAgreed
                                  ? () {
                                      // _showAlert(context, "Log In", "Redirecting...",);
                                      Navigator.push(context, MaterialPageRoute(builder: (_) => const Homepage()));
                                    }
                                  : null,
                              child: const Text("Log in"),
                            ),
                          ],
                        ),

                        // Forgot Password Tab
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Enter your email address to receive a temporary password.",
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _isEmailValid
                                  ? () {
                                      _showAlert(
                                          context,
                                          "Temporary Password Sent",
                                          "Check your spam folder.");
                                    }
                                  : null,
                              child: const Text("Send Temporary Password"),
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

          // Right side: background image or placeholder
          Expanded(
            flex: 1,
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

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}
