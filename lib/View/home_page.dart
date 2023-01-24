import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:student_data/Model/student_model.dart';
import 'package:student_data/controller/student_controler.dart';

import 'add_data.dart';
import 'edit_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StudentController _studentController = StudentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Data"),
      ),
      body: Center(
        child: FutureBuilder<List<StudentModel>>(
          future: _studentController.Students(),
          builder: (BuildContext context,
              AsyncSnapshot<List<StudentModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  var i = snapshot.data![index].id;

                  return Card(
                    color: Colors.grey.shade200,
                    elevation: 2,
                    child: ListTile(
                      onTap: () {
                        Get.to(EditPage(
                          idd: i,
                        ));
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.green,
                      ),
                      title: Text(snapshot.data![index].firstname),
                      subtitle: Text(snapshot.data![index].lastname),
                      trailing: IconButton(
                          onPressed: () {
                            _studentController
                                .deleteData(snapshot.data![index].id!);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete)),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(DetailsScreen());
        },
        child: Icon(Icons.add),
        tooltip: "Add Note",
      ),
    );
  }
}
