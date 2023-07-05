import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speechtherapy/Home.dart';
import 'package:speechtherapy/HomeScreen.dart';
import 'package:speechtherapy/Login.dart';
import 'package:speechtherapy/Signup.dart';
import 'package:speechtherapy/SplashScreen.dart';

import 'Test.dart';

void main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Splash(),
      home: Home(),
    );
  }
}
