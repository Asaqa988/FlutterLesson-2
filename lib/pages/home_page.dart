import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/signup_page.dart';

class HomePage extends StatelessWidget {
  final double avatarRadius = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.white,
              Colors.purpleAccent,
              Colors.blueGrey,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 15),
            child: Column(
              children: [
                CircleAvatar(
                  radius: avatarRadius,
                  backgroundImage: NetworkImage(
                    "https://cdn1.vectorstock.com/i/1000x1000/19/15/avatar-for-mobile-application-flat-design-vector-47211915.jpg",
                  ),
                ),
                SizedBox(width: double.infinity, height: 120),

                Text(
                  "Sign up and Login App ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 6.2,
                  ),
                ),

                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  child: Text("signup"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
                    backgroundColor: Colors.white60,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
