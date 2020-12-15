import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class hwtChart1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          elevation:0.0,
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("WOMEN",
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

                        child: Text('Height',style: TextStyle(fontSize:22.0, color: Colors.red, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Container( child: Text('Weight',style: TextStyle(fontSize: 22.0, color: Colors.red, fontWeight: FontWeight.bold))))),

                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('Inches(cm)',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('Kilograms',style: TextStyle(fontSize: 22.0, color: Colors.red, fontWeight: FontWeight.bold)))),
                  ),

                ]),

                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’6”(137)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('28.5 - 34.9',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’7”(140)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('30.8 - 37.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),

                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’8”(142)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('32.6 - 39.9',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’9”(145)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('34.9 - 42.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’10”(147)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('36.4 - 44.9',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('4’11”(150)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text("39 - 47.6",style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’0”(152)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('40.8 - 49.9',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’1”(155)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('43.1 - 52.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’2”(157)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('44.9 - 54.9 ',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’3”(160)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('57.2 - 57.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’4”(163)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('49 - 59.9',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’5”(165)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('51.2 - 62.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’6”(168)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('53 - 64.8',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’7”(170)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('55.3 - 67.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),


                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’8”(173)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('57.1 - 69.8',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500))),
                    ),
                  ),

                ]),

                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’9”(175)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('59.4 - 72.6',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),
                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’10”(178)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('61.2 - 74.8',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),

                ]),TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('5’11”(80)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('63.5 - 77.5',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500)))),
                  ),


                ]),
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container( child: Text('6’0”(83)',style: TextStyle(fontSize:22.0,color: Colors.deepPurple, fontWeight: FontWeight.bold))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Container( child: Text('65.3 - 79.8',style: TextStyle(fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w500))),
                    ),
                  ),

                ]),
              ],
            ),
          ),
        )
    );}
}