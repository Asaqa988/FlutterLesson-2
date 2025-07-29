import 'package:flutter/material.dart';

class StudentManagementPage extends StatefulWidget {
  final List<String> globalStudents;
  const StudentManagementPage({super.key, required this.globalStudents});

  @override
  State<StudentManagementPage> createState() => _StudentManagementPageState();
}

class _StudentManagementPageState extends State<StudentManagementPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _searchcontroller = TextEditingController();

  String seachQuery = "";
  int? editingIndex;

  List<String> get filteredStudents {
    if (seachQuery.isEmpty) {
      return widget.globalStudents;
    } else {
      return widget.globalStudents
          .where(
            (student) =>
                student.toLowerCase().contains(seachQuery.toLowerCase()),
          )
          .toList();
    }
  }

  void _addStudent() {
    final name = _controller.text.trim();

    if (name.isEmpty) {
      return;
    } else {
      widget.globalStudents.add(name);

      _controller.clear(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manage Students"),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _searchcontroller,
              decoration: InputDecoration(
                labelText: "Search Student",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => setState(() {
                seachQuery = value;
              }),
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter Student Name",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(onPressed: _addStudent, child: Text("add student")),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredStudents.length,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  final student = filteredStudents[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text(student[0])),
                    title: Text(student),
                    trailing: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit, color: Colors.orange),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
