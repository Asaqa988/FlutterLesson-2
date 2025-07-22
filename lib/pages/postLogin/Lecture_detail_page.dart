import 'package:flutter/material.dart';

class LectureDetailPage extends StatefulWidget {
  @override
  _LectureDetailPageState createState() => _LectureDetailPageState();
}

class _LectureDetailPageState extends State<LectureDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lecture details"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                // controller: _lectureController,
                decoration: InputDecoration(
                  labelText: " lecture Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                // controller: _lectureController,
                decoration: InputDecoration(
                  labelText: "Teacher Name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "add student",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  ElevatedButton(onPressed: () {}, child: Text("add student")),
                ],
              ),

              SizedBox(height: 20),

              // ListView.builder(
              //   itemCount: 10,
              //   shrinkWrap: true,
              //   itemBuilder: (context, index) {
              //     return Card(child: ListTile());
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
