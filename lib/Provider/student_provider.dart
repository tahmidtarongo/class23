
import 'package:firebase_counter/Model/students_model.dart';
import 'package:firebase_counter/Repositories/student_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final studentProvider = FutureProvider.autoDispose<List<StudentInformationModel>>((ref) => StudentRepo().getAllStudents());
