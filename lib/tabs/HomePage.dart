import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Settings/about.dart';
import 'package:wallpaper/Settings/faq.dart';
import 'package:wallpaper/Settings/helpline.dart';
import 'package:wallpaper/Settings/privacy.dart';
import 'package:wallpaper/Settings/profile_view.dart';
import 'package:wallpaper/Settings/rate.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/tabs/dashboard.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
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
    day = "Evening";
    return day;
  }

  PageController _controller = PageController(
    initialPage: 1,
      viewportFraction: 0.8
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text("MEDIC",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
            backgroundColor: appBarColor,
          ),


          drawer: Drawer(

            child: new ListView(

              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/login/d.jpg"), fit: BoxFit.cover)
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Good " + greeting(),
                            style: GoogleFonts.pacifico(
                                textStyle: TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3.5))),
                        SizedBox(
                          height: 32.0,
                        ),
                        Text("Settings",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                Card(
                  child: ListTile(

                      leading: new IconButton(
                        icon: new Icon(Icons.phone, color: Colors.black),
                        onPressed: () {},
                      ),
                      title: Text(
                        ' HelpLine',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Helpline()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(
                      
                      leading: new IconButton(
                        icon: new Icon(Icons.info_outline, color: Colors.black),
                        onPressed: () {},
                      ),
                      title: Text(
                        'App Info',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => About()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(
                      
                      leading: new IconButton(
                        icon: new Icon(Icons.question_answer, color: Colors.black),
                        onPressed: () {},
                      ),
                      title: Text(
                        'FAQs',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Faq()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(
                      
                      leading: new IconButton(
                        icon: new Icon(Icons.star, color: Colors.black),
                        onPressed: () {},
                      ),
                      title: Text(
                        'Rate Us!',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Rate()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(
                      
                      leading: new IconButton(
                        icon: new Icon(Icons.lock, color: Colors.black),
                        onPressed: () {},
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Privacy()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(

                    leading: new IconButton(
                      icon: new Icon(Icons.account_circle, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text(
                      'My Account',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileView()),
                        );
                      }),
                  ),
                Card(
                  child: ListTile(
                    
                    leading: new IconButton(
                      icon: new Icon(Icons.exit_to_app, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text(
                      'LogOut',
                      style: TextStyle(
                          color: Colors.black,
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
                ),
                Card(
                  child: ListTile(
                    

                    title: Text(
                      'Version',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '1.0.2',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                    },
                  ),
                ),
              ],
            ),
          ),
    body: GridDashboard()

    );
  }
}
