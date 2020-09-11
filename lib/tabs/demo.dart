import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final String url =
      "https://raw.githubusercontent.com/NookaNeha/JSON/master/medi.json";

  List<myModel> myAllData = [];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    var response = await http.get(url, headers: {"Aceept": "application/json"});
    if (response.statusCode == 200) {
      String responseBody = response.body;
      var jsonBody = json.decode(responseBody);
      for (var data in jsonBody) {
        myAllData.add(new myModel(data['drug'], data['condition']));
      }
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
                  title: Text('${myAllData[index].drug}',
                      style: TextStyle(fontSize: 28.0, color: Colors.indigo)),
                  subtitle: Text('${myAllData[index].condition}',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.brown,
                          fontWeight: FontWeight.w500)),
                ),
              );
            }));
  }
}

class myModel {
  String drug;
  String condition;

  myModel(this.drug, this.condition);

  myModel.fromJson(Map<String, dynamic> json) {
    drug = json['drug'];
    condition = json['condition'];
  }
}
