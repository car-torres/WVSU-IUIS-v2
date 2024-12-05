import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static final _db = FirebaseFirestore.instance;

  static Future<DocumentSnapshot<Map<String, dynamic>>> getStudent(
      String studentID) async {
    final data = await findByID("students", studentID.toUpperCase());

    if (!data.exists) {
      throw ("Student ID Entry Invalid. It's either that your ID\ndoes not exist in the database, or you have\nentered the incorrect ID.");
    }

    return data;
  }

  static Future<String?> validatePassword(
      String studentID, String password) async {
    final DocumentSnapshot<Map<String, dynamic>> studentData;

    try {
      studentData = await getStudent(studentID);
    } catch (e) {
      return e.toString();
    }

    final dbPassword = studentData.data()?["password"];
    if (dbPassword != password) {
      return "Password is incorrect.";
    }

    return null;
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> findByID(String collection, String id) async {
    return await _db.collection(collection).doc(id).get();
  }

  static Future<String?> update(
      String studentID, String field, String newValue) async {
    final DocumentSnapshot<Map<String, dynamic>> studentData;

    try {
      studentData = await getStudent(studentID);
    } catch (e) {
      return e.toString();
    }

    try {
      studentData.reference.update({field: newValue});
    } catch (e) {
      return e.toString();
    }

    return null;
  }
}
