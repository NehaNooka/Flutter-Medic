import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Bmi/screens/hwt1Chart.dart';
import 'package:wallpaper/Bmi/screens/hwtChart.dart';
import 'package:wallpaper/constants.dart';

class choose extends StatefulWidget {

  @override
  _chooseState createState() => _chooseState();
}

class _chooseState extends State<choose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("WEIGHT CHART",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: appBarTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                    height: 150,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: cardColor1,
                        child: Text(
                        "WEIGHT CHART(MEN)".toUpperCase(),
                        style: GoogleFonts.aldrich(
                            fontSize:22.0,color: Colors.white),
                        ),
                    onPressed:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hwtChart()),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: MaterialButton(
                    height: 150,
                    minWidth: 150,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: cardColor1,
                      child: Text(
                        "WEIGHT CHART (WOMEN)".toUpperCase(),
                        style: GoogleFonts.aldrich(
                            fontSize:22.0,color: Colors.white),
                          ),
                    onPressed:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hwtChart1()),
                      );
                    }
                ),
              ),
            ],
          ),
        )
    );
  }
}