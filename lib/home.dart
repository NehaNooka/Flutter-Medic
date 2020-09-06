import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/main.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: Text(
            title,
            style: TextStyle(color: Colors.black),
          ),
        ),
        drawer: Drawer(
          child: new ListView(
            children: [
              Padding(padding: EdgeInsets.only(top: 15.0)),
              ListTile(

                title: Text('Settings',
                    style: TextStyle(fontSize: 30.0, color: Colors.black45)),
              ),
              Card(
                child: ListTile(
                    tileColor: Colors.black12,
                    leading: new IconButton(
                      icon: new Icon(Icons.info, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text('About'),
                    onTap: () {}),
              ),
              Card(
                child: ListTile(
                    tileColor: Colors.black12,
                    leading: new IconButton(
                      icon: new Icon(Icons.info, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text('About'),
                    onTap: () {}),
              ),
              Card(
                child: ListTile(
                    tileColor: Colors.black12,
                    leading: new IconButton(
                      icon: new Icon(Icons.info, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text('About'),
                    onTap: () {}),
              ),
              Card(
                child: ListTile(
                    tileColor: Colors.black12,
                    leading: new IconButton(
                      icon: new Icon(Icons.info, color: Colors.black),
                      onPressed: () {},
                    ),
                    title: Text('About'),
                    onTap: () {}),
              ),
              Card(
                child: ListTile(
                  tileColor: Colors.black12,
                  leading: new IconButton(
                    icon: new Icon(Icons.exit_to_app, color: Colors.black),
                    onPressed: () {},
                  ),
                  title: Text('Logout'),
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
        body: Body1());
  }
}

class Body1 extends StatefulWidget {

  @override
  _Body1State createState() => _Body1State();
}

class _Body1State extends State<Body1> {

  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Home1(),
    ),
    Center(
      child: Drugs(),
    ),
    Center(
      child: Notes(),
    ),
    Center(
      child: Fav(),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: new Scaffold(
            body: Center(
                child: SafeArea(
                  child: tabs[_currentIndex],
                )),
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.cyan ,
                unselectedItemColor: Colors.black45,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.black,
                iconSize: 30,
                currentIndex: _currentIndex,
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
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                })));
  }
}


