// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:typed_data';
import 'dart:html' as html; // For web download
import 'package:flutter/material.dart';
// import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:go_router/go_router.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> subjects = [
      {
        "code": "BA 234",
        "description": "Technopreneurship",
        "faculty": "John Doe",
        "time": "1:00 PM - 2:30 PM",
        "room": "ICT 302",
        "units": 3
      },
      {
        "code": "CC 206",
        "description": "Applications Development",
        "faculty": "Jane Smith",
        "time": "1:00 PM - 4:00 PM",
        "room": "ICT 206",
        "units": 2
      },
      {
        "code": "CC 208",
        "description": "Methods of Research",
        "faculty": "Frank Jones",
        "time": "10:00 AM - 11:30 AM",
        "room": "ICT 104",
        "units": 3
      },
      {
        "code": "CC 210",
        "description": "Digital Circuits",
        "faculty": "Emily Davis",
        "time": "9:00 AM - 10:30 AM",
        "room": "ICT 205",
        "units": 3
      },
      {
        "code": "CC 220",
        "description": "Operating Systems",
        "faculty": "Daniel Lee",
        "time": "1:00 PM - 2:30 PM",
        "room": "ICT 103",
        "units": 3
      },
      {
        "code": "CC 230",
        "description": "Cybersecurity",
        "faculty": "Sara Wilson",
        "time": "2:30 PM - 4:00 PM",
        "room": "ICT 302",
        "units": 3
      },
      {
        "code": "CC 240",
        "description": "AI Fundamentals",
        "faculty": "Michael Brown",
        "time": "10:30 AM - 12:00 PM",
        "room": "ICT 207",
        "units": 3
      },
      {
        "code": "CC 250",
        "description": "Network Security",
        "faculty": "Laura White",
        "time": "8:00 AM - 9:30 AM",
        "room": "ICT 202",
        "units": 2
      },
    ];

    final int totalUnits =
        subjects.fold(0, (sum, subject) => sum + (subject["units"] as int));

      Future<void> _downloadPage() async {
        final pdf = pw.Document();

        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Center(
                    child: pw.Text(
                      'Student Profile',
                      style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 16),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Full Name: ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        'Rei Ebenezer G. Duhina',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Student ID: ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        '2022M0128',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Year Level: ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        'Third Year',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Section: ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        'B - AI',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Row(
                    children: [
                      pw.Text(
                        'Course: ',
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 16),
                      ),
                      pw.Text(
                        'Bachelor of Science in Computer Science',
                        style: pw.TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  pw.SizedBox(height: 8),
                  pw.Text(
                    'General Weighted Average: 0.00',
                    style: pw.TextStyle(fontSize: 16, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.SizedBox(height: 16),
                  pw.Center(
                    child: pw.Text(
                      'Class Schedule',
                      style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Center(
                    child: pw.Text(
                      'First Semester 2024 - 2025',
                      style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                  pw.SizedBox(height: 8),
                  pw.Center(
                    child: pw.Text(
                      'Total Units: $totalUnits',
                      style: pw.TextStyle(fontSize: 16),
                    ),
                  ),
                  pw.SizedBox(height: 16),
                  pw.Table(
                    border: pw.TableBorder.all(width: 2),
                    children: [
                      pw.TableRow(
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Code', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Description', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Faculty', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Time', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8.0),
                            child: pw.Text('Room', style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 14)),
                          ),
                        ],
                      ),
                      ...subjects.map((subject) {
                        return pw.TableRow(
                          children: [
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Text(subject['code'] as String, style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Text(subject['description'] as String, style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Text(subject['faculty'] as String, style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Text(subject['time'] as String, style: pw.TextStyle(fontSize: 12)),
                            ),
                            pw.Padding(
                              padding: const pw.EdgeInsets.all(8.0),
                              child: pw.Text(subject['room'] as String, style: pw.TextStyle(fontSize: 12)),
                            ),
                          ],
                        );
                      }).toList(),
                    ],
                  ),
                ],
              );
            },
          ),
        );

        final Uint8List pdfData = await pdf.save();

        final blob = html.Blob([pdfData]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..target = '_blank'
          ..download = 'class_schedule.pdf'
          ..click();
        html.Url.revokeObjectUrl(url);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Schedule downloaded successfully!')),
        );
      }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemedText('Dashboard', size: GlobalFontSize.heading),
          const SizedBox(height: 24),

          // Account and GWA Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: Account Info
              Expanded(
                flex: 2,
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        ClipOval(
                          child: Image.network(
                            'https://images.unsplash.com/photo-1730470316489-0379f25dfabb?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', // Placeholder image
                            width: 80,
                            height: 80,
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
                              const SizedBox(height: 8),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  'Student ID: 2022M0128',
                                  style: GlobalFontSize.standard,
                                ),
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  'Section: B - AI',
                                  style: GlobalFontSize.standard,
                                ),
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Text(
                                  'Year Level: Third Year',
                                  style: GlobalFontSize.standard,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Bachelor of Science in Computer Science\nENROLLED for AY 2024-2025, 1st Semester',
                                style: GlobalFontSize.standard,
                              ),
                              const SizedBox(height: 16),
                              TextButton(
                                style: GlobalStyles.buttonStyle,
                                onPressed: () {
                                  context.go('/account');
                                },
                                child: ThemedText('View Account Details',
                                    size: GlobalFontSize.button,
                                    color: GlobalColor.shadeLight),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Right: GWA Indicator
              Expanded(
                flex: 1,
                child: CustomCard(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText('General Weighted Average (GWA)',
                            size: GlobalFontSize.standard),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircularProgressIndicator(
                                    value: 0.44, // Placeholder
                                    color: GlobalColor.brand,
                                    backgroundColor: Colors.grey.shade300,
                                    strokeWidth: 8,
                                  ),
                                ),
                                Text(
                                  '44%',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ThemedText(
                                  '0.00',
                                  size: GlobalFontSize.heading,
                                  color: GlobalColor.accentOne,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: GlobalStyles.buttonStyle,
                          onPressed: () {
                            // Navigate to grades page
                          },
                          child: ThemedText('View Grades',
                          size: GlobalFontSize.button,
                          color: GlobalColor.shadeLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    'Table View',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: GlobalColor.brand,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Graph View',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Total: $totalUnits units',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    style: GlobalStyles.buttonStyle,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Download Confirmation"),
                            content: const Text(
                                "Are you sure you want to download your schedule?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel"),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _downloadPage();
                                },
                                child: const Text("Download"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: ThemedText('Download Schedule',
                    size: GlobalFontSize.button,
                    color: GlobalColor.shadeLight,
                    
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          CustomCard(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: constraints.maxWidth),
                          child: DataTable(
                            columnSpacing: 16,
                            columns: const [
                              DataColumn(label: Text("Subject Code")),
                              DataColumn(label: Text("Subject Description")),
                              DataColumn(label: Text("Faculty")),
                              DataColumn(label: Text("Time")),
                              DataColumn(label: Text("Room")),
                            ],
                            rows: subjects
                                .map(
                                  (subject) => DataRow(
                                    cells: [
                                      DataCell(Text(subject["code"] as String)),
                                      DataCell(Text(
                                          subject["description"] as String)),
                                      DataCell(
                                          Text(subject["faculty"] as String)),
                                      DataCell(Text(subject["time"] as String)),
                                      DataCell(Text(subject["room"] as String)),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      );
                    },
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
