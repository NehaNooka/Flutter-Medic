import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Quiz/quizpage.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/home.dart';


class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  List<String> images = [
    "assets/icon/Quiz/medical-report.png",
    "assets/icon/Quiz/doctor(1).png",
    "assets/icon/Quiz/first-aid-kit.png",
    "assets/icon/Quiz/stethoscope.png",
    "assets/icon/Quiz/doctor.png",
    "assets/icon/Quiz/medical-report.png",
    "assets/icon/Quiz/doctor(1).png",
    "assets/icon/Quiz/first-aid-kit.png",
    "assets/icon/Quiz/stethoscope.png",
    "assets/icon/Quiz/doctor.png",
    "assets/icon/Quiz/medical-report.png",
    "assets/icon/Quiz/doctor(1).png",
    "assets/icon/Quiz/first-aid-kit.png",
    "assets/icon/Quiz/stethoscope.png",
    "assets/icon/Quiz/doctor.png",
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
    "This Quiz contains 10 questions on Funny Facts",
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
          color: Colors.deepOrange[500],
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
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    des,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "Alike"
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
                    color: appBarTextColor,
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
          customcard("Surgery", images[12], des[12]),
          customcard("Funny", images[13], des[13]),
          customcard("Miscellanous", images[14], des[14]),
        ],
      ),
    );
  }
}