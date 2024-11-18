
import 'package:flutter/material.dart';

class Enrollment extends StatelessWidget {
  const Enrollment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrollment Page'),
      ),
      body: ListView(
        children: [
          // First Container
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Hello World',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Second Container with 12 Rows
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12),
                    child: Text(
                      'I. Enrollment Form for Incoming Freshmen and Continuing Students\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  rowTemplate('Complete Name:', 'Juan De la Cruz Jr.'),
                  rowTemplate('School Year:', '2024 - 2025'),
                  rowTemplate('Semester:', 'Second Semester'),
                  rowTemplate('Grade/Year Level:', 'Third Year'),
                  rowTemplate('Date of Birth:', 'January 01, 2024'),
                  rowTemplate('Citizenship:', 'Chinese'),
                  rowTemplate('Gender:', 'Bisexual'),
                  rowTemplate('Email Address:', 'juan.delacruz@wvsu.edu.ph'),
                  rowTemplate('Contact Number:', '09123456789'),
                  rowTemplate('College:', 'College of Information Communications and Technology'),
                  rowTemplate('Program:', 'Bachelor of Science in Computer Science'),
                  rowTemplate('Permanent Address:', 'Haizhu District 海珠区 Guangzhou, Guangdong Province China'),
                ],
              ),
            ),
          ),

          // Third Container
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    _showEnrollmentSubmittedDialog(context);
                  },
                  child: const Text('Submit Enrollment Confirmation'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Row template for reuse
  static Padding rowTemplate(String leftText, String rightText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          Text(
            rightText,
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

  // Enrollment Confirmation Function to show dialog
  void _showEnrollmentSubmittedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enrollment Submitted'),
          content: const Text('Your enrollment has been submitted successfully!'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
