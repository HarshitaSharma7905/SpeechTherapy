import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speechtherapy/Home.dart';
import 'HomeScreen.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  //login method
  void login() async {
    String email = emailController.text.trim();
    String password =passwordController.text.trim();
  if (email==""||password=="")
  {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Enter Required Details"),
    ));
  }
  else
  {
    try{
      UserCredential userCredential=await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(userCredential !=null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Enter Valid Details"),
        ));
      }
    }on FirebaseAuthException catch(err){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(err.toString()),
      ));
    }
  }
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
                child: Image.asset('assets/profile.png'),
              ),SizedBox(height:10 ),
                TextField(controller: emailController,decoration: InputDecoration(labelText: 'Gmail',prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),SizedBox(height: 10),
                TextField(controller: passwordController,decoration: InputDecoration(labelText: 'Password',prefixIcon: Icon(Icons.key),
                    border: OutlineInputBorder()),keyboardType: TextInputType.visiblePassword),SizedBox(height: 10),SizedBox(height: 10),
                Container(
                  width: 200,height: 40,
                  child: ElevatedButton(onPressed: () {
                    login();

                  }, child: Text('Submit'),style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),),
                )
              ]),

        ),
      ),
    );
  }
}
