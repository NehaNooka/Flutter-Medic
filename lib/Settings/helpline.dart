import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class Helpline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
    appBar: AppBar(
      elevation:0.0,
      centerTitle: true,
      iconTheme: new IconThemeData(color: Colors.black),
    title: Text("HELPLINE",
        style: GoogleFonts.pacifico(
            textStyle: TextStyle(
                fontSize: 22.0,
                color: appBarTextColor,
                fontWeight: FontWeight.bold,
                letterSpacing: 2))),
    backgroundColor: appBarColor,
    ),
    body:SingleChildScrollView(
      child: Container(
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.symmetric(inside: BorderSide(color: Colors.black54)),
          children: [
      TableRow(children: [
   Padding(
       padding: const EdgeInsets.all(8.0),
       child: Container(
            
           child: Text('NATIONAL EMERGENCY NUMBER',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
   ),
    Padding(
            padding: const EdgeInsets.all(8.0),
                child: Center(child: Container( child: Text('112',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500))))),

      ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( child: Text('POLICE',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
         ),
Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('100',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),

        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( child: Text('FIRE',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
         ),
    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('101',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( child: Text('AMBULANCE',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
         ),
     Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('102',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),

        TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container( child: Text('Disaster Management Services',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
        ),
  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('108',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Container( child: Text('Women Helpline',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
         ),
    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1091',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Air Ambulance',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
 Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('9540161344',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Aids Helpline',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1097',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('DCP – Missing Child And Women',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
 Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1094',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Railway Enquiry',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('139',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Senior Citizen Helpline',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
    Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1091 , 1291 ',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Railway Accident Emergency Service',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1072',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Road Accident Emergency Service',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1073',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Kisan Call Centre',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1551',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),
        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Children In Difficult Situation',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
         Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1098',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('Tourist Helpline',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1363 or 800111363',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500)))),
            ),


        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container( child: Text('LPG Leak Helpline',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Container( child: Text('1906',style: GoogleFonts.aldrich(fontSize: 22.0,color: Colors.red, fontWeight: FontWeight.w500))),
            ),
          ),

        ]),
      ],
      ),
      ),
    )
    );}
}