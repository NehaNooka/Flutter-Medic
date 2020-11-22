import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:wallpaper/constants.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  final String url =
      "https://raw.githubusercontent.com/NookaNeha/JSON/master/medi.json";

  List<myModel> myAllData = [];
  List<myModel> myAllData1 = [];
  ScrollController _semicircleController = ScrollController();
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

    return new MaterialApp(
        debugShowCheckedModeBanner: false,

        home: new Scaffold(
          appBar: AppBar(
            elevation:0.0,
            iconTheme: new IconThemeData(color: Colors.black),
            centerTitle: true,
            title: Text("MEDICINES",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 22.0,
                        color: appBarTextColor,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2))),
            backgroundColor:appBarColor,
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
            color: Colors.white,
                child: new Center(
                    child: SpinKitSquareCircle(color: Colors.black38,size:100.0,)),
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
              shadowColor: Colors.grey,
              color: Colors.white70,
              child: ListTile(

                trailing: IconButton(

                    icon: Icon(
                      Icons.volume_up,
                      color: Colors.blueGrey[900],
                      size: 30.0,
                    ),
                    onPressed: ()=> speak('${myAllData[index].drug}')),

                leading: Icon(
                  Icons.whatshot ,
                  color: Colors.redAccent,
                ),
                title: Text('${myAllData[index].drug}',
                    style: TextStyle(fontSize: 28.0, color: Colors.blue[900])),
                subtitle: Text('${myAllData[index].condition}',
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w500)),
              ),
            );
          }),
    );
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

class DataSearch extends SearchDelegate<myModel> {
  List<myModel> myAllData = [];
  DataSearch({this.myAllData});

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
            .where((p) => p.drug.toLowerCase().contains(query.toLowerCase()))
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
                  onTap: () {},

                  leading: Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                  title:  SubstringHighlight(
                    text: listItem.drug,
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


                  subtitle: Text(listItem.condition),
                ),
              );
            });
  }
}
