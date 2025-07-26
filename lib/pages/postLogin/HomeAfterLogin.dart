import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/postLogin/StudentManagement.dart';
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
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentManagmentPage(),
                  ),
                );
              },
              child: Text("Add/Manage Students !"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StudentManagmentPage(),
                  ),
                );
              },
              child: Text("Add/Manage lecture !"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                textStyle: TextStyle(fontSize: 20),
                backgroundColor: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
