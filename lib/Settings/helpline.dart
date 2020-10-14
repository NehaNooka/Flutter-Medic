import 'package:flutter/material.dart';

class Helpline extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
    appBar: AppBar(
    title: Text('Helpline'),
    backgroundColor: Color(0xFF0A0E21),
    ),
    body:SingleChildScrollView(
      child: Container(

      padding: EdgeInsets.all(20.0),
      child: Table(
      border: TableBorder.all(color: Colors.white),
      children: [
      TableRow(children: [
   Padding(
       padding: const EdgeInsets.all(8.0),
       child: Text('NATIONAL EMERGENCY NUMBER',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
   ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(child: Text('112',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
        ),

      ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('POLICE',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
         ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('100',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),

        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('FIRE',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
         ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('101',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('AMBULANCE',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
         ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('102',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),

        TableRow(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Disaster Management Services',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
        ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('108',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),
        TableRow(children: [
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('Women Helpline',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
         ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1091',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Air Ambulance',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('9540161344',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Aids Helpline',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1097',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('DCP – Missing Child And Women',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1094',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Railway Enquiry',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('139',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Senior Citizen Helpline',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1091 , 1291 ',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Railway Accident Emergency Service',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1072',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Road Accident Emergency Service',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1073',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Kisan Call Centre',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1551',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Children In Difficult Situation',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1098',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Tourist Helpline',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1363 or 1800111363',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),
        TableRow(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('LPG Leak Helpline',style: TextStyle(fontSize:22.0,color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(child: Text('1906',style: TextStyle(fontSize: 22.0,color: Colors.white, fontWeight: FontWeight.w500))),
          ),

        ]),
      ],
      ),
      ),
    )
    );}
}