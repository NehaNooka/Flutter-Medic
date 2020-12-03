import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper/LoginScreen/signUpScreen.dart';
import 'package:wallpaper/home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailcontroller = new TextEditingController();
  final passwordcontroller = new TextEditingController();
  SharedPreferences prefs;
  final _formKey = GlobalKey<FormState>();
  void initState(){
    super.initState();
    FirebaseAuth.instance
        .authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  Future signin(BuildContext context) async {
    try{
      User user;
      UserCredential result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailcontroller.text, password: passwordcontroller.text);
      user = result.user;
        await FirebaseAuth.instance.currentUser;
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()),);

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
    }
  }
  bool visible = false;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Scaffold(
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
            child:
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
                              "LOG IN",
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
                            margin: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 10),
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
                                  return 'Enter Password';
                                } else if (value.length < 8) {
                                  return 'Password must be atleast 8 characters!';
                                }
                                return null;
                              },
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
                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  _formKey.currentState.save();
                                };
                                signin(context);
                              },
                              child: Text(
                                "LOGIN",
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
                              Text('Don’t have an Account ? ',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 17,fontWeight:FontWeight.bold)),
                              GestureDetector(
                                onTap:(){ Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignUpScreen()));},
                                child: Text(
                                  " Sign Up",
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

          )
      ),
    );
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