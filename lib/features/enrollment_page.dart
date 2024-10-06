import 'package:flutter/material.dart';

class EnrollmentPage extends StatelessWidget {
  const EnrollmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enrollment Page'),
      ),
      body: ListView(
        children: [
          // First Container with "Hello World" text
          Padding(
            padding: const EdgeInsets.all(12), // Add 12 pixels of padding
            child: Container(
              height: 100, // Set height for the container
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to start horizontally
                mainAxisAlignment: MainAxisAlignment.start, // Align to start vertically
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0), // Optional padding for the text
                    child: Text(
                      'Hello World',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), // Text color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Second Container with 12 Rows manually added
          Padding(
            padding: const EdgeInsets.all(12), // Add 12 pixels of padding
            child: Container(
              height: 400, // Adjusted height for 12 rows
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)), // Rounded corners
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to start horizontally
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align to start vertically
                children: [
                  // Padding for all sides except the bottom for the header text
                  const Padding(
                    padding: EdgeInsets.only(left: 12, right: 12, top: 12), // Padding on top, left, and right
                    child: Text(
                      'I. Enrollment Form for Incoming Freshmen and Continuing Students\n',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), // Text color
                        fontSize: 16, // Optional font size
                      ),
                    ),
                  ),

                  // 12 Rows
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

          // Third Container with a button
          Padding(
            padding: const EdgeInsets.all(12), // Add 12 pixels of padding
            child: Container(
              height: 50, // Set height for the container
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 211, 211, 211),
                borderRadius: const BorderRadius.all(Radius.circular(12)), // Rounded corners
              ),
              child: Center( // Center the button within the container
                child: ElevatedButton(
                  onPressed: () {
                    // Add your button action here
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
      padding: const EdgeInsets.symmetric(horizontal: 12), // Padding on both sides
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Spread items evenly
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
}
