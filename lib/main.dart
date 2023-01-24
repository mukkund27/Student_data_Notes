import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'View/home_page.dart';

late Database database;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = await openDatabase(
    join(await getDatabasesPath(), 'my_table.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE my_table(id INTEGER PRIMARY KEY , firstname TEXT,lastname TEXT, dob TEXT,course TEXT)",
      );
    },
    version: 1,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
