import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
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

  @override
  void initState() {

    loadData();
    super.initState();
  }

  loadData() async {
    var response = await http.get(url, headers: {"Aceept": "application/json"});
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        myAllData.add(new myModel(
            data['name'], data['symptoms'], data['causes'], data['overview']));
      }
    } else {
      print('Something went wrong');
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
    return new DraggableScrollbar.semicircle(
        controller: _scrollController,
        child: ListView.builder(
            controller: _scrollController,
            itemCount: myAllData.length,
            itemBuilder: (_, index) {
              return new Card(
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
            }));
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
