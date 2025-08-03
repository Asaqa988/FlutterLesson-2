import 'package:flutter/material.dart';
import 'package:myapploginandsignup/pages/postLogin/HomeAfterLogin.dart';
import 'package:myapploginandsignup/pages/preLogin/login_page.dart';
import 'package:myapploginandsignup/pages/preLogin/signup_page.dart';

void main() => runApp(MyApp());

int? myage; 
List<String> products = ["laptop", "phone", "watch"];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () {
          products.where().toList().forEach((theProduct) {
            print(theProduct.toLowerCase());

            if(myage == null) {
              print("my age is null");
            } else {
              print("my age is $myage");
            }
          });
        },
        child: Text("Click Me"),
      ),
    );
  }
}
