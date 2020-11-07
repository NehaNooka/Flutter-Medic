import 'package:flutter/material.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/HomePage.dart';
import 'package:wallpaper/tabs/Meds.dart';
import 'package:wallpaper/tabs/Diseases.dart';

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
  Widget getPage(int index) {
    if (index == 0) {
      return HomeScreen();
    }
    if (index == 1) {
      return Home1(uid: uid);
    }
    if (index == 2) {
      return Second();
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
            child: getPage(_currentIndex),
          )),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: appBarColor,
            unselectedItemColor: Colors.black38,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.black,
            iconSize: 30,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.ac_unit),
                label: "Diseases",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.all_out),
                label: "Meds",
              ),

            ],
            onTap: onTabTapped,
            currentIndex: _currentIndex,
          )),
    );
  }
}
