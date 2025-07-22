import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool alreadyRegistered = false;

  @override
  Widget build(BuildContext context) {
    if (alreadyRegistered) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
    return Scaffold(
      appBar: AppBar(title: Text("Signup"), backgroundColor: Colors.deepPurple),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.cyanAccent],
            begin: Alignment.topCenter,
            end: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(
                  "https://cdn1.vectorstock.com/i/1000x1000/19/15/avatar-for-mobile-application-flat-design-vector-47211915.jpg",
                ),
              ),
              SizedBox(width: double.infinity, height: 120),

              TextField(
                decoration: InputDecoration(
                  hintText: "please enter your email",
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      width: 320,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              SizedBox(width: double.infinity, height: 40),
              TextField(
                decoration: InputDecoration(
                  hintText: "please enter your password",
                  filled: true,
                  fillColor: Colors.white70,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      width: 320,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    checkColor: Colors.white,
                    value: alreadyRegistered,
                    onChanged: (value) {
                      setState(() {
                        alreadyRegistered = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "Already Register ? Go To Login Page ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}
