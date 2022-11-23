
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_counter/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please Sign Up',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            AppTextField(
              textFieldType: TextFieldType.NAME,
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Please Enter Your Full Name',
                  labelText: 'Name',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            AppTextField(
              textFieldType: TextFieldType.EMAIL,
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Please Enter Your Email',
                  labelText: 'Email Address',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            AppTextField(
              textFieldType: TextFieldType.PHONE,
              controller: phoneController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Please Enter Your Phone Number',
                  labelText: 'Phone',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Please Enter Your password',
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            AppTextField(
              textFieldType: TextFieldType.PASSWORD,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                  hintText: 'Please Re-enter Your password',
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
              child: Center(
                  child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
              )),
            ).onTap(() async{
              try {
                EasyLoading.show(status: 'Signing Up...');
                final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
                EasyLoading.showSuccess('Sign Up Successfully');
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  EasyLoading.showError('Weak Password');
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  EasyLoading.showError('User Already Exist');
                  print('The account already exists for that email.');
                }
              } catch (e) {
                EasyLoading.showError(e.toString());
                print(e);
              }
            }),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                const Text(
                  'Sign In Here',
                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                ).onTap(() => const SignIn().launch(context))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
