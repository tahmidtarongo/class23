import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_counter/Model/students_model.dart';
import 'package:firebase_database/firebase_database.dart';

class StudentRepo {
  final userId = FirebaseAuth.instance.currentUser!.uid;

  Future<List<StudentInformationModel>> getAllStudents() async {
    List<StudentInformationModel> studentList = [];
    await FirebaseDatabase.instance.ref(userId).child('Student Information').orderByKey().get().then((value) {
      for (var element in value.children) {
        studentList.add(StudentInformationModel.fromJson(jsonDecode(jsonEncode(element.value))));
      }
    });
    return studentList;
  }
}
