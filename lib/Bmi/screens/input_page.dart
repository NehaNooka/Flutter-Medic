import 'package:flutter_responsive_screen/flutter_responsive_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Bmi/Extras/animate_button.dart';
import 'package:wallpaper/Bmi/Extras/app_util.dart';
import 'package:wallpaper/Bmi/Extras/globals.dart';
import 'package:wallpaper/Bmi/Extras/size_transition.dart';
import 'package:wallpaper/Bmi/screens/results_page.dart';
import 'package:wallpaper/constants.dart';
import '../calculator_brain.dart';
import '../constants.dart';


enum GenderEnum {
  Male,
  Female,
}

class BMIMain extends StatefulWidget {
  @override
  _BMIMainState createState() => _BMIMainState();
}

class _BMIMainState extends State<BMIMain> with SingleTickerProviderStateMixin {
  var btnVisibility = 1.0;
  GenderEnum selectedGender;
  // Icon icon = Icon(FontAwesomeIcons.solidSun);

  AnimationController _controller;

  @override
  initState() {
    super.initState();
    // isDarkTheme = false;

    _controller = new AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedChoice == "Centimetre")
      isCentSelected = false;
    else
      isCentSelected = true;

    return
   Scaffold(
       appBar: AppBar(
         centerTitle: true,
         elevation:0.0,
         backgroundColor: appBarColor,
         title: Text("BMI",
             style: GoogleFonts.pacifico(
                 textStyle: TextStyle(
                     fontSize: 24.0,
                     color: appBarTextColor,
                     fontWeight: FontWeight.bold,
                     letterSpacing: 2))),
       ),

       // drawer: Drawer(),
          body: SafeArea(
            child: Container(
                child: Stack(
                  children: <Widget>[
                    SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 74.0),
                      child: Column(
                        children: <Widget>[
                          // Male/Female selection
                          new  Container(

                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[new Male(), new Female()],
                                ),
                              ),
                          new Height(),
                          new Gender(),
                        ],
                      ),
                    ),
                    AnimatedLoader(
                      animation: _controller,
                      // alignment: FractionalOffset.center,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                        alignment: Alignment.bottomCenter,
                        child: MaterialButton(
                          child: Text(
                            'Calculate'.toUpperCase(),
                            style: TextStyle(
                                color: Color(0xFF013487),
                                fontSize: 16.0,
                                letterSpacing: 1),
                          ),
                          color: Color.fromRGBO(179, 157, 219, 0.4),
                          elevation: 0.0,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          minWidth: 215.0,
                          height: 62.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                      padding: EdgeInsets.all(11.0),
                      child: MaterialButton(
                        child: Text(
                          'Calculate'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontSize: 16.0, letterSpacing: 1),
                        ),
                        color: Colors.lightBlue[900],
                        elevation: 2.0,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        minWidth: 200.0,
                        height: 50.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          CalculatorBrain calc;
                          if (!isCentSelected)
                            calc = CalculatorBrain(height: heightCal, weight: weight);
                          else {
                            calc = CalculatorBrain(
                                height: AppUtil.feetInchToCM(feetValue, inchValue),
                                weight: weight);
                          }
                          Navigator.push(
                              context,
                              SizeRoute(
                                  page: ResultPage(
                                    bmiResult: calc.calculateBMI(),
                                    resultText: calc.getResult(),
                                    resultTextStyle: calc.resultTextStyle(calc.getResult()),
                                    interpretation: calc.getInterpretation(),
                                  )));
                        },
                      ),
                    ),
                  ],
                )),
          )

    );
  }
}

class Male extends StatefulWidget {
  @override
  _MaleState createState() => _MaleState();
}

class _MaleState extends State<Male> {
  void decreaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (age > 1) {
          age--;
        } else {}
      });

      decreaseAge();
    }
    loopActive = false;
  }

  void increaseAge() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        age++;
      });

      increaseAge();
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
         height: MediaQuery.of(context).size.height *0.25,
          width: MediaQuery.of(context).size.width *0.45,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow[700], borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Age (In Year)',
                    style: TextStyle(
                      fontSize: 23.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue[900]),
                  ),
                  Text(
                    age.toString(),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context).buttonColor,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.minus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  if (age > 1) {
                                    age--;
                                  }
                                });
                              },
                              color: Colors.lightBlue[900],
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            decreaseAge();
                          },
                          onLongPressUp: () {
                            buttonPressed = false;
                          },
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context).buttonColor,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.plus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              color: Colors.lightBlue[900],
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            increaseAge();
                          },
                          onLongPressUp: () {
                            buttonPressed = false;
                          },
                        )
                      ])
                ],
              ),

          ),
        ),
      ),
    );
  }
}

class Female extends StatefulWidget {
  @override
  _FemaleState createState() => _FemaleState();
}

