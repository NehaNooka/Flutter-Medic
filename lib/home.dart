import 'package:flutter/material.dart';
import 'package:wallpaper/tabs/bookmark.dart';
import 'package:wallpaper/tabs/drugs.dart';
import 'package:wallpaper/tabs/home1.dart';
import 'package:wallpaper/tabs/notes.dart';

class Home extends StatelessWidget {
  Home({this.uid});
  final String uid;
  final String title = "Medic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Body1(uid: this.uid));
  }
}

class Body1 extends StatefulWidget {
  Body1({this.uid});
  final String uid;
  @override
  _Body1State createState() => _Body1State(uid: this.uid);
}

class _Body1State extends State<Body1> {
  _Body1State({this.uid});
  final String uid;

  // ignore: missing_return
  Widget getPage(int index) {
    if (index == 0) {
      return Home1(uid: uid);
    }
    if (index == 1) {
      return Drugs();
    }
    if (index == 2) {
      return Notes(uid: uid);
    }
    if (index == 3) {
      return  Fav();
    }
  }

  int _currentIndex = 0;

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: new Scaffold(
            body: Center(
                child: SafeArea(
                  child:getPage(_currentIndex),
                )),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.cyan ,
                unselectedItemColor: Colors.black45,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                iconSize: 30,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.all_out  ),
                    label: "Meds",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.note_add),
                    label: "Notes",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: "Favourites",
                  ),
                ],
    onTap: onTabTapped,
    currentIndex: _currentIndex,
               )),
  );
  }
}


