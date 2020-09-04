import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final name;
  final symptoms;
  final causes;
  final risk;
  final overview;
  final treatment;
  final medication;

  Search(
      {Key key,
        @required this.name,
        this.symptoms,
        this.causes,
        this.risk,
        this.overview,
        this.treatment,
        this.medication})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: const Text(
          'Medical Dictionary',
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.cyan,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: new AssetImage("assets/bg.jpg"), fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(name,
                              style: TextStyle(
                                  fontSize: 30.0, color: Colors.white)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: new FloatingActionButton(
                          onPressed: () {},
                          child: IconButton(
                              icon: Icon(
                                Icons.favorite_outline_rounded,
                                color: Colors.white,
                              ),
                              onPressed: () {}),
                        ),
                      )
                    ],
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text("Overview:",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(overview,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text(" Symptoms :",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(symptoms,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text("Causes:",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(causes,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text("Risk:",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(risk,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text("Treatement:",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(treatment,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.ac_unit),
                        Text("Medication:",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(medication,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        )),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
