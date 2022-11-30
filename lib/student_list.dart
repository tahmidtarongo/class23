import 'package:firebase_counter/Model/students_model.dart';
import 'package:firebase_counter/Provider/student_provider.dart';
import 'package:firebase_counter/add_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  String pictureUrl =
      'https://firebasestorage.googleapis.com/v0/b/maanpos.appspot.com/o/Customer%20Picture%2FNo_Image_Available.jpeg?alt=media&token=3de0d45e-0e4a-4a7b-b115-9d6722d5031f';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Students'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => const AddNewStudent().launch(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Consumer(builder: (_, ref, watch) {
        AsyncValue<List<StudentInformationModel>> studentList = ref.watch(studentProvider);
        return studentList.when(data: (student) {
          return ListView.builder(
              itemCount: student.length,
              itemBuilder: (_, i) {
                return StudetCard(pictureUrl: pictureUrl, student: student[i],);
              });
        }, error: (e, stack) {
          return Text(e.toString());
        }, loading: () {
          return Center(child: const CircularProgressIndicator());
        });
      }),
    );
  }
}

class StudetCard extends StatelessWidget {
  const StudetCard({
    Key? key,
    required this.pictureUrl,
    required this.student
  }) : super(key: key);
  final StudentInformationModel student;
  final String pictureUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          backgroundImage: NetworkImage(student.pictureUrl ?? pictureUrl),
        ),
        title: Text(
          student.studentName ?? '',
          style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Class: ${student.className ?? ''}, Roll: ${student.rollNumber ?? ''}'),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
