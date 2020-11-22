import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper/LoginScreen/loginScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final databaseReference = Firestore.instance;
  final usernamecontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Register'),
          content:
          Text("Verify your email first and then login"),
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
  Future signup(BuildContext context) async {
    try{

      FirebaseUser user;
      AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
      user = result.user;
      await user.sendEmailVerification();
      await databaseReference.collection("User")
          .document(user.uid)
          .setData({
        'email':emailcontroller.text,
        'password':passwordcontroller.text,
        'username': usernamecontroller.text,
        'photourl':null,
      });
      _showMyDialog();
    }catch(e){
      print(e);
    }
  }
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Scaffold(
          body: Container(
          child: _loading
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
                              "SIGN UP",
                              style: TextStyle(
                                color: Colors.black,
                                letterSpacing: 3.0,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30,right: 30,top: 20,bottom: 10),
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                            ),
                            child: TextField(
                              onChanged: null,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: "Username",
                                border: InputBorder.none,
                              ),
                              controller: usernamecontroller,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                            ),
                            child: TextField(
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
                            margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
                            padding: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                )
                            ),
                            child: TextField(
                              onChanged: null,
                              obscureText: visible == false ? true : false,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock,
                                  color: Colors.black,
                                ),
                                hintText: "Password",
                                border: InputBorder.none,
                                suffixIcon: _visible(),
                              ),
                              controller: passwordcontroller,
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

                                signup(context);},
                              child: Text(
                                "SIGNUP",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Already have an account??  ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17,fontWeight:FontWeight.bold)),
                              GestureDetector(
                                onTap: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));},
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
            ),
          )
      ),
    )));
  }

  _visible() {
    return GestureDetector(
      onTap: ()
      {
        setState(() {
          visible = ! visible;
        });
      },
      child: visible==true? Icon(
        Icons.visibility_off,
        color: Colors.black,
      ):Icon(
        Icons.visibility,
        color: Colors.black,
      ),
    );
  }
}