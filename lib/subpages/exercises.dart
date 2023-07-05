import 'package:flutter/material.dart';

import '../Home.dart';

class exercise extends StatefulWidget {
  const exercise({Key? key}) : super(key: key);

  @override
  State<exercise> createState() => _exerciseState();
}

class _exerciseState extends State<exercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercises'),
        centerTitle: true,leading: BackButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        },),
      ),body: Center(child: Text('COMING SOON')),
    );
  }
}
