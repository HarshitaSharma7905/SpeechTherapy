import 'package:flutter/material.dart';

import '../Home.dart';

class Contactus extends StatefulWidget {
  const Contactus({Key? key}) : super(key: key);

  @override
  State<Contactus> createState() => _ContactusState();
}
class _ContactusState extends State<Contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Contact Us'),
      centerTitle: true,leading: BackButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      },),
    ),
          body: Center(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,2),spreadRadius: 2,blurRadius: 2)]),
                    child: Image.asset('assets/customer-service.png'),
                  ),SizedBox(height: 20),
                  Container(
                    width: 500,
                    child: TextField(decoration: InputDecoration(labelText: 'Name',prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),),SizedBox(height: 10),
                  Container(
                    width: 500,
                    child: TextField(decoration: InputDecoration(labelText: 'Mobile',prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),
                  ),SizedBox(height: 10),
                  Container(
                    width: 500,
                    child: TextField(decoration: InputDecoration(labelText: 'City',prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),),SizedBox(height: 10),
                  Container(
                    width: 500,
                    child: TextField(decoration: InputDecoration(labelText: 'Age',prefixIcon: Icon(Icons.date_range),
                        border: OutlineInputBorder()),keyboardType: TextInputType.emailAddress),),SizedBox(height: 10),
                  Container(
                    width: 500,
                    height: 50,
                    child: ElevatedButton( style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))),
                        onPressed: () {

                        },child: Text('SUBMIT')),
                  )],
              ),
            ),
          ),

        );
  }
}
