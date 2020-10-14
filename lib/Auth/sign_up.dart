import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:wallpaper/Auth/email_login.dart';
import 'package:wallpaper/Auth/email_signup.dart';


class SignUp extends StatelessWidget {
  final String title = "Sign Up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Color(0xFF0A0E21),
          body: Container(
            color: Color(0xFF0A0E21),
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
                  child: RichText(
                          text: TextSpan(
                              text: 'Welcome to ',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 34),
                              children: <TextSpan>[
                                TextSpan(text: ' Medic',
                                    style: TextStyle(
                                        color: Colors.white, backgroundColor:Colors.pink,fontSize: 34),
                                )
                              ]
                          ),
                        ),

                ),
                SizedBox(
                  height: 25.0,
                ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(
                        height: 40.0,
                        child: SignInButtonBuilder(
                          text: 'Sign in with Email',
                          icon: Icons.email,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => EmailLogIn()),
                            );
                          },
                          backgroundColor: Colors.blue,
                        )


                      ),),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18),
                            children: <TextSpan>[
                              TextSpan(text: ' Register Below',
                                style: TextStyle(
                                    color: Colors.blueAccent,fontSize: 18),
                              )
                            ]
                        ),
                      ),

                    ),

                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(

                      height: 40.0,
                      child:
                      SignInButtonBuilder(
                        text: 'Register with Email',
                        icon: Icons.email,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmailSignUp()),
                          );
                        },

                        backgroundColor: Colors.blueGrey[700],
                      )




                    ),),

              ]),
            ),
          )
    );
  }
}