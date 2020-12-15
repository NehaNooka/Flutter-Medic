import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}
class _RateState extends State<Rate> {
  var myFeedbackText = "NO FEEDBACK";
  var sliderValue = 5.0;
  IconData myFeedback = FontAwesomeIcons.laugh;
  Color myFeedbackColor = Colors.green;
  var _counter=1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        title: Text("RATE US",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        backgroundColor: appBarColor,
//        actions: <Widget>[
//        ],
      ),
      body: Container(

        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Container(child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(child: Center(
                child: Text("Do you  want to rate our App?",
                  style: TextStyle(color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),),
              )),
            ),),
            SizedBox(height: 30.0),
            Container(

              child: Align(
                child: Material(
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      color: cardColor1,
                      width: 350.0,
                      height: 450.0,

                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(child: Text(myFeedbackText,
                            style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 26.0),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Icon(
                            myFeedback, color: myFeedbackColor, size: 100.0,)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Slider(
                              min: 0,
                              max: 5,
                              divisions: 5,
                              value: sliderValue,
                              activeColor: Colors.black,
                              inactiveColor: Colors.blueGrey,
                              onChanged: (newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                  if (sliderValue > 0 && sliderValue <= 1) {
                                    myFeedback = FontAwesomeIcons.sadTear;
                                    myFeedbackColor = Colors.white;
                                    myFeedbackText = "COULD BE  BETTER";
                                  }
                                  if (sliderValue >= 1.1 && sliderValue <= 2) {
                                    myFeedback = FontAwesomeIcons.frown;
                                    myFeedbackColor = Colors.white;
                                    myFeedbackText = "BELOW AVERAGE";
                                  }
                                  if (sliderValue >= 2.1 && sliderValue <= 3) {
                                    myFeedback = FontAwesomeIcons.meh;
                                    myFeedbackColor = Colors.white;
                                    myFeedbackText = "AVERAGE";
                                  }
                                  if (sliderValue >= 3.1 && sliderValue <= 4) {
                                    myFeedback = FontAwesomeIcons.smile;
                                    myFeedbackColor = Colors.white;
                                    myFeedbackText = "GOOD";
                                  }
                                  if (sliderValue >= 4.1 && sliderValue <= 5) {
                                    myFeedback = FontAwesomeIcons.laugh;
                                    myFeedbackColor = Colors.white;
                                    myFeedbackText = "EXCELLENT";
                                  }
                                });
                              },
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(child: Text(
                            "Your Rating: $sliderValue",
                            style: TextStyle(color: Colors.black,
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(
                                      35.0)),
                              color: Colors.white,
                              padding: EdgeInsets.all(15.0),
                              child: Text('Submit',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),),
                              onPressed: () {
                                bookFlight(context,);
                              },
                            ),
                          )),
                        ),
                      ],)
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void bookFlight(BuildContext context) async{
     final FirebaseAuth auth = FirebaseAuth.instance;
     final User user = await auth.currentUser;
     final uid = user.uid;
    var alertDialog = AlertDialog(
        title: Text("Thank You for feedback!!"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)))
    );

    DocumentReference documentReference = FirebaseFirestore.instance.collection(
        "Feedback").doc(uid);
    Map<String, String> feed = {" Score $_counter": sliderValue.toString()};
    _counter++;
    documentReference.set(feed).whenComplete(() {
      showDialog(
          context: context,
          builder: (BuildContext context) => alertDialog);
    }
    );
  }
}