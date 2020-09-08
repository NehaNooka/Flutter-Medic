import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:wallpaper/main.dart';
import 'package:wallpaper/tabs/search.dart';
class Home1 extends StatefulWidget {
  Home1({this.uid});
  final String uid;
  @override
  _Home1State createState() => _Home1State(uid: uid);
}

class _Home1State extends State<Home1> {
  _Home1State({this.uid});
  final String uid;

    final ScrollController _scrollController = new ScrollController();
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
              child: FutureBuilder(builder: (context, snapshot){
                var showData=json.decode(snapshot.data.toString());
                return DraggableScrollbar.semicircle(
                    controller: _scrollController,
                    child: ListView.builder(

                      controller: _scrollController,

                      itemBuilder: (BuildContext context, int index){
                        var post =showData[index];
                        return Card(
                          margin: EdgeInsets.all(8.0),

                          elevation: 8.0,
                          shadowColor: Colors.grey,
                            child: InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                        onTap: () {},
                          child: ListTile(

                              leading: Icon(
                                Icons.whatshot,
                                color: Colors.redAccent,
                              ),
                              title: Text(post['name'],   style: TextStyle(
                                  fontSize: 28.0, color: Colors.indigo)),

                              trailing: IconButton(
                                icon: Icon(Icons.favorite_outline_rounded),
                                onPressed: () {},
                                splashColor: Colors.black,
                                highlightColor: Colors.red,
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Search(name: post['name'] , symptoms: post['symptoms'] ,causes: post['causes']
                                  ,risk: post['risk_factor'] ,overview: post['overview'] ,treatment: post['treatment'] ,medication: post['medication'] ,
                                ))
                                ); }
                          ),
                            ), );
                      },
                      itemCount: showData.length,
                    ));
              }, future: DefaultAssetBundle.of(context).loadString("assets/dataset.json"),

              ),
            ),

          ) );
    }
  }

