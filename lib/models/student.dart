import 'package:hive/hive.dart';
part 'student.g.dart';
@HiveType(typeId: 0)
class Student extends HiveObject{
  @HiveField(0)
  late String studentName;
  @HiveField(1)
  late String studentId;
  @HiveField(2)
  late String studentDept;

  //Student(this.studentName, this.studentId, this.studentDept);
}
