import 'package:sqflite/sqflite.dart';
import 'package:student_data/Model/student_model.dart';
import 'package:student_data/main.dart';

class StudentController {
  Future<void> insertData(StudentModel studentDataModel) async {
    final db = await database;
    await db.insert(
      "my_table",
      studentDataModel.toMap(),
    );
  }

  Future<List<StudentModel>> Students() async {
    final db = await database;

    List<Map<String, dynamic>> results = await db.query('my_table');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(results.length, (i) {
      return StudentModel(
        id: results[i]['id'],
        dob: results[i]['dob'],
        firstname: results[i]['firstname'],
        lastname: results[i]['lastname'],
        course: results[i]['course'],
      );
    });
  }

  Future<void> updateData(StudentModel studentDataModel) async {
    // Get a reference to the database.
    final db = await database;

    db.query('my_table', columns: [''], where: 'id=?', whereArgs: [1, 4]);
    await db.update(
      'my_table',
      studentDataModel.toMap(),
      where: 'id = ?',
      whereArgs: [studentDataModel.id],
    );
  }

  Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete(
      'my_table',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
