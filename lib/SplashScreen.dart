import 'package:flutter/material.dart';
import 'package:speechtherapy/HomeScreen.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    sendtonextscreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
              child: Image.asset('assets/logo.png'),
            ),
          ),SizedBox(height: 10),
          Center(
            child: Container(
              width: 200,
              margin: EdgeInsets.only(left: 25),
              child: Center(child: Text('Speech Therapy',style: TextStyle(fontSize: 24,fontWeight:FontWeight.w500 ,))),
            ),
          ),
        ],
      ),
    );
  }
  Future<void> sendtonextscreen() async{
    await Future.delayed(Duration(seconds: 5));
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>HomeScreen()) );


  }
}

