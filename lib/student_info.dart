import 'package:firebase_counter/Model/students_model.dart';
import 'package:firebase_counter/edit_students.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


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
        actions:[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.edit,color: Colors.white,),
          ).onTap(() => EditStudents(studentInformationModel: widget.studentInformationModel).launch(context)),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.delete_forever_outlined,color: Colors.white,),
        ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 70.0,
              backgroundImage: NetworkImage(widget.studentInformationModel.pictureUrl ?? pictureUrl),
            ),
          ),
          const SizedBox(height: 10.0,),
          Text(widget.studentInformationModel.studentName ?? '',style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),)
        ],
      ),
    );
  }
}
