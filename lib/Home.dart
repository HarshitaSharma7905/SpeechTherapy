import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          currentIndex: index,
          onTap: (value) {
          setState(() {

            index=value;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home',),
            BottomNavigationBarItem(icon: Icon(Icons.event),label: 'Event',),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection_rounded),label: 'Testimonials',),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',),
          ],),
      ),
    );
  }
}
