import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_counter/add_student.dart';
import 'package:firebase_counter/sign_in.dart';
import 'package:firebase_counter/student_list.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var currentUser = FirebaseAuth.instance.currentUser;
  void checkUser() async{
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      if(currentUser != null){
        const StudentList().launch(context,isNewTask: true);
      } else{
        const SignIn().launch(context,isNewTask: true);
      }
    });
  }

  @override
  void initState() {
    checkUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 70.0,
        child: Text('Students',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
      ),),
    );
  }
}
