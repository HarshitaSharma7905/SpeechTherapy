import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speechtherapy/Home.dart';
import 'package:speechtherapy/HomeScreen.dart';
import 'package:speechtherapy/Login.dart';
import 'package:speechtherapy/Signup.dart';
import 'package:speechtherapy/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'Test.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Splash(),
      // home:(FirebaseAuth.instance.currentUser !=null)?Home():Splash(),
      home: Test()
    );
  }
}
