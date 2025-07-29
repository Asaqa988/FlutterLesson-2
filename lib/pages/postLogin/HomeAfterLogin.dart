import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/postLogin/StudentManagementPage.dart';
import 'package:myapploginandsignup/pages/postLogin/lecture_managment_page.dart';
import 'package:myapploginandsignup/pages/preLogin/home_page.dart';

class HomeAfterLogin extends StatefulWidget {
  @override
  _HomeAfterLoginState createState() => _HomeAfterLoginState();
}

class _HomeAfterLoginState extends State<HomeAfterLogin> {
  List<String> globalStudents = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () async {
                final updateStudents = await Navigator.push<List<String>>(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentManagmentPage(),
                  ),
                );
              },
              child: Text("Add/Manage Students"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LectureManagerPage()),
                );
              },
              child: Text("Add/Manage Students"),
            ),
          ],
        ),
      ),
    );
  }
}
