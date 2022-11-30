import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_counter/add_student.dart';
import 'package:firebase_counter/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  var currentUser = FirebaseAuth.instance.currentUser;
  void checkUser(){
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if(currentUser != null){
        const AddNewStudent().launch(context);
      } else{
        const SignIn().launch(context);
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
