import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:localstorage/localstorage.dart';
import 'package:wvsu_iuis_v2/features/backend/database.dart';

class StudentData {
  static StudentData? _instance;

  factory StudentData() {
    _instance ??= StudentData._internal();
    return _instance!;
  }

  late String _studentID;

  StudentData._internal() {
    var id = localStorage.getItem('student-id');

    if (id == null) {
      return;
    }

    _studentID = id;
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> _getStudentSnapshot() async {
    DocumentSnapshot<Map<String, dynamic>> resultOrError;

    try {
      resultOrError = await Database.getStudent(_studentID);
    } catch (e) {
      return null;
    }

    return resultOrError;
  }

  Future<List<dynamic>?> get subjects async {
    DocumentSnapshot<Map<String, dynamic>>? student =
        await _getStudentSnapshot();

    if (student == null) {
      return null;
    }

    final subjects = await Future.wait(
        (student.data()?['assigned_subjects'] as Map).values.map((item) async {
      final subjectName = item['subject_name'] as String;
      final subjectSnapshot = await Database.findByID("subjects", subjectName.replaceAll('subjects/', ''));

      return subjectSnapshot.data();
    }));

    return subjects.toList();
  }
}
