import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/postLogin/HomeAfterLogin.dart';
import 'package:myapploginandsignup/pages/postLogin/StudentManagementPage.dart';
import 'package:myapploginandsignup/pages/preLogin/home_page.dart';
import 'package:myapploginandsignup/pages/preLogin/login_page.dart';
import 'package:myapploginandsignup/pages/preLogin/signup_page.dart';

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
        '/': (context) => HomeAfterLogin(),
        // '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
