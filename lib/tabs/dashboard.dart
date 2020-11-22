import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Dashboard/Games/gameDash.dart';
import 'package:wallpaper/Dashboard/News/main.dart';
import 'package:wallpaper/Dashboard/NewsA/main.dart';
import 'package:wallpaper/Login/fadeAnimation.dart';
import 'package:wallpaper/LoginScreen/profilePage.dart';
import 'package:wallpaper/Quiz/main.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/Settings/about.dart';
import 'package:wallpaper/Settings/faq.dart';
import 'package:wallpaper/Settings/helpline.dart';
import 'package:wallpaper/Settings/privacy.dart';
import 'package:wallpaper/Settings/rate.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/WOTD/wotd.dart';

final Color backgroundColor = Colors.white;

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  Items item1 = new Items(
    title: "New Word",
    img: "assets/icon/dashboard/font.png",
  );
  Items item2 = new Items(
    title: "News",
    img: "assets/icon/dashboard/newspaper.png",
  );

  Items item3 = new Items(
    title: "Quiz",
    img: "assets/icon/dashboard/choose.png",
  );
  Items item4 = new Items(
    title: "Games",
    img: "assets/icon/dashboard/joystick.png",
  );
  final databaseReference = Firestore.instance;
  String username=" ";
  String image=" ";
  void getdata() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    databaseReference
        .collection("User")
        .document(firebaseUser.uid)
        .get()
        .then((value) {
      setState(() {
        username = value.data["username"];
        image = value.data["photourl"];
      });
    });
  }

  String greeting() {
    String day = "";
    var hour = DateTime.now().hour;
    if (hour < 12) {
      day = "Morning";
      return day;
    }
    if (hour < 17) {
      day = "Afternoon";
      return day;
    }
    if (hour < 20) {
      day = "Evening";
      return day;
    }
    day = "Night";
    return day;
  }

  bool isCollapsed = true;
  double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController _controller;
  Animation<double> _scaleAnimation;
  Animation<double> _menuScaleAnimation;
  Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    getdata();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          menu(context),
          dashboard(context),
        ],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Stack(children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon: new Icon(Icons.phone, color: Colors.teal),
                          onPressed: () {},
                        ),
                        title: Text(
                          ' HelpLine',
                          style: TextStyle(
                              color: Colors.teal,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Helpline()),
                          );
                        }),
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon:
                              new Icon(Icons.info_outline, color: Colors.brown),
                          onPressed: () {},
                        ),
                        title: Text(
                          'App Info',
                          style: TextStyle(
                              color: Colors.brown,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => About()),
                          );
                        }),
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon: new Icon(Icons.question_answer_outlined,
                              color: Colors.pink),
                          onPressed: () {},
                        ),
                        title: Text(
                          'FAQs',
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Faq()),
                          );
                        }),
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon: new Icon(Icons.star_border_outlined,
                              color: Colors.deepPurple),
                          onPressed: () {},
                        ),
                        title: Text(
                          'Rate Us!',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Rate()),
                          );
                        }),
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon: new Icon(Icons.lock_outline,
                              color: Colors.deepOrange),
                          onPressed: () {},
                        ),
                        title: Text(
                          'Privacy Policy',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Privacy()),
                          );
                        }),
                    ListTile(
                        tileColor: backgroundColor,
                        leading: new IconButton(
                          icon: new Icon(Icons.account_circle_outlined,
                              color: Colors.blue),
                          onPressed: () {},
                        ),
                        title: Text(
                          'My Account',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => ProfilePage()),

                          );
                        }
                        ),
                    ListTile(
                      tileColor: backgroundColor,
                      leading: new IconButton(
                        icon: new Icon(Icons.exit_to_app, color: Colors.green),
                        onPressed: () {},
                      ),
                      title: Text(
                        'LogOut',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        auth.signOut().then((res) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        });
                      },
                    ),
                    ListTile(
                      tileColor: backgroundColor,
                      title: Text(
                        'Version',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '1.0.2',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.2 * screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(40)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            child: Container(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          child: Icon(Icons.menu, color: Colors.black),
                          onTap: () {
                            setState(() {
                              if (isCollapsed)
                                _controller.forward();
                              else
                                _controller.reverse();

                              isCollapsed = !isCollapsed;
                            });
                          },
                        ),
                        GestureDetector(
                          onTap:
                              () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePage()),

                          );
                          },
                          child: CircleAvatar(
                              radius: 22,
                              child: ClipOval(
                                child: new SizedBox(
                                    width: 45.0,
                                    height: 45.0,
                                    child:(image!=null)?Image.network(image,fit: BoxFit.fill,): new Image.asset("assets/login/man_avatar.png", fit:BoxFit.fill)
                                ),
                              ),
                            ),
                        ),

                      ]),
                  SafeArea(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            FadeAnimation(
                              2.4,
                              Text("| Good " + greeting() + "‼",
                                  style: TextStyle(
                                      fontFamily: "Blackcherry",
                                      color: Colors.deepOrange,
                                      fontSize: 40,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 2.5)),
                            ),
                            Row(
                              children: [
                                FadeAnimation(
                                  2.6,
                                  Text("| " + username,
                                      style: TextStyle(
                                          fontFamily: "Blackcherry",
                                          color: Colors.deepPurple,
                                          fontSize: 50,
                                          letterSpacing: 2.5,
                                          fontWeight: FontWeight.bold)),
                                ),
                                FadeAnimation(
                                  2.6,
                                  Text( " ❣",
                                      style: TextStyle(
                                          fontFamily: "Blackcherry",
                                          fontSize: 40,
                                         )),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Wotd()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      item1.img,
                                      width: 42,
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Center(
                                      child: Text(
                                        item1.title,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsA()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      item2.img,
                                      width: 42,
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Center(
                                      child: Text(
                                        item2.title,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Quiz()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      item3.img,
                                      width: 42,
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Center(
                                      child: Text(
                                        item3.title,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => GameDashboard()),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.40,
                                height:
                                    MediaQuery.of(context).size.height * 0.20,
                                decoration: BoxDecoration(
                                    color: cardColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      item4.img,
                                      width: 42,
                                    ),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Center(
                                      child: Text(
                                        item4.title,
                                        style: GoogleFonts.openSans(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ]))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Items {
  String title;
  String img;
  Items({
    this.title,
    this.img,
  });
}
