import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';
import 'package:wvsu_iuis_v2/features/components/custom_text_field.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  String _selectedPaymentMethod =
      'Full Payment'; // Initialize the default value
  String _selectedScholarship =
      'Free Higher Education'; // Initialize the default value
  bool _agreementChecked = false; // Initialize the default value

  // Dummy function for uploading scholarship documents
  void _uploadScholarshipDocuments() {
    // Implement document upload logic here
    print('Upload Scholarship Documents');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ThemedText('Enrollment Confirmation', size: GlobalFontSize.heading),
          const SizedBox(height: 24),
          CustomCard(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemedText(
                    'Guidelines for Enrollment',
                    size: GlobalFontSize.subheading,
                    color: GlobalColor.accentOne,
                  ),
                  const SizedBox(height: 16),
                  ThemedText('I. Personal Information',
                      size: GlobalFontSize.button),
                  ThemedText(
                    '  1. Make sure that your information below is complete, updated, and correct. Otherwise, you cannot proceed to confirm your enrollment.\n'
                    '  2. Should you have any lacking information in your account, proceed to the "Account Information" section and update your information from there. ',
                    size: GlobalFontSize.standard,
                  ),
                  const SizedBox(height: 16),
                  ThemedText(
                    'II. Scholarship Application (Free Higher Education, etc)',
                    size: GlobalFontSize.button,
                  ),
                  ThemedText(
                    '  1. Should you opt for a scholarship this semester, download and fill out the applicable Scholarship Application Form provided to you by this portal. \n'
                    '  2. Follow the procedure(s) on the next page on how to upload said form.\n'
                    '  3. The uploaded scholarship form(s) will be reviewed by the OSA Scholarship Coordinator.',
                    size: GlobalFontSize.standard,
                  ),
                  const SizedBox(height: 16),
                  ThemedText(
                    'III. Miscellaneous',
                    size: GlobalFontSize.button,
                  ),
                  ThemedText(
                    '  1. You are not allowed to make any modifications to your enrollment confirmation form after submission. \n'
                    '  2. Once submitted, any changes to your personal information on your account will not be accepted. You are only allowed to change your information once enrollment opens again. \n'
                    '  3. The confirmation email will be sent to both your school email address and your IUIS messaging account. \n'
                    '  4. To avoid problems with your enrollment, check out the guidelines and procedure through this link: https://wvsu.edu.ph/general-guidelines-of-online-enrollment',
                    size: GlobalFontSize.standard,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomCard(
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ThemedText(
                    'Enrollment Form',
                    size: GlobalFontSize.subheading,
                    color: GlobalColor.accentOne,
                  ),
                  const SizedBox(height: 16),
                  ThemedText(
                    'I. Personal Information',
                    size: GlobalFontSize.standard,
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      SizedBox(
                          width: 360,
                          child: CustomTextField(
                            label: 'Complete Name',
                            enabled: false,
                          )),
                      SizedBox(width: 8),
                      SizedBox(
                          width: 240,
                          child: CustomTextField(
                            label: 'Student ID',
                            enabled: false,
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      SizedBox(
                          width: 240,
                          child: CustomTextField(
                            label: 'Grade/Year Level',
                            enabled: false,
                          )),
                      SizedBox(width: 8),
                      SizedBox(
                          width: 360,
                          child: CustomTextField(
                            label: 'Permanent Address',
                            enabled: false,
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    children: [
                      SizedBox(
                          width: 240,
                          child: CustomTextField(
                            label: 'Contact Number',
                            enabled: false,
                          )),
                      SizedBox(width: 8),
                      SizedBox(
                          width: 360,
                          child: CustomTextField(
                            label: 'Email Address',
                            enabled: false,
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ThemedText(
                    'II. Payment and Scholarships',
                    size: GlobalFontSize.standard,
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                      width: 608,
                      child: CustomTextField(
                        label: 'Payment Method',
                        enabled: false,
                      )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const SizedBox(
                          width: 360,
                          child: CustomTextField(
                            label: 'Contact Number',
                            enabled: false,
                          )),
                      const SizedBox(width: 8),
                      SizedBox(
                          width: 240,
                          child: OutlinedButton(
                              style: GlobalStyles.buttonStyle.copyWith(
                                  side: const WidgetStatePropertyAll(
                                BorderSide(
                                  color: GlobalColor.brand,
                                ),
                              )),
                              onPressed: () {},
                              child: ThemedText(
                                'Upload Scholarship Documents',
                                size: GlobalFontSize.button,
                                color: GlobalColor.shadeLight,
                              ))),
                    ],
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
