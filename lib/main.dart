import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/home_page.dart';
import 'package:myapploginandsignup/pages/login_page.dart';
import 'package:myapploginandsignup/pages/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login and sign up app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Raleway"),
      initialRoute: '/',

      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
