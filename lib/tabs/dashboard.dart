import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Bmi/screens/input_page.dart';
import 'package:wallpaper/Dashboard/Games/gameDash.dart';
import 'package:wallpaper/Settings/helpline.dart';
import 'package:wallpaper/tabs/WOTD/wotd.dart';
import 'package:wallpaper/tabs/notes1.dart';

class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
      title: "New Word",
      img: "assets/icon/font.png",
  );

  Items item2 = new Items(
    title: "Games",
    img: "assets/icon/joystick.png",
  );

  Items item3 = new Items(
    title: "Quiz",
    img: "assets/icon/choose.png",
  );

  Items item4 = new Items(
    title: "News",
    img: "assets/icon/newspaper.png",
  );

  Items item5 = new Items(
    title: "Notes",
    img: "assets/icon/article.png",
  );

  Items item6 = new Items(
    title: "BMI",
    img: "assets/icon/calculator.png",
  );

  @override
  Widget build(BuildContext context) {
    var color = 0xff453658;
    return
      GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: [
        GestureDetector(
        onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Wotd()),
      );
    },
    child: Container(
    decoration: BoxDecoration(
    color: Color(color), borderRadius: BorderRadius.circular(10)),
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
                  MaterialPageRoute(builder: (context) => GameDashboard()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
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
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Helpline()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
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
                  MaterialPageRoute(builder: (context) => Helpline()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
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
                  MaterialPageRoute(builder: (context) => TodoList()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      item5.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Text(
                        item5.title,
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
                  MaterialPageRoute(builder: (context) => BMIMain()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color), borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      item6.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Center(
                      child: Text(
                        item6.title,
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
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title,this.img,});
}
