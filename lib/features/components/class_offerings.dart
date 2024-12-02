import 'package:flutter/material.dart';
import 'package:wvsu_iuis_v2/features/components/custom_card.dart';
import 'package:wvsu_iuis_v2/features/components/custom_text_field.dart';
import 'package:wvsu_iuis_v2/features/components/themed_text.dart';
import 'package:wvsu_iuis_v2/features/theme.dart';

class ClassOfferings extends StatefulWidget {
  const ClassOfferings({super.key});

  @override
  State<StatefulWidget> createState() => _ClassOfferingsState();
}

class _ClassOfferingsState extends State<ClassOfferings> {
  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ThemedText('Class Offerings',
              size: GlobalFontSize.subheading, color: GlobalColor.accentOne),
          const SizedBox(
            height: 32,
          ),
          const CustomTextField(
            hint: 'Search by subject code or description...',
          ),
          const SizedBox(
            height: 32,
          ),
          ThemedText('Filters', size: GlobalFontSize.button),
          const SizedBox(height: 16),
          const Row(
            children: [
              SizedBox(
                width: 240,
                child: CustomTextField(
                  enabled: false,
                  label: 'Academic Year',
                  hint: '2024-2025',
                ),
              ),
              SizedBox(
                width: 16,
              ),
              SizedBox(
                width: 120,
                child: CustomTextField(
                  enabled: false,
                  label: 'Semester',
                  hint: '1st',
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            label: 'College',
            hint: 'Information and Communications Technology',
            enabled: false,
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            label: 'Program',
            hint: 'Bachelor of Science in Computer Science',
            enabled: false,
          ),
          const SizedBox(
            height: 32,
          ),
          Table(
            border: const TableBorder(
                horizontalInside: BorderSide(color: GlobalColor.gray)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            columnWidths: const {
              0: FixedColumnWidth(100),
              1: FixedColumnWidth(100),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1),
              4: FixedColumnWidth(120),
              5: FlexColumnWidth(3)
            },
            children: <TableRow>[
              TableRow(children: [
                ...['Class', 'Subject Code', 'Subject Description', 'Faculty']
                    .map((s) => Padding(
                          padding: const EdgeInsets.all(16),
                          child: TableCell(
                              child: ThemedText(s, color: Colors.black54)),
                        )),
                const TableCell(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        ThemedText('Units', color: Colors.black54),
                        Divider(thickness: 0.5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ThemedText('Lec', color: Colors.black54),
                              ThemedText('Lab', color: Colors.black54),
                              ThemedText('Total', color: Colors.black54),
                            ])
                      ],
                    ),
                  ),
                ),
                const TableCell(
                    child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ThemedText(
                        'Schedule',
                        color: Colors.black54,
                      ),
                      Divider(thickness: 0.5),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: ThemedText(
                              'Day',
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: ThemedText(
                              'Time',
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(width: 8),
                          ThemedText(
                            'Room',
                            color: Colors.black54,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ]),
              _acadsRow(
                  classSection: 'BSCS 3B-AI',
                  subjectCode: 'BA 234',
                  subjectDescription: 'Technopreneurship',
                  faculty: 'TBA',
                  lecUnits: 3,
                  labUnits: 0,
                  schedules: [
                    Schedule(
                        weekday: Weekday.monday,
                        startTime: const ScheduleTime(13, 0),
                        endTime: const ScheduleTime(14, 30),
                        room: 'ICT 302'),
                    Schedule(
                        weekday: Weekday.wednesday,
                        startTime: const ScheduleTime(13, 0),
                        endTime: const ScheduleTime(14, 30),
                        room: 'ICT 302'),
                  ])
            ],
          )
        ],
      ),
    );
  }

  TableRow _acadsRow(
      {required String classSection,
      required String subjectCode,
      required String subjectDescription,
      required String faculty,
      required int lecUnits,
      required int labUnits,
      required List<Schedule> schedules}) {
    return TableRow(children: [
      ...[
        classSection,
        subjectCode,
        subjectDescription,
        faculty,
      ].map((text) => TableCell(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ThemedText(text),
            ),
          )),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [lecUnits, labUnits, lecUnits + labUnits]
                .map((unit) => ThemedText(unit.toString()))
                .toList(),
          ),
        ),
      ),
      TableCell(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: schedules
                .map((sched) => Row(
                      children: [
                        SizedBox(
                          width: 30,
                          child: ThemedText(
                            sched.day,
                            size: GlobalFontSize.button,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(child: ThemedText(sched.time)),
                        const SizedBox(width: 8),
                        ThemedText(sched.room),
                      ],
                    ))
                .toList(),
          ),
        ),
      )
    ]);
  }
}

class Schedule {
  final Weekday _weekday;
  final ScheduleTime _startTime;
  final ScheduleTime _endTime;
  final String room;

  Schedule(
      {required Weekday weekday,
      required ScheduleTime startTime,
      required ScheduleTime endTime,
      required this.room})
      : _weekday = weekday,
        _startTime = startTime,
        _endTime = endTime;

  String get day => _weekday.code;
  String get time => "${_startTime.time} - ${_endTime.time}";

  @override
  String toString() {
    return "$time $room";
  }
}

class ScheduleTime {
  final int hour;
  final int minute;

  const ScheduleTime(this.hour, this.minute);
  String get time =>
      "${(hour % 12).toString().padLeft(2, '0')}:${(minute % 60).toString().padLeft(2, '0')} ${(hour % 24) < 12 ? 'AM' : 'PM'}";
}

enum Weekday implements Comparable<String> {
  sunday('Su'),
  monday('M'),
  tuesday('T'),
  wednesday('W'),
  thursday('Th'),
  friday('F'),
  saturday('Sa');

  final String code;

  @override
  int compareTo(String other) {
    const keywords = ['Su', 'M', 'T', 'W', 'Th', 'F', 'Sa'];

    return keywords.indexOf(code) - keywords.indexOf(other);
  }

  const Weekday(this.code);
}
