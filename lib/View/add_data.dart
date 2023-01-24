import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:student_data/Model/student_model.dart';
import 'package:student_data/View/home_page.dart';
import 'package:velocity_x/velocity_x.dart';
import '../controller/student_controler.dart';

import 'edit_page.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _course = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StudentController _studentController = StudentController();
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.offAll(HomePage());
            },
            icon: Icon(Icons.chevron_left)),
        title: Text("Add Student"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          CommonTextField(
            hintText: 'Enter First Name',
            textController: _fname,
          ),
          CommonTextField(
            hintText: 'Enter Last Name',
            textController: _lname,
          ),
          CommonTextField(
            hintText: "Dob",
            textController: _dob,
          ),
          CommonTextField(
            hintText: "Course",
            textController: _course,
          ),
          MaterialButton(
            height: 40,
            minWidth: 300,
            onPressed: () {
              _studentController.insertData(StudentModel(
                  dob: _dob.text,
                  firstname: _fname.text,
                  lastname: _lname.text,
                  course: _course.text));
              setState(() {
                Get.offAll(() => HomePage());
              });
              print("data added");
            },
            color: Colors.green,
            child: 'Add'
                .text
                .color(Colors.white)
                .tight
                .letterSpacing(1)
                .size(22)
                .make(),
          )
        ],
      ),
    );
  }
}
