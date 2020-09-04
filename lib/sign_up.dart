import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:wallpaper/email_login.dart';
import 'package:wallpaper/email_signup.dart';


class SignUp extends StatelessWidget {
  final String title = "Sign Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(
          color: Colors.cyan,
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(child: Container(child: Image(image: AssetImage('assets/idea.png'),height: 100.0,width: 100.0,))),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text("Welcome to Medic",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white,
                        fontFamily: 'Roboto')),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SignInButton(
                    Buttons.Google,
                    text: "Sign up with Google",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => EmailSignUp()),
                      );
                    },

             ),),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: SignInButton(
                  Buttons.Google,

                  text: "Login with Google",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EmailLogIn()),
                    );
                  },

                ),),
            ]),
          ),
        ));
  }
}