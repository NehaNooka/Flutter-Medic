import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
class Rate extends StatefulWidget {
  @override
  _RateState createState() => _RateState();
}
class _RateState extends State<Rate> {
  var myFeedbackText = "NO FEEDBACK";
  var sliderValue = 5.0;
  IconData myFeedback = FontAwesomeIcons.laugh;
  Color myFeedbackColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: AppBar(
        elevation:0.0,
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
            SizedBox(height:30.0),
            Container(child:Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(child: Text("Do you want to rate our App?",
                style: TextStyle(color: Colors.black, fontSize: 28.0,fontWeight:FontWeight.bold),)),
            ),),
            SizedBox(height:30.0),
            Container(

              child: Align(
                child: Material(
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      color: Colors.yellow[800],
                      width: 350.0,
                      height: 380.0,

                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(child: Text(myFeedbackText,
                            style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold,fontSize: 26.0),)),
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
                              activeColor: Colors.deepPurple,
                              inactiveColor: Colors.blueGrey,
                              onChanged: (newValue) {
                                setState(() {
                                  sliderValue = newValue;
                                  if (sliderValue > 0 && sliderValue <= 1) {
                                    myFeedback = FontAwesomeIcons.sadTear;
                                    myFeedbackColor = Colors.blueGrey;
                                    myFeedbackText = "COULD BE MUCH BETTER";
                                  }
                                  if (sliderValue >= 1.1 && sliderValue <= 2) {
                                    myFeedback = FontAwesomeIcons.frown;
                                    myFeedbackColor = Colors.redAccent;
                                    myFeedbackText = "BELOW AVERAGE";
                                  }
                                  if (sliderValue >= 2.1 && sliderValue <= 3) {
                                    myFeedback = FontAwesomeIcons.meh;
                                    myFeedbackColor = Colors.pinkAccent;
                                    myFeedbackText = "AVERAGE";
                                  }
                                  if (sliderValue >= 3.1 && sliderValue <= 4) {
                                    myFeedback = FontAwesomeIcons.smile;
                                    myFeedbackColor = Colors.lightBlue;
                                    myFeedbackText = "GOOD";
                                  }
                                  if (sliderValue >= 4.1 && sliderValue <= 5) {
                                    myFeedback = FontAwesomeIcons.laugh;
                                    myFeedbackColor = Colors.teal;
                                    myFeedbackText = "EXCELLENT";
                                  }
                                });
                              },
                            ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(child: Text("Your Rating: $sliderValue",
                            style: TextStyle(color: Colors.black, fontSize: 22.0,fontWeight:FontWeight.bold),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RaisedButton(
                              shape:RoundedRectangleBorder(borderRadius: new BorderRadius.circular(35.0)),
                              color: Colors.pink,
                              padding: EdgeInsets.all(15.0),
                              child: Text('Submit',
                                style: TextStyle(fontSize: 25.0,color: Colors.white),),
                              onPressed: () {
                                bookFlight(context);
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
  void bookFlight(BuildContext context) {
    var alertDialog = AlertDialog(
        title:Text("Thank You for feedback!!"),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)))
    );
    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog);
  }
}