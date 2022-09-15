import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseTest {
  static DatabaseTest instance = DatabaseTest._();
  DatabaseTest._();

  Future createProfile(String email) async {
    final data = FirebaseFirestore.instance.collection('users');
    User? userNOW = FirebaseAuth.instance.currentUser;

    await data
        .doc(userNOW?.uid)
        .set({
          'email': email,
          'imageg': "https://firebasestorage.googleapis.com/v0/b/projectend-5d5e3.appspot.com/o/certificate%201.webp?alt=media&token=c17f3ce1-84f9-4c84-8be3-c4fd62195d58",
          'name': "test",
          'address': "",
          'role': "member",
        })
        .then((value) => print("create success"))
        .catchError((err) => print("create user error: $err"));
  }
}
