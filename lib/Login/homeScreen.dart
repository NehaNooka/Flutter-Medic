import 'package:flutter/material.dart';
import 'package:wallpaper/Login/customButton.dart';
import 'package:wallpaper/Login/fadeAnimation.dart';
import 'package:wallpaper/LoginScreen/loginScreen.dart';
import 'package:wallpaper/LoginScreen/resetPassword.dart';
import 'package:wallpaper/LoginScreen/signUpScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/login/first.jpg", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(
                        2.4,
                        Text("Welcome to",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: 6))),
                    FadeAnimation(
                        2.6,
                        Text("Medic.",
                            style: TextStyle(
                                color: Colors.teal,
                                fontSize: 75,
                                fontWeight: FontWeight.bold))),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(
                        2.8,
                        CustomButton(
                          label: "REGISTER",
                          background: Colors.transparent,
                          fontColor: Colors.white,
                          borderColor: Colors.white,
                            onTap:  () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            }
                        )),
                    SizedBox(height: 20),
                    FadeAnimation(
                        3.2,
                        CustomButton(
                          label: "LOGIN",
                          background: Colors.white,
                          borderColor: Colors.white,
                          fontColor: Color(0xFFF001117),
                            onTap:  () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            }
                        )),
                    SizedBox(height: 30),
                    FadeAnimation(
                        3.2,
                        CustomButton(
                          label: "FORGOT PASSWORD",
                          background: Colors.white,
                          borderColor: Colors.white,
                          fontColor: Color(0xFFF001117),
                          onTap:  () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResetPassword()));
                          }
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
