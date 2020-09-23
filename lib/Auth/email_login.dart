import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/home.dart';

class EmailLogIn extends StatefulWidget {
  @override
  _EmailLogInState createState() => _EmailLogInState();
}

class _EmailLogInState extends State<EmailLogIn> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
         backgroundColor: Color(0xFF0A0E21),
          appBar: AppBar(title: Text("Login"),backgroundColor: Color(0xFF0A0E21),),
          body: Container(
      child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          color: Colors.white,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: "Enter Email Address",
                             labelStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Email Address';
                              }
                              else if(!value.contains('@')){
                                return 'Please enter a valid email address!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Container(
                          color: Colors.white,
                          child: TextFormField(
cursorColor: Colors.black,
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              labelText: "Enter Password",

                                labelStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)
                            ),
                            // The validator receives the text that the user has entered.
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Password';
                              } else if (value.length < 6) {
                                return 'Password must be atleast 6 characters!';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: isLoading
                            ? CircularProgressIndicator()
                            : RaisedButton(
                          color: Colors.pink,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              logInToFb();
                            }
                          },
                          child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18.0,fontWeight: FontWeight.bold),),
                        ),
                      )
                    ]))),
          )
    );
  }

  void logInToFb() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text)
        .then((result) {
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
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
    });
  }
}