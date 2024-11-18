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

  static Future<String?> validatePassword(String studentID, String password) async {
    final event = await _db.collection("students")
      .where("studentID", isEqualTo: studentID)
      .where("password", isEqualTo: password)
      .get();

    if (event.docs.isEmpty) {
      return "There is no student with that ID in our database.";
    }

    final dbPassword = event.docs[0].data()["password"];
    if (dbPassword != password) {
      return "Password is incorrect.";
    }

    return null;
  }
}