import 'package:flutter/material.dart';
import 'package:wallpaper/Login/auth_service.dart';
import 'package:wallpaper/Login/homeScreen.dart';
import 'package:wallpaper/Login/provider_widget.dart';
import 'package:wallpaper/Login/sign_up_view.dart';
import 'package:wallpaper/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        title: "Medic",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
        ),
        home: HomeController(),
        routes: <String, WidgetBuilder>{
          '/signUp': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signUp),
          '/signIn': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.signIn),
          '/home': (BuildContext context) => Home(),
          '/pswd': (BuildContext context) =>
              SignUpView(authFormType: AuthFormType.reset),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home() : HomeScreen();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
