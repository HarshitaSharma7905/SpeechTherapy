import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),
        centerTitle: true,leading: BackButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        },),
      ),body:Center(
        child: Container(
            width: 500,
          margin: EdgeInsets.all(20),
          child: Column(
              children: [
                Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
                child: Image.asset('assets/profile.png'),
              ),SizedBox(height:10 ),
                TextField(decoration: InputDecoration(labelText: 'Gmail',prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),SizedBox(height: 10),
                TextField(decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder()),keyboardType: TextInputType.visiblePassword),SizedBox(height: 10),SizedBox(height: 10),
                Container(
                  width: 200,height: 40,
                  child: ElevatedButton(onPressed: () {

                  }, child: Text('Submit'),style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),),
                )
              ]),

        ),
      ),
    );
  }
}
