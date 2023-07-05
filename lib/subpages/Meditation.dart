import 'package:flutter/material.dart';

import '../Home.dart';

class Meditation extends StatefulWidget {
  const Meditation({Key? key}) : super(key: key);

  @override
  State<Meditation> createState() => _MeditationState();
}

class _MeditationState extends State<Meditation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meditation'),
        centerTitle: true,leading: BackButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        },),
      ),
      body: Center(child: Text('COMING SOON')),
    );
  }
}
