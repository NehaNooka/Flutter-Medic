import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Quiz/quizpage.dart';
import 'package:wallpaper/Quiz/constants.dart';
import 'package:wallpaper/home.dart';

// ignore: camel_case_types
class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

// ignore: camel_case_types
class _homepageState extends State<homepage> {

  List<String> images = [
    "assets/icon/Quiz/basic2.jpg",
    "assets/icon/Quiz/human_body.png",
    "assets/icon/Quiz/human1.jpg",
    "assets/icon/Quiz/nutri1.png",
    "assets/icon/Quiz/gy1.jpg",
    "assets/icon/Quiz/dental1.png",
    "assets/icon/Quiz/phy1.jpg",
    "assets/icon/Quiz/emer_med.jpg",
    "assets/icon/Quiz/clinic1.png",
    "assets/icon/Quiz/gy3.png",
    "assets/icon/Quiz/int_med.jpg",
    "assets/icon/Quiz/pharma1.jpg",
    "assets/icon/Quiz/surgery.png",
    "assets/icon/Quiz/phycho.jpg",
    "assets/icon/Quiz/m.jpg",
  ];

  List<String> des = [
    "This quiz contains 10 questions of basic medical knowledge.",
    "This quiz contains 10 questions on Human Body.",
    "This Quiz contains 10 questions on  Anatomy.",
    "This Quiz contains 10 questions on Nutrition",
    "This Quiz contains 10 questions on Maternity !",
    "This quiz contains 10 questions of Dental.",
    "This quiz contains 10 questions on Physiology.",
    "This Quiz contains 10 questions on  Emergency Medicines.",
    "This Quiz contains 10 questions on Clinical",
    "This Quiz contains 10 questions on Gynaecology !",
    "This quiz contains 10 questions of Internal medicine.",
    "This quiz contains 10 questions on Pharmacology.",
    "This Quiz contains 10 questions on  Surgery.",
    "This Quiz contains 10 questions on Phychology.",
    "This Quiz contains 10 questions on Miscellanous type !",
  ];

  Widget customcard(String langname, String image, String des){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      child: InkWell(
        onTap: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(

            builder: (context) => getjson(langname),
          ));
        },
        child: Material(
          color: Colors.indigoAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(25.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(100.0),
                    child: Container(
                      // changing from 200 to 150 as to look better
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            image,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname,
                    style: GoogleFonts.aldrich(
                      fontSize: 20.0,
                      color: Colors.white,

                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: GoogleFonts.aldrich(
                        fontSize: 18.0,
                        color: Colors.white,

                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown, DeviceOrientation.portraitUp
    ]);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: ( () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home()),
            );
          }
          ),
        ),
        elevation:0.0,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: appBarColor,
        title: Text("QUIZ",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 24.0,
                    color: Colors.lightBlue[900],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
      ),
      body: ListView(
        children: <Widget>[
          customcard("Basic", images[0], des[0]),
          customcard("Human Body", images[1], des[1]),
          customcard("Anatomy", images[2], des[2]),
          customcard("Nutrition", images[3], des[3]),
          customcard("Maternity", images[4], des[4]),
          customcard("Dental", images[5], des[5]),
          customcard("Physiology", images[6], des[6]),
          customcard("Emergency Medicines", images[7], des[7]),
          customcard("Clinical", images[8], des[8]),
          customcard("Gynaecology", images[9], des[9]),
          customcard("Internal medicine", images[10], des[10]),
          customcard("Pharmacology", images[11], des[11]),
          customcard("Surgery", images[
          12], des[12]),
          customcard("Phychology", images[13], des[13]),
          customcard("Miscellanous", images[14], des[14]),
        ],
      ),
    );
  }
}
