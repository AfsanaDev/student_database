import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/student.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({super.key});

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late Box<Student> box;
  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController deptController = TextEditingController();
  //List<Student> student = List.generate(box.length, (index) => null)
  //TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    @override
    State<StatefulWidget> createState() {
      throw UnimplementedError();
    }
    Hive.registerAdapter(StudentAdapter());
    _init();
    super.initState();
  }


  Future<void> _init() async {
   box = await Hive.openBox('students');
  }
  @override
  void dispose() {
    box.close();
    super.dispose();
  }
  void displayAllStudents() {
    for( var i =0 ; i<box.length; i++){
      var student= box.getAt(i);
      print(" Student Name is : ${student!.studentName}");
      print(" Student Id is : ${student.studentId}");
      print(" Student Department is : ${student.studentDept}");
    }
  }

  //start all SCAFFOLD CODE FROM HERE

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students',style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
        ),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.none,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter Student Name',

              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: idController,
              keyboardType: TextInputType.none,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your Id',

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: deptController,
              keyboardType: TextInputType.none,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter your Department',

              ),
            ),
          ),

          //In this section i need to add some textFiled for take students from user then i have to call Textcontroller
          TextButton(onPressed: (){
            var student = Student();
            student.studentName = nameController.text;
            student.studentId= idController.text;
            student.studentDept= deptController.text;
            box.add(student);

          }, child:const Text('Add a Student'),),

          TextButton(onPressed: (){
            displayAllStudents();
          }, child:const Text('Retrieve all Student'),)
        ],
      ),
    );
  }
}


