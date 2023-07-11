import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:speechtherapy/Login.dart';
import 'package:speechtherapy/subpages/Meditation.dart';
import 'package:speechtherapy/subpages/contact.dart';
import 'package:speechtherapy/subpages/exercises.dart';
import 'package:speechtherapy/subpages/successstory.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index=0;
    List screen = [Dashboard(),Contact(),Testimonial(),Account()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
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
            BottomNavigationBarItem(icon: Icon(Icons.contact_page),label: 'Contact Us',),
            BottomNavigationBarItem(icon: Icon(Icons.video_collection_rounded),label: 'Testimonials',),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account',),
          ],),
      ),
    );
  }
}
//DASHBOARD---------------------
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<String> imageList = [
    'assets/discussion.png',
    'assets/meditating.png',
    'assets/training.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        children: [
          //slider start
          Center(
            child: Container(
              height: 300,
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: imageList.map((String imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Image.asset(
                          imageUrl,
                          scale: 2,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          //  slider end
          Expanded(
            child: Container(
              width: 400,
              margin: EdgeInsets.all(10),

              child: Column(children: [
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Successtory()));
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)],color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //list 1
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/success.png'),
                              decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)]),
                            ),
                            Container(
                              width:100 ,
                              padding: EdgeInsets.all(5),
                              child: Center(child: Text('Success Story')),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>exercise()));
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)],color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //list 2
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/workout.png'),
                              decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)]),
                            ),
                            Container(
                              width:100 ,
                              padding: EdgeInsets.all(5),
                              child: Center(child: Text('Exercises')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Meditation()));
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)],color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //list 3
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/meditating.png'),
                              decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)]),
                            ),
                            Container(
                              width:100 ,
                              padding: EdgeInsets.all(5),
                              child: Center(child: Text('Meditation')),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Contactus()));
                      },
                      child: Container(
                        width: 150,
                        height: 120,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)],color: Colors.white,shape: BoxShape.rectangle,borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //list 4   LIST K
                            Container(
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/call-back.png'),
                              decoration: BoxDecoration(shape: BoxShape.circle,boxShadow: [BoxShadow(color: Colors.grey,blurStyle: BlurStyle.outer,offset: Offset(0,3),spreadRadius: 2,blurRadius: 2)]),
                            ),
                            Container(
                              width:100 ,
                              padding: EdgeInsets.all(5),
                              child: Center(child: Text('Contact Us')),
                            )
                          ],
                        ),
                      ),
                    )
                  ],)
              ]),

            ),
          )
        ],
      ),
    ));
  }
}
//Contact------------------------
class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

//TESTIMONIAL------------
class Testimonial extends StatefulWidget {
  const Testimonial({Key? key}) : super(key: key);

  @override
  State<Testimonial> createState() => _TestimonialState();
}

class _TestimonialState extends State<Testimonial> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Text('Testomials')
    );
  }

}
//ACCOUNT-----------------
class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  //logout method
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Login()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      margin: EdgeInsets.all(20),
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 100,
                width: 100,
                child: Image.asset('assets/girl.png'),
              ),SizedBox(height: 20, width: 20),
              Container(
                height: 100,
                width: 200,
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                        child: Text('Harshita Sharma',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),SizedBox(height: 10),
                    Container(child: Text('harshita@gmail.com')),SizedBox(height: 10),
                    Container(child: ElevatedButton(onPressed: () {},child: Text('Edit Profile'),)),
                  ],
                ),
              ),
            ],
          ),SizedBox(height: 40),
          Container(
            child: Column(
              children: [
                Container(
                  width: 500,height: 40,padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(blurStyle: BlurStyle.outer,blurRadius: 2,color: Colors.black12,spreadRadius: 2,offset:Offset(0,2))],),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(children: [
                        Icon(Icons.favorite_border),SizedBox(width: 10),
                        Text('Favourite'),
                      ]),
                      Icon(Icons.arrow_forward_ios ),
                    ],
                  ),
                ),SizedBox(height: 20),
                Container(
                  width: 500,height: 40,padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(blurStyle: BlurStyle.outer,blurRadius: 2,color: Colors.black12,spreadRadius: 2,offset:Offset(0,2))],),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(children: [
                        Icon(Icons.settings),SizedBox(width: 10),
                        Text('Setting'),
                      ]),
                      Icon(Icons.arrow_forward_ios ),
                    ],
                  ),
                ),SizedBox(height: 20),
                Container(
                  width: 500,height: 40,padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(blurStyle: BlurStyle.outer,blurRadius: 2,color: Colors.black12,spreadRadius: 2,offset:Offset(0,2))],),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(children: [
                        Icon(Icons.history),SizedBox(width: 10),
                        Text('History'),
                      ]),
                      Icon(Icons.arrow_forward_ios ),
                    ],
                  ),
                ),SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    logout();
                  },
                  child: Container(
                    width: 500,height: 40,padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),boxShadow: [BoxShadow(blurStyle: BlurStyle.outer,blurRadius: 2,color: Colors.black12,spreadRadius: 2,offset:Offset(0,2))],),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(children: [
                          Icon(Icons.logout),SizedBox(width: 10),
                          Text('Logout'),
                        ]),
                        Icon(Icons.arrow_forward_ios ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