class _FemaleState extends State<Female> {
  void decreaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        if (weight > 5) {
          weight--;
        }
      });

      decreaseWeight();
    }
    loopActive = false;
  }

  void increaseWeight() async {
    if (loopActive) return;

    loopActive = true;

    while (buttonPressed) {
      setState(() {
        weight++;
      });

      increaseWeight();
    }
    loopActive = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
            height: MediaQuery.of(context).size.height *0.25,
            width: MediaQuery.of(context).size.width *0.45,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[700], borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Weight (Kg)',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.lightBlue[900]),
                  ),
                  Text(
                    weight.toString(),
                    style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context).buttonColor,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.minus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  if (weight > 5) {
                                    weight--;
                                  }
                                });
                              },
                              color: Colors.lightBlue[900],
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            decreaseWeight();
                          },
                          onLongPressUp: () {
                            buttonPressed = false;
                          },
                        ),
                        GestureDetector(
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Theme.of(context).buttonColor,
                            child: IconButton(
                              icon: Icon(FontAwesomeIcons.plus,
                                  color: Theme.of(context).iconTheme.color),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              color: Colors.lightBlue[900],
                            ),
                          ),
                          onLongPressStart: (details) {
                            buttonPressed = true;
                            increaseWeight();
                          },
                          onLongPressUp: () {
                            buttonPressed = false;
                          },
                        )
                      ])
                ],
              ),
            )),
      ),
    );
  }
}

class Height extends StatefulWidget {
  @override
  _HeightState createState() => _HeightState();
}

class _HeightState extends State<Height> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height *0.25,
        width: MediaQuery.of(context).size.width *0.95,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.yellow[700], borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  lengthSwitch(),
                  handleSizeUI(),
                ],
              )),
        ),
      ),
    );
  }

  Widget handleSizeUI() {
    if (!isCentSelected)
      return centimeterView();
    else
      return feetInchView();
  }

//* Length unit switch (Centimetre or Ft)
  Widget lengthSwitch() {
    return Container(
      margin: EdgeInsets.fromLTRB(200.0, 10.0, 0.0, 0.0),
      height: 25.0,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(237, 231, 246, 1),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'cm',
            style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.lightBlue[900]),
          ),
          Switch(
            value: isCentSelected,
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedChoice = "Feet-Inch";
                else
                  selectedChoice = "Centimetre";
                isCentSelected = value;
              });
            },
            inactiveTrackColor: Color.fromRGBO(209, 196, 233, 1),
            inactiveThumbColor: Colors.lightBlue[900],
            activeTrackColor: Color.fromRGBO(209, 196, 233, 1),
            activeColor: Colors.lightBlue[900],
            materialTapTargetSize: MaterialTapTargetSize.padded,
          ),
          Text(
            'ft',
            style: TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
                color: Colors.lightBlue[900]),
          ),
        ],
      ),
    );
  }

//* CentimeterView
  Widget centimeterView() {
    return AnimatedOpacity(
      opacity: !isCentSelected ? 1.0 : 0.0,
      child: Container(

        height:  MediaQuery.of(context).size.height*0.19,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Height(cm)',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 28.0,
                  color: Colors.lightBlue[900]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Text(
                  heightCal.toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.grey.shade300,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.lightBlue[900],
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
              ),
              child: Slider(
                value: heightCal.toDouble(),
                min: minHeight,
                max: maxHeight,
                onChanged: (double newValue) {
                  setState(() {
                    heightCal = newValue.round();
                  });
                },
              ),
            )
          ],
        ),
      ),
      curve: Curves.easeOutQuart,
      duration: Duration(milliseconds: 4000),
    );
  }

  Widget feetInchView() {
    return AnimatedOpacity(
      opacity: isCentSelected ? 1.0 : 0.0,
      child: Container(
        height:  MediaQuery.of(context).size.height*0.19,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
        child: Column(
          children: <Widget>[
            Text(
              'Height(ft)\n',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                  color: Colors.lightBlue[900]),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 70.0,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<int>(
                    isDense: true,
                    value: feetValue,
                    hint: Text('ft'),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.lightBlue[900],
                    ),
                    iconSize: 24,
                    elevation: 16,
                    // isExpanded: true,
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (int newValue) {
                      setState(() {
                        feetValue = newValue;
                      });
                    },
                    items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 70.0,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: DropdownButton<String>(
                    isDense: true,
                    value: inchValue,
                    hint: Text('in'),
                    icon: Icon(
                      Icons.arrow_downward,
                      color: Colors.lightBlue[900],
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black),
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        inchValue = newValue;
                      });
                    },
                    items: <String>[
                      '0"',
                      '1"',
                      '2"',
                      '3"',
                      '4"',
                      '5"',
                      '6"',
                      '7"',
                      '8"',
                      '9"',
                      '10"',
                      '11"',
                      '12"'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20.0),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      curve: Curves.easeOutQuart,
      duration: Duration(milliseconds: 4000),
    );
  }
}

class Gender extends StatefulWidget {
  @override
  _GenderState createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(6.0, 5.0, 6.0, 0.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height *0.22,
        width: MediaQuery.of(context).size.width *0.95,
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow[700], borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
            width: MediaQuery.of(context).size.height,
            height: Screen(MediaQuery.of(context).size).hp(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'Gender',
                  style: TextStyle(
                    fontSize: 28.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.lightBlue[900]),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'I\'m',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      Text(
                        'Female',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        inactiveTrackColor: Colors.grey.shade300,
                        inactiveThumbColor: Colors.lightBlue[900],
                        activeTrackColor: Colors.grey.shade300,
                        activeColor: Colors.lightBlue[900],
                      ),
                      Text(
                        'Male',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      ),
                    ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}