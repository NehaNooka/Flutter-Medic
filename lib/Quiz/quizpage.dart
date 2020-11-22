import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Quiz/main.dart';
import 'package:wallpaper/Quiz/resultpage.dart';
import 'package:wallpaper/constants.dart';

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

class quizpage extends StatefulWidget {
  final List mydata;

  quizpage({Key key, @required this.mydata}) : super(key: key);
  @override
  _quizpageState createState() => _quizpageState(mydata);
}

class _quizpageState extends State<quizpage> {
  final List mydata;
  _quizpageState(this.mydata);

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
    var rand = new Random();
    for (int i = 0; ;) {
      distinctIds.add(rand.nextInt(10));
      random_array = distinctIds.toSet().toList();
      if(random_array.length < 10){
        continue;
      }else{
        break;
      }
    }
    print(random_array);
  }

  @override
  void initState() {

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
      if (j < 10) {
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
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Alike",
            fontSize: 16.0,
          ),
          maxLines: 1,
        ),
        color: btncolor[k],
        splashColor: Colors.indigo[700],
        highlightColor: Colors.indigo[700],
        minWidth: 200.0,
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
                      color: appBarTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mydata[0][i.toString()] ??  ' '  ,
                  style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Quando",
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
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.red,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Times New Roman',
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
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Times New Roman',
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