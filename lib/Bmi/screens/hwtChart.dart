import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class hwtChart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation:0.0,
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("MEN",
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

                        child: Text('Height',style: GoogleFonts.aldrich(fontSize:22.0, color: Colors.red, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Container( child: Text('Weight',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.red, fontWeight: FontWeight.bold))))),

                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('Inches(cm)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('Kilograms',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.red, fontWeight: FontWeight.bold)))),
                  ),

                ]),

                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’6”(137)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('28.5 - 34.9',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’7”(140)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('30.8 - 38.1',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),

                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’8”(142)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('33.5 - 40.8',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’9”(145)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('35.8 - 43.9',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’10”(147)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('38.5 - 46.7',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’11”(150)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text("40.8 - 49.9",style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’0”(152)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('41.1 - 53',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’1”(155)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('45.8 - 55.8',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’2”(157)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('48.1 - 58.9 ',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’3”(160)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('50.8 - 60.1',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’4”(163)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('50.0 - 64.8',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’5”(165)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('55.3 - 68',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’6”(168)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('58 - 70.7',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’7”(170)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('60.3 - 73.9',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),


                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’8”(173)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('63 - 70.6',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500))),
                    ),
                  ),

                ]),

        TableRow(children: [
                Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container( child: Text('5’9”(175)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: Container( child: Text('65.3 - 79.8',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
    ),
    ]),TableRow(children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container( child: Text('5’10”(178)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: Container( child: Text('67.6 - 83',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
    ),

    ]),TableRow(children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container( child: Text('5’11”(80)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: Container( child: Text('70.3 - 85.7',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
    ),


    ]),
    TableRow(children: [
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container( child: Text('6’0”(83)',style: GoogleFonts.aldrich(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
    ),
    Padding(
    padding: const EdgeInsets.all(8.0),
    child: Center(child: Container( child: Text('72.6 - 88.9',style: GoogleFonts.aldrich(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500))),
    ),
    ),

    ]),
              ],
            ),
          ),
        )
    );}
}