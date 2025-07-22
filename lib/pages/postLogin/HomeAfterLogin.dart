import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/postLogin/Lecture_detail_page.dart';
import 'package:myapploginandsignup/pages/preLogin/home_page.dart';

class HomeAfterLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>LectureDetailPage()),
            );
          },
          child: Text("Add/Manage lectures !"),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            textStyle: TextStyle(fontSize: 20),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}
