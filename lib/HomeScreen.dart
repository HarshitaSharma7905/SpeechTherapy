import 'package:flutter/material.dart';
import 'package:speechtherapy/Login.dart';
import 'package:speechtherapy/Signup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
          children: [
      Center(
      child: Container(
      height: 150,
        width: 150,
        margin: EdgeInsets.only(top: 50),
        decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
        child: Image.asset('assets/logo.png'),
      ),
    )
            ,SizedBox(height: 20),
            Center(
              child: Container(
                width: 500,
                child: Center(child: Text('Express yourself with confidence.',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black45,fontSize: 18))),
              ),
            ),SizedBox(height: 50),
            Center(
              child: Container(
                width: 500,
                child: Column(
                  children: [
                    Container(
                       width: 200,
                      height: 40,
                      child: ElevatedButton(
                          style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                          onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
                      },child: Text('Get Started',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)),
                    ),SizedBox(height: 15),
                    Container(
                      width: 500,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('You have already account'),
                          TextButton(child: Text('Login Here'),onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                          },),
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }
}
