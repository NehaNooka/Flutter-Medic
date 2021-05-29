import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation:0.0,
          iconTheme: new IconThemeData(color: Colors.black87),
          backgroundColor: appBarColor,
          title: Text("APP INFO",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 24.0,
                      color: appBarTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
        ),

        body: Container(
          margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.only(left: 90, right: 90,bottom: 10),
                padding: EdgeInsets.all(8),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: cardColor1,
                    border: Border.all(
                        color: cardColor1, // set border color
                        width: 2.0), // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(20.0)), // set rounded corner radius
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10, color: cardColor1, offset: Offset(1, 3))
                    ] // make rounded corner of border
                ),
                child: Text("ABOUT APP",
                  style: GoogleFonts.aldrich(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                    fontWeight: FontWeight.w800,
                      color: Colors.black87,
                  ),
                ),
              ),
              Divider(),

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:  cardColor1,
                  border: Border.all(
                      color: cardColor1, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), // set rounded corner radius
                ),
                child: Text("A free Medical App on medical diseases, medicines, news, quiz and discover detailed definitions, signs and symptoms, diagnosis, causes. With detailed information on over 14000  diseases and probable prescription drug info,this app is free medical encyclopedia guide.An  disease dictionary with medical conditions ranging from ebola to acne.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.aldrich(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
              Divider(),

              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: cardColor1,
                  border: Border.all(
                      color: cardColor1, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), // set rounded corner radius
                ),
                child: Text("App Features: \n* A FREE to download Medic on illness conditions and diseases. \n* A handy free pocket guide for physicians desk reference. \n* Find detailed information on illness, definitions, references and medical guideline for reading and research.\n* Also there are additional features like Note Functionality, BMI calculator, Word of the day, Latest news, Quiz on medical fields and medical facts.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.aldrich(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,

                      color: Colors.white,
                  ),
                ),

              ),

Divider(),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:  cardColor1,
                  border: Border.all(
                      color: cardColor1, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), // set rounded corner radius
                ),
                child: Text("Who can use this free Medic: \n \n For Normal person to healthcare, pharmaceuticals, physicians, hospital nurses, medical students, nursing professionals, pharmacy, physician assistants and for students who work in clinical practice and dispensary.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.aldrich(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,

                      color: Colors.white
                  ),
                ),

              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: cardColor1,
                  border: Border.all(
                      color: cardColor1, // set border color
                      width: 3.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(30.0)), // set rounded corner radius
                ),
                child: Text("DISCLAIMER: \nThis app cannot and should not replace a pharmacist or a doctor consultation.The app content is for pocket reference and educational purpose only. Consult a doctor before using any of the information from this app.",
                  textDirection: TextDirection.ltr,
                  style: GoogleFonts.aldrich(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,

                      color: Colors.white
                  ),
                ),

              ),
            ], ),
        ),
    );
  }
}
