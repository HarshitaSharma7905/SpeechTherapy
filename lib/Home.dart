import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:speechtherapy/subpages/Meditation.dart';
import 'package:speechtherapy/subpages/contact.dart';
import 'package:speechtherapy/subpages/exercises.dart';
import 'package:speechtherapy/subpages/successstory.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'dart:developer';
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
    return Scaffold(body: Column(
      children: [
        //slider start
        Center(
          child: Container(
            height: 250,
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
                      width: 170,
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
                      width: 170,
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
                      width: 170,
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
                      width: 170,
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
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  final List<String> _ids = [
    '-dx1pZ0HXCQ',
    'UjWmiHBR83M',
    '8RX0QAnzQqg',
    '5Ld8cx2-V7k',
    't5-OWK3u6JU',
    '_TBjj0TCVtE',
    'eKGVIlWcE-c',
    'JdxCFHZUzAg',
    'SozWJA0roCs',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: YoutubePlayerBuilder(
      onExitFullScreen: () {
        // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
        topActions: <Widget>[
          const SizedBox(width: 8.0),
          Expanded(
            child: Text(
              _controller.metadata.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 25.0,
            ),
            onPressed: () {
              log('Settings Tapped!');
            },
          ),
        ],
        onReady: () {
          _isPlayerReady = true;
        },
        onEnded: (data) {
          _controller
              .load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
          _showSnackBar('Next Video Started!');
        },
      ),
      builder: (context, player) => Scaffold(

        body: ListView(
          children: [
            player,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _space,
                  _text('Title', _videoMetaData.title),
                  _space,
                  _text('Channel', _videoMetaData.author),
                  _space,
                  _text('Video Id', _videoMetaData.videoId),
                  _space,
                  Row(
                    children: [
                      _text(
                        'Playback Quality',
                        _controller.value.playbackQuality ?? '',
                      ),
                      const Spacer(),
                      _text(
                        'Playback Rate',
                        '${_controller.value.playbackRate}x  ',
                      ),
                    ],
                  ),
                  _space,
                  TextField(
                    enabled: _isPlayerReady,
                    controller: _idController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter youtube \<video id\> or \<link\>',
                      fillColor: Colors.blueAccent.withAlpha(20),
                      filled: true,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.blueAccent,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => _idController.clear(),
                      ),
                    ),
                  ),
                  _space,
                  Row(
                    children: [
                      _loadCueButton('LOAD'),
                      const SizedBox(width: 10.0),
                      _loadCueButton('CUE'),
                    ],
                  ),
                  _space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.skip_previous),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                        (_ids.indexOf(_controller.metadata.videoId) -
                            1) %
                            _ids.length])
                            : null,
                      ),
                      IconButton(
                        icon: Icon(
                          _controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        onPressed: _isPlayerReady
                            ? () {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                          setState(() {});
                        }
                            : null,
                      ),
                      IconButton(
                        icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
                        onPressed: _isPlayerReady
                            ? () {
                          _muted
                              ? _controller.unMute()
                              : _controller.mute();
                          setState(() {
                            _muted = !_muted;
                          });
                        }
                            : null,
                      ),
                      FullScreenButton(
                        controller: _controller,
                        color: Colors.blueAccent,
                      ),
                      IconButton(
                        icon: const Icon(Icons.skip_next),
                        onPressed: _isPlayerReady
                            ? () => _controller.load(_ids[
                        (_ids.indexOf(_controller.metadata.videoId) +
                            1) %
                            _ids.length])
                            : null,
                      ),
                    ],
                  ),
                  _space,
                  Row(
                    children: <Widget>[
                      const Text(
                        "Volume",
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                      Expanded(
                        child: Slider(
                          inactiveColor: Colors.transparent,
                          value: _volume,
                          min: 0.0,
                          max: 100.0,
                          divisions: 10,
                          label: '${(_volume).round()}',
                          onChanged: _isPlayerReady
                              ? (value) {
                            setState(() {
                              _volume = value;
                            });
                            _controller.setVolume(_volume.round());
                          }
                              : null,
                        ),
                      ),
                    ],
                  ),
                  _space,
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
  Widget _text(String title, String value) {
    return RichText(
      text: TextSpan(
        text: '$title : ',
        style: const TextStyle(
          color: Colors.blueAccent,
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: value,
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  Widget get _space => const SizedBox(height: 10);

  Widget _loadCueButton(String action) {
    return Expanded(
      child: MaterialButton(
        color: Colors.blueAccent,
        onPressed: _isPlayerReady
            ? () {
          if (_idController.text.isNotEmpty) {
            var id = YoutubePlayer.convertUrlToId(
              _idController.text,
            ) ??
                '';
            if (action == 'LOAD') _controller.load(id);
            if (action == 'CUE') _controller.cue(id);
            FocusScope.of(context).requestFocus(FocusNode());
          } else {
            _showSnackBar('Source can\'t be empty!');
          }
        }
            : null,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 18.0,
              color: Colors.white,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      margin: EdgeInsets.all(20),
      child: Column(
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
          ),SizedBox(height: 20),
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
                Container(
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
              ],
            ),
          )
        ],
      ),
    ),);
  }
}
