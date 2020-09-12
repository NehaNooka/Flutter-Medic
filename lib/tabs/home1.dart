import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:wallpaper/tabs/search.dart';
import 'package:http/http.dart' as http;

class Homee extends StatefulWidget {
  Homee({this.uid});
  final String uid;
  @override
  _HomeeState createState() => _HomeeState(uid: uid);
}

class _HomeeState extends State<Homee> {
  _HomeeState({this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: Center(child: Home1()),
        ));
  }
}

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final String url =
      "https://raw.githubusercontent.com/NookaNeha/JSON/master/dataset.json";

  List<myModel> myAllData = [];
  List<myModel> Nfd = [];

  @override
  void initState() {
    loadData().then((value) {
      setState(() {
        myAllData.addAll(value);
        Nfd = myAllData;

      });
    });
    super.initState();
  }

  Future<List<myModel>>loadData() async {
    var response = await http.get(url, headers: {"Aceept": "application/json"});
    var notes = List<myModel>();
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var jsonBody = json.decode(responseBody);
      for (var data in jsonBody) {
        notes.add(myModel.fromJson(data));
      }
      return notes;
    } else {
      SnackBar(
          content: Text('Oops! Something went wrong')
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
          body: myAllData.length == 0
              ? new Center(
                  child: new CircularProgressIndicator(),
                )
              : showMyUI(),
        ));
  }

  Widget showMyUI() {
    final ScrollController _scrollController = new ScrollController();
    return
        ListView.builder(
            controller: _scrollController,
            itemCount: Nfd.length+1,
            itemBuilder: (_, index) {
              return index == 0 ?


              Padding(
                  padding: EdgeInsets.all(20.0),
                  child:
                  TextField(

                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(
                            5.0,
                          ),
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white60,
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Search by Name',),
                    onChanged: (text) {
                      text = text.toLowerCase();
                      setState(() {
                        Nfd = myAllData.where((note) {
                          var noteTitle = note.name.toLowerCase();
                          return noteTitle.contains(text);
                        }).toList();
                      });
                    },

                  ))




                  : new Card(
                margin: EdgeInsets.all(8.0),
                elevation: 8.0,
                shadowColor: Colors.grey,
                child: ListTile(
                    leading: Icon(
                      Icons.album,
                      color: Colors.redAccent,
                    ),
                    title: Text(' ${myAllData[index].name}',
                        style: TextStyle(fontSize: 28.0, color: Colors.indigo)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(
                                    name: '${myAllData[index].name}',
                                    symptoms: '${myAllData[index].symptoms}',
                                    causes: '${myAllData[index].causes}',
                                    overview: '${myAllData[index].overview}',
                                  )));
                    }),
              );
            });
  }
}

class myModel {
  String name;
  String symptoms;
  String causes;

  String overview;

  myModel(
    this.name,
    this.symptoms,
    this.causes,
    this.overview,
  );

  myModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symptoms = json['symptoms'];
    causes = json['causes'];

    overview = json['overview'];
  }
}
