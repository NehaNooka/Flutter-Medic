import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/tabs/details.dart';
class Search extends StatefulWidget {
  final name;
  final symptoms;
  final causes;
  final overview;


  Search({
    Key key,
    @required this.name,
    this.symptoms,
    this.causes,
    this.overview,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState(name:name,
  symptoms: symptoms,
  causes: causes,
  overview: overview);
}

class _SearchState extends State<Search> {
  final name;
  final symptoms;
  final causes;
  final overview;
  _SearchState({
   this.name,
    this.symptoms,
    this.causes,
    this.overview
});

  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("hi-IN");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            iconTheme: new IconThemeData(color: Colors.black),
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            actionsIconTheme: IconThemeData(opacity: 0.5),
            flexibleSpace: FlexibleSpaceBar(

              title: Text(widget.name,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              background: Opacity(
                opacity: 0.7,
                child: Image.network(
                  "https://images.pexels.com/photos/3992933/pexels-photo-3992933.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ];
      },
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: new FloatingActionButton(
                          onPressed: () {},
                          child: IconButton(
                              icon: Icon(
                                Icons.volume_up,
                                color: Colors.black,
                              ),
                              onPressed: () => speak(widget.name)),
                        ),
                      ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.deepPurple[400],
                    alignment: Alignment.center,
                    height: 100.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                              "OVERVIEW",
                            style: GoogleFonts.aldrich(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 0,
                          child: FlatButton(
                            onPressed:
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                        name:name,
                                        title:"OVERVIEW",
                                        symptoms:overview,
                                      )));
                            },
                            child: Text(
                              "OPEN",
                            ),
                            textColor: Colors.black87,
                            color: Colors.yellow,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Color(0xFFffcd3c),
                    alignment: Alignment.center,
                    height: 100.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "SYMPTOMS",
                            style: GoogleFonts.aldrich(
                              color: Color(0xFF2e282a),
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 0,
                          child: FlatButton(
                            onPressed:
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                        name:name,
                                        title:"SYMPTOMS",
                                        symptoms:symptoms,
                                      )));
                            },
                            child: Text(
                              "OPEN",
                            ),
                            textColor: Colors.white,
                            color: Colors.indigoAccent,

                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: Colors.deepPurple[400],
                    alignment: Alignment.center,
                    height: 100.0,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "CAUSES",
                            style: GoogleFonts.aldrich(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          bottom: 0,
                          child: FlatButton(
                            onPressed:
                                () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                        name:name,
                                        title:"CAUSES",
                                        symptoms:causes,
                                      )));
                            },
                            child: Text(
                              "OPEN",
                            ),
                            textColor: Colors.black87,
                            color: Colors.yellow,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),



              ]),
          ),
        ),
      ),
    ));
  }


}

