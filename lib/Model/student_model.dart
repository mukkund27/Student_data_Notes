class StudentModel {
  final int? id;
  final String firstname;
  final String lastname;
  final String dob;
  final String course;

  const StudentModel({
    this.id,
    required this.dob,
    required this.firstname,
    required this.lastname,
    required this.course,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'course': course
    };
  }
}
