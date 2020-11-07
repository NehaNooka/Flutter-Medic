
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
import 'dart:convert';
import 'package:wallpaper/tabs/search.dart';
import 'package:http/http.dart' as http;
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:substring_highlight/substring_highlight.dart';

class Home1 extends StatefulWidget {
  Home1({this.uid});
  final String uid;

  @override
  _Home1State createState() => _Home1State(uid: uid);
}

class _Home1State extends State<Home1> {
  _Home1State({this.uid});
  final String uid;

  final String url =
      "https://raw.githubusercontent.com/NookaNeha/JSON/master/dataset.json";
  ScrollController _semicircleController = ScrollController();
  List<myModel> myAllData = [];
  List<myModel> myAllData1 = [];
  @override
  void initState() {
    loadData().then((value) {
      setState(() {
        myAllData.addAll(value);
        myAllData1 = myAllData;
      });
    });
    super.initState();
  }

  Future<List<myModel>> loadData() async {
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
      SnackBar(content: Text('Oops! Something went wrong'));
    }
  }

  final FlutterTts flutterTts = FlutterTts();
  speak(String text) async{
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: new Scaffold(
          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            backgroundColor: appBarColor,
            title: Text("DISEASES",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2))),

            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: DataSearch(myAllData: myAllData1));
                },
              )
            ],
          ),

          body: myAllData.length == 0
              ? Container(
                  color: appBarColor,
                  child: new Center(
                      child: SpinKitSquareCircle(
                    color: Colors.black38,
                    size: 100.0,
                  )),
                )
              : showMyUI(),
        ));
  }

  Widget showMyUI() {
    return DraggableScrollbar.semicircle(
      controller: _semicircleController,
      child: ListView.builder(
          controller: _semicircleController,
          itemCount: myAllData.length,
          itemBuilder: (_, index) {
            return new Card(
              margin: EdgeInsets.all(8.0),
              elevation: 8.0,
              color: Colors.white70,
              shadowColor: Colors.grey,
              child: ListTile(
                  leading: Icon(
                    Icons.whatshot,
                    color: Colors.redAccent,
                  ),
                  trailing: IconButton(

                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.blueGrey[900],
                        size: 30.0,
                      ),
                      onPressed: ()=> speak(' ${myAllData[index].name}')),
                  title: Text(' ${myAllData[index].name}',
                      style: TextStyle(fontSize: 28.0, color: Colors.blue[900])),
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
          }),
    );
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

class DataSearch extends SearchDelegate<myModel> {
  List<myModel> myAllData = [];
  DataSearch({this.myAllData});
  final FlutterTts flutterTts = FlutterTts();
  speak(String text) async{
    await flutterTts.setVolume(200.0);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final myList = query.isEmpty
        ? myAllData
        : myAllData
            .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
    return myList.isEmpty
        ? Center(
            child: Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(
              Icons.search_outlined,
              color: Colors.red,
            ),
            Text("  No Results Found",
                style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)),
          ])))
        : ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              final myModel listItem = myList[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Search(
                                  name: listItem.name,
                                  symptoms: listItem.symptoms,
                                  causes: listItem.causes,
                                  overview: listItem.overview,
                                )));
                  },
                  leading: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                  trailing: IconButton(

                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.green[900],
                        size: 30.0,
                      ),
                      onPressed: ()=> speak(listItem.name)),
                  title:
                  SubstringHighlight(
                    text: listItem.name,
                    term: query,
                    textStyle: TextStyle(                       // non-highlight style
                      color: Colors.black,
                      fontSize:18.0
                    ),
                    textStyleHighlight: TextStyle(              // highlight style
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                        fontSize: 20.0
                    ),
                  ),




                ),
              );
            });
  }
}


