import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class Details extends StatefulWidget {
  final name;
  final title;
  final symptoms;

  Details({
    Key key,
    @required this.name,
    this.title,
    this.symptoms,
  }) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  FlutterTts flutterTts= FlutterTts();

  speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(widget.name,
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        backgroundColor: appBarColor,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Text(widget.title,
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2)),
              ),
            ),
          ),

              Align(
                alignment: Alignment.topCenter,
                child: new FloatingActionButton(
                  onPressed: () {},
                  child: IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: Colors.black,
                      ),
                      onPressed: () => speak(widget.symptoms)),
                ),
              ),

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                color: Colors.lightBlue[400],
                child: Align(
                  alignment: Alignment.center,
                  child: Text(widget.symptoms,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        wordSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
