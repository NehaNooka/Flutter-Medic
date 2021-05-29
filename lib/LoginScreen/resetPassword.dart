import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper/LoginScreen/loginScreen.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final databaseReference = FirebaseFirestore.instance;
   final emailcontroller = new TextEditingController();
   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   String email="";
  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mail'),
          content:
          Text("Link is sent to your email ID"),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> resetPassword(String email) async {
    setState(() {
      _loading = true;
    });
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      _showMyDialog();
      setState(() {
        _loading = false;
      });
    }catch(e){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(e.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
      setState(() {
        _loading = false;
      });
    }
  }
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          body: _loading
    ? Container(
            color: Colors.white,
            child: new Center(

                child: SpinKitSquareCircle(
                  color: Colors.black38,

                  size: 100.0,
                )),
          )
        :Form(
    key: _formKey,
            child: Builder(
              builder: (context)=>
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/login/login.jpg"),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.center)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: size.height*0.20),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: size.height*0.09,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "RESET PASSWORD",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3.0,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height*0.07),
                          Container(
                            margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Enter Email Address';
                                }
                                else if(!value.contains('@')){
                                  return 'Please enter a valid email address!';
                                }
                                return null;
                              },
                              onChanged: null,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.mail,
                                  color: Colors.black,
                                ),
                                hintText: "Your Email",
                                border: InputBorder.none,
                              ),
                              controller: emailcontroller,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10,bottom: 10),
                            width: size.width * 0.85,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                            ),
                            child: FlatButton(
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                };
                               resetPassword(emailcontroller.text);},
                              child: Text(
                                "RESET PASSWORD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                              GestureDetector(
                                onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                                child: Text(
                                  " Return to Log In",
                                  style:TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                              )
                            ],
                          ),
                    ),
                  ),
            ),
          )

    );
  }
}
