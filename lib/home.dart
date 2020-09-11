import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/tabs/bookmark.dart';
import 'package:wallpaper/tabs/notes.dart';
import 'package:wallpaper/tabs/demo.dart';
import 'package:wallpaper/tabs/home1.dart';
import 'package:wallpaper/main.dart';


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
      return Homee(uid: uid);
    }
    if (index == 1) {
      return Home2();
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


            appBar: AppBar(

              backgroundColor: Colors.cyan,
              title: Text(
                "Medic",
                style: TextStyle(color: Colors.white),
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


