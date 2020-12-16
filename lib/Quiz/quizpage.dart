import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Quiz/main.dart';
import 'package:wallpaper/Quiz/resultpage.dart';
import 'package:wallpaper/Quiz/constants.dart';
import 'package:random_string/random_string.dart';

// ignore: must_be_immutable, camel_case_types
class getjson extends StatelessWidget {

  String langname;
  getjson(this.langname);
  String assettoload;


  setasset() {
    if (langname == "Basic") {
      assettoload = "assets/Json/basic1.json";
    } else if (langname == "Human Body") {
      assettoload = "assets/Json/basic2.json";
    } else if (langname == "Anatomy") {
      assettoload = "assets/Json/basic3.json";
    } else if (langname == "Nutrition") {
      assettoload = "assets/Json/basic4.json";
    } else if (langname == "Maternity") {
      assettoload = "assets/Json/basic5.json";
    }
    else if (langname == "Dental") {
      assettoload = "assets/Json/basic6.json";
    } else if (langname == "Physiology") {
      assettoload = "assets/Json/basic7.json";
    } else if (langname == "Emergency Medicines") {
      assettoload = "assets/Json/basic8.json";
    } else if (langname == "Clinical") {
      assettoload = "assets/Json/basic9.json";
    }
    else if (langname == "Gynaecology") {
      assettoload = "assets/Json/basic10.json";
    } else if (langname == "Internal medicine") {
      assettoload = "assets/Json/basic11.json";
    } else if (langname == "Pharmacology") {
      assettoload = "assets/Json/basic12.json";
    } else if (langname == "Surgery") {
      assettoload = "assets/Json/basic13.json";
    }else if (langname == "Funny") {
      assettoload = "assets/Json/basic14.json";
    } else if (langname == "Miscellanous") {
      assettoload = "assets/Json/basic15.json";
    }
  }

  @override
  Widget build(BuildContext context) {

    setasset();
    // and now we return the FutureBuilder to load and decode JSON
    return FutureBuilder(
      future:
      DefaultAssetBundle.of(context).loadString(assettoload, cache: false),
      builder: (context, snapshot) {
        List mydata = json.decode(snapshot.data.toString());
        if (mydata == null) {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator()
            ),
          );
        } else {
          return quizpage(mydata: mydata);
        }
      },
    );
  }
}

// ignore: camel_case_types
class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

// ignore: camel_case_types
class _quizpageState extends State<quizpage> {
  final List mydata;
  _quizpageState(this.mydata);
  var  _counter=0;
  Color colortoshow = Colors.indigoAccent;
  Color right = Colors.green;
  Color wrong = Colors.red;
  int marks = 0;
  int i = 1;
  bool disableAnswer = false;
  // extra varibale to iterate
  int j = 1;
  int timer = 30;
  String showtimer = "30";
  // ignore: non_constant_identifier_names
  var random_array;
  List  tcVisibility = [false,false,false,false,false,false,false,false,false,false];
  Map<String, Color> btncolor = {
    "a": Colors.indigoAccent,
    "b": Colors.indigoAccent,
    "c": Colors.indigoAccent,
    "d": Colors.indigoAccent,
  };

  bool canceltimer = false;

  genrandomarray(){
    var distinctIds = [];
    var rand ;
    // ignore: unused_local_variable
    for (int i = 1; ;) {
      rand =  randomBetween(1,9);
      distinctIds.add(rand);
      random_array = distinctIds.toSet().toList();
      if(random_array.length < 9){
        continue;
      }else{
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {
    _counter=1;
    starttimer();
    genrandomarray();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  void starttimer() async {
    const onesec = Duration(seconds: 1);
    Timer.periodic(onesec, (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextquestion();
        } else if (canceltimer == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showtimer = timer.toString();
      });
    });
  }

  void nextquestion() {
    canceltimer = false;
    timer = 30;

    setState(() {
      if (j <9) {
        i = random_array[j];
        j++;
      } else {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => resultpage(marks: marks),
        ));
      }
      btncolor["a"] = Colors.indigoAccent;
      btncolor["b"] = Colors.indigoAccent;
      btncolor["c"] = Colors.indigoAccent;
      btncolor["d"] = Colors.indigoAccent;
      disableAnswer = false;
    });
    starttimer();
  }

  void checkanswer(String k) {


    if (mydata[2][i.toString()] == mydata[1][i.toString()][k]) {
      marks = marks + 5;
      colortoshow = right;
    } else {

      colortoshow = wrong;
    }
    setState(() {
      _counter++;
      print(mydata[2][i.toString()] );
      tcVisibility[i] = true;
      btncolor[k] = colortoshow;
      canceltimer = true;
      disableAnswer = true;

    });

    Timer(Duration(seconds: 2), nextquestion);
  }

  Widget choicebutton(String k) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: MaterialButton(
        onPressed: () => checkanswer(k),
        child: Text(
          mydata[1][i.toString()][k] ??  ' ',
          style: GoogleFonts.aldrich(
            color: Colors.white,
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: cardColor,
        highlightColor: cardColor,
        minWidth: MediaQuery.of(context).size.width*0.70 ,
        height: 45.0,
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return  Scaffold(
      appBar: AppBar(
        elevation:0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: ( () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Quiz()),
            );
          }
          ),
        ),
        title: Text("QUIZ",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.lightBlue[900],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        backgroundColor: appBarColor,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Que $_counter: "+mydata[0][i.toString()] ??  ' '  ,
                style: GoogleFonts.aldrich(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                 ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: AbsorbPointer(
              absorbing: disableAnswer,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    choicebutton('a'),
                    choicebutton('b'),
                    choicebutton('c'),
                    choicebutton('d'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                child: Visibility(
                  visible: tcVisibility[i],
                  child: Text(
                    mydata[2][i.toString()]?? ' ' ,
                    style: GoogleFonts.aldrich(
                      fontSize: 22.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color:Colors.green,
              alignment: Alignment.topCenter,
              child: Center(
                child: Text(
                  showtimer,
                  style: GoogleFonts.aldrich(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}