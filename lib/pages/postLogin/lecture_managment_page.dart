import 'package:flutter/material.dart';

class Lecture {
  String name;

  String teacher;

  List<String> students;

  Lecture({
    required this.name,
    required this.teacher,
    this.students = const [],
  });
}

class LectureManagerPage extends StatefulWidget {
  @override
  _LectureManagerPageState createState() => _LectureManagerPageState();
}

class _LectureManagerPageState extends State<LectureManagerPage> {
  List<Lecture> mo7adarat = [];

  List<String> lectureNames = ["qa", "flutter", "node js"];
  List<String> teachers = ["omar", "anas", "mahmoud"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lecture Managment Page"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: ElevatedButton(
        onPressed: () {
          Lecture obj1 = new Lecture(
            name: lectureNames[0],
            teacher: teachers[0],
          );
          Lecture obj2 = new Lecture(
            name: lectureNames[1],
            teacher: teachers[1],
          );
        },
        child: Text("add"),
      ),
    );
  }
}
