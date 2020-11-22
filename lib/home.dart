import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Bmi/screens/input_page.dart';
import 'package:wallpaper/Notes/main.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/Meds.dart';
import 'package:wallpaper/tabs/Diseases.dart';
import 'package:wallpaper/tabs/dashboard.dart';

class Home extends StatelessWidget {
  final String title = "Medic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Body1());
  }
}

class Body1 extends StatefulWidget {
  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var uid;
  @override
  void initState()  {
  getCurrentUID();
    super.initState();
  }
  void getCurrentUID() async {
    final FirebaseUser user = await _auth.currentUser();
     uid = user.uid;  }

  // ignore: missing_return
  Widget getPage(int index) {
    if (index == 0) {
      return MenuDashboardPage();
    }
    if (index == 1) {
      return Home1();
    }
    if (index == 2) {
      return Second();
    }
    if (index == 3) {
      return NotesApp();
    }if (index == 4) {
      return BMIMain();
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
            unselectedItemColor: Colors.black54,
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
              BottomNavigationBarItem(
                icon: Icon(Icons.note_add
                ),
                label: "Notes",
              ), BottomNavigationBarItem(
                icon: Icon(Icons.calculate_rounded),
                label: "BMI",
              ),
            ],
            onTap: onTabTapped,
            currentIndex: _currentIndex,
          )),
    );
  }
}

