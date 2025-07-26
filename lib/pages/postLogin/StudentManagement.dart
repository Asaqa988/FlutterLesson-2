import 'package:flutter/material.dart';

class StudentManagmentPage extends StatefulWidget {
  @override
  _StudentManagmentPageState createState() => _StudentManagmentPageState();
}

class _StudentManagmentPageState extends State<StudentManagmentPage> {
  final _lectureController = TextEditingController();
  final _teacherController = TextEditingController();
  final _studentController = TextEditingController();
  List<String> students = [];

  List<String> lectureList = ["qa", "flutter", "devops", "node js"];
  List<String> teacherList = [
    "ahmad mahmoud",
    "ali anas",
    "omar khaled",
    "mohammad samer",
  ];

  String? selectedLecture;
  String? selectedTeacher;

  @override
  void dispose() {
    _lectureController.dispose();
    _teacherController.dispose();
    _studentController.dispose();

    super.dispose();
  }

  void _addStudent() {
    final name = _studentController.text.trim();
    if (name.isNotEmpty) {
      setState(() {
        students.add(name);
        _studentController.clear();
      });
    }
  }

  void _editStudent(int index) {
    _studentController.text = students[index];
    setState(() {
      students.removeAt(index);
    });
  }

  void _deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture Details"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Lecture name
              DropdownButtonFormField(
                value: selectedLecture,

                items: lectureList.map((lecture) {
                  return DropdownMenuItem(child: Text(lecture), value: lecture);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLecture = value;
                  });
                },
              ),

              SizedBox(height: 12),

              // Teacher assignment
              DropdownButtonFormField(
                value: selectedTeacher,

                items: teacherList.map((teacher) {
                  return DropdownMenuItem(child: Text(teacher), value: teacher);
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTeacher = value;
                  });
                },
              ),
              SizedBox(height: 20),

              // Student input
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _studentController,
                      decoration: InputDecoration(
                        labelText: 'Add Student',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addStudent,
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Student List
              ListView.builder(
                shrinkWrap: true,
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(students[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => _editStudent(index),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteStudent(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
