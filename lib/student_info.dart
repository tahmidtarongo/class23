import 'package:firebase_counter/Model/students_model.dart';
import 'package:flutter/material.dart';


class StudentInfo extends StatefulWidget {
  const StudentInfo({Key? key, required this.studentInformationModel}) : super(key: key);
  final StudentInformationModel studentInformationModel;


  @override
  State<StudentInfo> createState() => _StudentInfoState();
}

class _StudentInfoState extends State<StudentInfo> {
  String pictureUrl =
      'https://firebasestorage.googleapis.com/v0/b/maanpos.appspot.com/o/Customer%20Picture%2FNo_Image_Available.jpeg?alt=media&token=3de0d45e-0e4a-4a7b-b115-9d6722d5031f';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.studentInformationModel.studentName.toString()),
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            backgroundImage: NetworkImage(widget.studentInformationModel.pictureUrl ?? pictureUrl),
          ),
        ],
      ),
    );
  }
}
