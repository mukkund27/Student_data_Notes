import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_data/Model/student_model.dart';
import 'package:student_data/controller/student_controler.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_page.dart';

class EditPage extends StatefulWidget {
  final int? idd;
  const EditPage({Key? key, required this.idd}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _course = TextEditingController();
  StudentController _studentController = StudentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Details"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          CommonTextField(
            hintText: 'New First Name',
            textController: _fname,
          ),
          CommonTextField(
            hintText: 'New Last Name',
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
              _studentController.updateData(StudentModel(
                  id: widget.idd,
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
            child: 'Confirm Edit'
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

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;

  const CommonTextField({
    Key? key,
    required this.hintText,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15)),
          child: TextFormField(
            controller: textController,
            decoration:
                InputDecoration(hintText: hintText, border: InputBorder.none),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
