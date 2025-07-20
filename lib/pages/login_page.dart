import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool dontHaveAccount = false;

  String myname = "batool";

  @override
  Widget build(BuildContext context) {
    if (dontHaveAccount) {
      Future.microtask(() {
        // Navigator.pushReplacementNamed(context, '/signup');
      });
    }
    return Scaffold(
      appBar: AppBar(title: Text("Login"), backgroundColor: Colors.deepPurple),
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
              Text(myname, style: TextStyle(fontSize: 30)),
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
                    value: dontHaveAccount,
                    onChanged: (value) {
                      setState(() {
                        dontHaveAccount = value ?? false;

                        myname = "aya";
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "dont have account Go To Sign Up Page",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              ElevatedButton(onPressed: () {}, child: Text("Login")),
            ],
          ),
        ),
      ),
    );
  }
}
