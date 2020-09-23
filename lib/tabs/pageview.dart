import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Settings/about.dart';
import 'package:wallpaper/Settings/privacy.dart';
import 'package:wallpaper/Settings/rate.dart';
import 'package:wallpaper/Settings/terms.dart';
import 'package:wallpaper/main.dart';

class Scroll extends StatefulWidget {
  @override
  _ScrollState createState() => _ScrollState();
}

class _ScrollState extends State<Scroll> {
  final controller = PageController(initialPage: 0, viewportFraction: 0.8);

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
    initialPage: 0,
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xFF0A0E21),
          appBar: AppBar(
            title: Text('Medic'),
            backgroundColor: Color(0xFF0A0E21),
          ),
          drawer: Drawer(

            child: new ListView(

              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/d.jpg"), fit: BoxFit.cover)),
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
                          height: 40.0,
                        ),
                        Text("Settings",
                            style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
                Divider(),
                Card(
                  child: ListTile(
                      tileColor: Color(0xFF0A0E21),
                      leading: new IconButton(
                        icon: new Icon(Icons.info, color: Colors.white),
                        onPressed: () {},
                      ),
                      title: Text(
                        'Know More',
                        style: TextStyle(
                            color: Colors.white,
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
                      tileColor: Color(0xFF0A0E21),
                      leading: new IconButton(
                        icon: new Icon(Icons.star, color: Colors.white),
                        onPressed: () {},
                      ),
                      title: Text(
                        'Rate Us!',
                        style: TextStyle(
                            color: Colors.white,
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
                Divider(),
                Card(
                  child: ListTile(
                      tileColor: Color(0xFF0A0E21),
                      leading: new IconButton(
                        icon:
                            new Icon(Icons.assistant_photo, color: Colors.white),
                        onPressed: () {},
                      ),
                      title: Text(
                        'T & C',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Terms()),
                        );
                      }),
                ),
                Card(
                  child: ListTile(
                      tileColor: Color(0xFF0A0E21),
                      leading: new IconButton(
                        icon: new Icon(Icons.lock, color: Colors.white),
                        onPressed: () {},
                      ),
                      title: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: Colors.white,
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
                Divider(),
                Card(
                  child: ListTile(
                    tileColor: Color(0xFF0A0E21),
                    leading: new IconButton(
                      icon: new Icon(Icons.exit_to_app, color: Colors.white),
                      onPressed: () {},
                    ),
                    title: Text(
                      'LogOut',
                      style: TextStyle(
                          color: Colors.white,
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
              ],
            ),
          ),
          body: PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            children: [
              Container(
                decoration: new BoxDecoration(
                  color: Colors.brown[100],
                  border: Border.all(width: 10.0, color: Colors.white),

                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Walking outside or spending time in green space can reduce negative thoughts.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.brown[800] ,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.teal[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                    child: new Text(
                        "  Chocolate is good for your skin. it improve blood flow and protect against UV damage.",
                        style: GoogleFonts.pacifico(
                            textStyle: TextStyle(
                                fontSize: 40.0, color: Colors.teal[800],
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            wordSpacing: 2.0)))),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.deepOrange[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Chewing gum makes you more alert, relieves stress and reduces anxiety levels.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.deepOrange[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.purple[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Drinking coffee can reduce the risk of depression,especially in women.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.purple[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.pink[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Reading can lower the levels of unhealthy stress hormones.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.pink[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.green[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Nearly 30% of the world’s population is obese.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.green[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(
                decoration: new BoxDecoration(
                  color: Colors.red[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  A lack of exercise now causes as many deaths as smoking.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.red[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              ),
              Container(

                decoration: new BoxDecoration(
                  color: Colors.blue[100],
                  border: Border.all(width: 10.0, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(75.0) //
                      ),
                ),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: new Text(
                      "  Laughing is good for the heart and can increase blood flow by 20 percent.",
                      style: GoogleFonts.pacifico(
                          textStyle: TextStyle(
                              fontSize: 40.0,
                              color: Colors.blue[800],
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.0,
                              wordSpacing: 2.0))),
                ),
              )
            ],
          )
    );
  }
}
