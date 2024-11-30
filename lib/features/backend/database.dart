import 'package:cloud_firestore/cloud_firestore.dart';


class Database {
  static final _db = FirebaseFirestore.instance;

  static getUser(String id) async {
    await _db.collection("students").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()["firstname"]}");
      }
    });
  }

  static validateExistingStudentID(String studentID) async {
    final event = await _db.collection("students")
      .where("studentID", isEqualTo: studentID.toUpperCase())
      .get();

    if (event.docs.isEmpty) {
      return "Student ID Entry Invalid. It's either that your ID\ndoes not exist in the database, or you have\nentered the incorrect ID.";
    }

    return event.docs[0];
  }

  static Future<String?> validatePassword(String studentID, String password) async {
    var student = await validateExistingStudentID(studentID);

    if (student.runtimeType == String) {
      return student;
    }

    final dbPassword = student.data()["password"];
    if (dbPassword != password) {
      return "Password is incorrect.";
    }

    return null;
  }
}