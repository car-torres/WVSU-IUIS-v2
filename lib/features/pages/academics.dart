import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';

class Academics extends StatelessWidget {
  const Academics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academics'),
        backgroundColor: Colors.black,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileSection(),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      children: [
                        ClassOfferingsSection(),
                        const SizedBox(height: 16),
                        MyGradesSection(),
                        const SizedBox(height: 16),
                        MyScheduleSection(),
                        const SizedBox(height: 16),
                        ChangePasswordSection(), // Example 1: Password change with validation
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Sidebar (Placeholder)
class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: const Center(child: Text('Side Menu')),
    );
  }
}

// Profile Section with Image Change (Example 2)
class ProfileSection extends StatefulWidget {
  @override
  State createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  String _profileImage = 'https://via.placeholder.com/150';

  void _changeProfileImage() {
    setState(() {
      _profileImage = 'https://via.placeholder.com/150/0000FF'; // New image URL
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _changeProfileImage,
              child: CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(_profileImage),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Rei Ebenezer G. Duhina',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('Student ID: 2022M0128'),
            const Text('Program/Degree: Bachelor of Science in Computer Science'),
            const Text('Year Level: 3rd Year'),
            const Text('Status: Enrolled / Regular'),
          ],
        ),
      ),
    );
  }
}

// Class Offerings with List Item Click (Example 3)
class ClassOfferingsSection extends StatelessWidget {
  final List<String> classOfferings = [
    'Math 101',
    'Physics 202',
    'Chemistry 303'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Class Offerings',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ListView.builder(
              shrinkWrap: true,
              itemCount: classOfferings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(classOfferings[index]),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(classOfferings[index]),
                          content:
                              Text('Details about ${classOfferings[index]}.'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// My Grades Section (Static Placeholder)
class MyGradesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('My Grades'),
      ),
    );
  }
}

// My Schedule Section (Static Placeholder)
class MyScheduleSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('My Schedule'),
      ),
    );
  }
}

// Change Password Section with Validation (Example 1)
class ChangePasswordSection extends StatefulWidget {
  @override
  State createState() => _ChangePasswordSectionState();
}

class _ChangePasswordSectionState extends State<ChangePasswordSection> {
  final _formKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      // Placeholder for password change action
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Change Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _oldPasswordController,
                decoration: const InputDecoration(labelText: 'Old Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your old password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _newPasswordController,
                decoration: const InputDecoration(labelText: 'New Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return 'New password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _changePassword,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
