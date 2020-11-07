import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Settings/helpline.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/WOTD/wotd.dart';
import 'package:wallpaper/tabs/notes1.dart';

class GameDashboard extends StatefulWidget {
  @override
  _GameDashboardState createState() => _GameDashboardState();
}

class _GameDashboardState extends State<GameDashboard>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text("Games",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),

        body: GameDashboard1()

    );
  }
}

class GameDashboard1 extends StatefulWidget {
  @override
  _GameDashboard1State createState() => _GameDashboard1State();
}

class _GameDashboard1State extends State<GameDashboard1> {
  Items item1 = new Items(
    title: "Snake",
    img: "assets/icon/games/snake.png",
  );

  Items item2 = new Items(
    title: "TicTacToe",
    img: "assets/icon/games/tictactoe.png",
  );

  Items item3 = new Items(
    title: "Memory",
    img: "assets/icon/games/memory.png",
  );

  Items item4 = new Items(
    title: "Hangman",
    img: "assets/icon/games/hangman.png",
  );

  Items item5 = new Items(
    title: "Super Mario",
    img: "assets/icon/games/mario.png",
  );


  @override
  Widget build(BuildContext context) {
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
                  color: Color(0xFFffcd3c), borderRadius: BorderRadius.circular(10)),
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
                MaterialPageRoute(builder: (context) => Helpline()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFffcd3c), borderRadius: BorderRadius.circular(10)),
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
                  color: Color(0xFFffcd3c), borderRadius: BorderRadius.circular(10)),
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
                  color: Color(0xFFffcd3c), borderRadius: BorderRadius.circular(10)),
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
                  color: Color(0xFFffcd3c), borderRadius: BorderRadius.circular(10)),
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
        ],
      );
  }
}

class Items {
  String title;
  String img;
  Items({this.title,this.img,});
}
