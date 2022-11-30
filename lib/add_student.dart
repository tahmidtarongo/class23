import 'dart:io';

import 'package:firebase_counter/Provider/student_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Model/students_model.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({Key? key}) : super(key: key);

  @override
  State<AddNewStudent> createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
  TextEditingController studentNameEditingController = TextEditingController();
  TextEditingController fathersNameEditingController = TextEditingController();
  TextEditingController mothersNameEditingController = TextEditingController();

  TextEditingController dateOfBirthEditingController = TextEditingController();

  TextEditingController rollNumberEditingController = TextEditingController();

  TextEditingController studentIdEditingController = TextEditingController();

  TextEditingController studentInstituteEditingController = TextEditingController();

  TextEditingController studentGroupEditingController = TextEditingController();

  TextEditingController studentBloodGroupEditingController = TextEditingController();
  TextEditingController studentClassNameEditingController = TextEditingController();

  TextEditingController studentContactEditingController = TextEditingController();

  List<String> languages = ['English', 'Bangla'];
  String pictureUrl =
      'https://firebasestorage.googleapis.com/v0/b/maanpos.appspot.com/o/Customer%20Picture%2FNo_Image_Available.jpeg?alt=media&token=3de0d45e-0e4a-4a7b-b115-9d6722d5031f';

  final ImagePicker _picker = ImagePicker();
  XFile? image;
  File imageFile = File('No Data');
  String imagePath = 'No Data';

  void getImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(image?.path ?? 'No Data');
      imagePath = image?.path ?? 'No Data';
    });
    EasyLoading.show(status: 'Uploading Image');
    await FirebaseStorage.instance.ref('Students Picture').child(DateTime.now().microsecondsSinceEpoch.toString()).putFile(File(image!.path)).then((val) async {
      EasyLoading.showSuccess('Upload Done');
      pictureUrl = await val.ref.getDownloadURL();
    });

    print(pictureUrl);
    setState(() {
      image.path.isEmptyOrNull ? imageFile = File('No Data') : imageFile = File(image.path);
    });
  }

  String initialLanguage = 'English';

  DropdownButton<String> getLanguages() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in languages) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: initialLanguage,
      onChanged: (value) {
        setState(() {
          initialLanguage = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Student'),
        centerTitle: true,
      ),
      body: Consumer(builder: (_,ref,watch){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(60.0),
                    image: imagePath == 'No Data' ? DecorationImage(image: NetworkImage(pictureUrl)) : DecorationImage(image: FileImage(imageFile)),
                  ),
                ).onTap(() => getImage()),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Name',
                    border: OutlineInputBorder(),
                    labelText: 'Student Name',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: fathersNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Father\'s Name',
                    border: OutlineInputBorder(),
                    labelText: 'Father\'s Name',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: mothersNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Mother\'s Name',
                    border: OutlineInputBorder(),
                    labelText: 'Mother\'s Name',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  readOnly: true,
                  controller: dateOfBirthEditingController,
                  decoration: InputDecoration(
                      hintText: DateTime.now().toString().substring(0, 10),
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: 'Date Of Birth',
                      suffixIcon: const Icon(Icons.calendar_month).onTap(() async{
                        var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          lastDate: DateTime.now(),
                        );
                        setState(() {
                          dateOfBirthEditingController.text = date.toString().substring(0,10);
                        });
                      })),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: rollNumberEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Roll',
                    border: OutlineInputBorder(),
                    labelText: 'Student Roll',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentIdEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student ID',
                    border: OutlineInputBorder(),
                    labelText: 'Student ID',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentInstituteEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Institute Name',
                    border: OutlineInputBorder(),
                    labelText: 'Institute Name',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentGroupEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Group',
                    border: OutlineInputBorder(),
                    labelText: 'Student Group',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentBloodGroupEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Blood group',
                    border: OutlineInputBorder(),
                    labelText: 'Student Blood Group',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentClassNameEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Class Name',
                    border: OutlineInputBorder(),
                    labelText: 'Student Class Name',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: context.width(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: SizedBox(
                    height: 55,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: DropdownButtonHideUnderline(child: getLanguages()),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  controller: studentContactEditingController,
                  decoration: InputDecoration(
                    hintText: 'Enter Student Emergency Contact Number',
                    border: OutlineInputBorder(),
                    labelText: 'Student Contact Number',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      StudentInformationModel model = StudentInformationModel(
                        studentName: studentNameEditingController.text,
                        fathersName: fathersNameEditingController.text,
                        mothersName: mothersNameEditingController.text,
                        dateOfBirth: dateOfBirthEditingController.text,
                        rollNumber: rollNumberEditingController.text,
                        studentId: studentIdEditingController.text,
                        studentGroup: studentGroupEditingController.text,
                        instituteName: studentInstituteEditingController.text,
                        emergencyContactNumber: studentContactEditingController.text,
                        bloodGroup: studentBloodGroupEditingController.text,
                        className: studentClassNameEditingController.text,
                        language: initialLanguage,
                        pictureUrl: pictureUrl,

                      );
                      await FirebaseDatabase.instance.ref('Student Information').push().set(model.toJson()).then((value) {
                        EasyLoading.showSuccess('Done');
                        ref.refresh(studentProvider);
                      });
                    },
                    child: Text('Save')),
              ],
            ),
          ),
        );
      }),
    );
  }
}
