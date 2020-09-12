import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final String url =
      "https://raw.githubusercontent.com/NookaNeha/JSON/master/medi.json";

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

    return
        ListView.builder(

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
                          var noteTitle = note.drug.toLowerCase();
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
                  title: Text('${myAllData[index-1].drug}',
                      style: TextStyle(fontSize: 28.0, color: Colors.indigo)),
                  subtitle: Text('${myAllData[index-1].condition}',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.brown,
                          fontWeight: FontWeight.w500)),
                ),
              );
            });
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
