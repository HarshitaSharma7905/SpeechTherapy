import 'package:flutter/material.dart';

import '../Home.dart';

class Successtory extends StatefulWidget {
  const Successtory({Key? key}) : super(key: key);

  @override
  State<Successtory> createState() => _SuccesstoryState();
}

class _SuccesstoryState extends State<Successtory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Success Stories'),
        centerTitle: true,leading: BackButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        },),
      ),body: Center(child: Text('Succes Stories')),
    );
  }
}
