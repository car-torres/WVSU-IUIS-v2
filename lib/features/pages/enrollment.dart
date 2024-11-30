import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class Enrollment extends StatefulWidget {
  const Enrollment({super.key});

  @override
  State<Enrollment> createState() => _EnrollmentState();
}

class _EnrollmentState extends State<Enrollment> {
  String _selectedPaymentMethod = 'Full Payment';  // Initialize the default value
  String _selectedScholarship = 'Free Higher Education';  // Initialize the default value
  bool _agreementChecked = false; // Initialize the default value


  // Dummy function for uploading scholarship documents
  void _uploadScholarshipDocuments() {
    // Implement document upload logic here
    print('Upload Scholarship Documents');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ThemedText(
          'Enrollment Confirmation',
          size: GlobalFontSize.heading,
        ),
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
                ThemedText(
                  'I. Personal Information',
                  size: GlobalFontSize.standard,
                ),
                ThemedText(
                  '  1. Make sure that your information below is complete, updated, and correct. Otherwise, you cannot proceed to confirm your enrollment.\n'
                  '  2. Should you have any lacking information in your account, proceed to the "Account Information" section and update your information from there. ',
                  size: GlobalFontSize.standard2,
                ),
                const SizedBox(height: 16),
                ThemedText(
                  'II. Scholarship Application (Free Higher Education, etc)',
                  size: GlobalFontSize.standard,
                ),
                ThemedText(
                  '  1. Should you opt for a scholarship this semester, download and fill out the applicable Scholarship Application Form provided to you by this portal. \n'
                  '  2. Follow the procedure(s) on the next page on how to upload said form.\n'
                  '  3. The uploaded scholarship form(s) will be reviewed by the OSA Scholarship Coordinator.',
                  size: GlobalFontSize.standard2,
                ),
                const SizedBox(height: 16),
                ThemedText(
                  'III. Miscellaneous',
                  size: GlobalFontSize.standard,
                ),
                ThemedText( 
                  '  1. You are not allowed to make any modifications to your enrollment confirmation form after submission. \n'
                  '  2. Once submitted, any changes to your personal information on your account will not be accepted. You are only allowed to change your information once enrollment opens again. \n'
                  '  3. The confirmation email will be sent to both your school email address and your IUIS messaging account. \n'
                  '  4. To avoid problems with your enrollment, check out the guidelines and procedure through this link: https://wvsu.edu.ph/general-guidelines-of-online-enrollment',
                  size: GlobalFontSize.standard2,
                )
                
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        CustomCard(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                  size: GlobalFontSize.standard2,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Complete Name',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 573,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: 'John Doe'),
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Student ID',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 240,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: '2022M0123'),
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Grade/Year Level',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 373,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: 'Third Year Undergraduate'),
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),                             
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Permanent Address',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 441,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: 'Purok 1 Yapo, Barbaza, Antique'), 
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Contact Number',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 373,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: '09123456789'),
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),                             
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Email Address',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 441,  
                          height: 34, 
                          child: TextField(
                            controller: TextEditingController(text: 'johndoe@gmail.com'), 
                            enabled: false,  
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), 
                            ),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,  
                            ), 
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ThemedText(
                  'II. Payment and Scholarships',
                  size: GlobalFontSize.standard2,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Mode of Payment',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 830,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedPaymentMethod,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedPaymentMethod = newValue!;
                              });
                            },
                            isExpanded: true,
                            underline: Container(),
                            items: <String>[
                              'Full Payment',
                              'Installment',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          'Scholarship',
                          size: GlobalFontSize.small,
                        ),
                        const SizedBox(height: 12),
                        Container(
                          width: 514,
                          height: 34,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: DropdownButton<String>(
                            value: _selectedScholarship,
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedScholarship = newValue!;
                              });
                            },
                            isExpanded: true,
                            underline: Container(),
                            items: <String>[
                              'Free Higher Education',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Text(value),
                                ),
                              );
                            }).toList(),
                            style: TextStyle(
                              fontSize: GlobalFontSize.standard2.fontSize,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Padding(
                      padding: const EdgeInsets.only(top: 23.0),
                      child: Container(
                        width: 300,  
                        height: 34,
                        child: TextButton(
                          onPressed: _uploadScholarshipDocuments,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: GlobalColor.accentOne)
                            ),
                          ),
                          child: ThemedText(
                            'Upload Scholarship Documents',
                            color: GlobalColor.accentOne,
                            size: GlobalFontSize.subheading2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ThemedText(
                  'III. Enrollment Agreement',
                  size: GlobalFontSize.standard2,
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  tileColor: Colors.transparent,
                  contentPadding: const EdgeInsets.all(0),
                  selectedTileColor: Colors.teal,
                  controlAffinity: ListTileControlAffinity.leading,
                  value: _agreementChecked,
                  onChanged: (value) {
                    setState(() {
                      _agreementChecked = value ?? false;
                    });
                  },
                  title: Text.rich(
                    TextSpan(
                      text: 'I hereby signify that the above-stated information are true and correct and do agree to share my personal information with \n',
                      style: GlobalFontSize.standard2,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'West Visayas State University', 
                          style: GlobalFontSize.standard,
                        ),
                        TextSpan(
                          text: ' authorities.',
                          style: GlobalFontSize.standard2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 202,
                  height: 34,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
                      padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                      backgroundColor:
                      const WidgetStatePropertyAll(GlobalColor.brand),
                    ),
                    onPressed: null,
                    child: ThemedText("Submit Enrollment Form",
                      size: GlobalFontSize.button,
                      color: GlobalColor.shadeLight)
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
