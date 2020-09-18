import 'package:flutter/material.dart';
class About extends StatelessWidget {
  //TextEditingController titleController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
// resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('App Info'),
      ),

      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 90, right: 90,bottom: 10),
              padding: EdgeInsets.all(8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.cyan[700], // set border color
                      width: 2.0), // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10, color: Colors.black, offset: Offset(1, 3))
                  ] // make rounded corner of border
              ),
              child: Text("ABOUT APP",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
            ),
            Divider(),

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                border: Border.all(
                    color: Colors.cyan[700], // set border color
                    width: 3.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: Text("A free medical dictionary on medical diseases and discover detailed definitions,signs and symptoms,diagnosis,causes.With detailed information on over 14000  diseases and probable prescription drug info,this app is free medical encyclopedia guide.An  disease dictionary with medical conditions ranging from ebola to acne.",            textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),
            ),
            Divider(),

            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.cyan[700], // set border color
                    width: 3.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: Text("App Features: \n* A FREE to download medical dictionary on illness conditions and diseases. \n* A handy free pocket guide for physicians desk reference. \n* Find detailed information on illness,definitions,references and medical guideline for reading and research.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),

            ),

Divider(),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.cyan[100],
                border: Border.all(
                    color: Colors.cyan[700], // set border color
                    width: 3.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: Text("Who can use this free medical dictionary: \n \n For healthcare,pharmaceuticals,physicians,hospital nurses,medical students,nursing professionals,pharmacy,physician assistants and for students who work in clinical practice and dispensary.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),

            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: Colors.cyan[700], // set border color
                    width: 3.0), // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
              ),
              child: Text("DISCLAIMER: \nThis app cannot and should not replace a pharmacist or a doctor consultation.The app content is for pocket reference and educational purpose only.Consult a doctor before using any of the information from this app.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                ),
              ),

            ),
          ], ),
      ), );
  }
}
