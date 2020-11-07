import 'package:flutter/material.dart';
import 'package:wallpaper/Login/provider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Login/sign_up_view.dart';
import 'package:wallpaper/constants.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: new IconThemeData(color: Colors.black),
          title: Text("MY ACCOUNT",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),
        body:
            FutureBuilder(
              future: Provider.of(context).auth.getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return displayUserInformation(context, snapshot);
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
        );
  }

  Widget displayUserInformation(context, snapshot) {
    final authData = snapshot.data;
ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return new Stack(
            children: <Widget>[
              ClipPath(
                child: Container(color: Colors.black.withOpacity(0.8)),
                clipper: getClipper(),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 5,
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: kSpacingUnit.w * 25,
                      width: kSpacingUnit.w * 25,

                      child: CircleAvatar(
                        radius: kSpacingUnit.w * 5,
                        backgroundImage: AssetImage('assets/login/man_avatar.png'),
                      ),
                    ),

                    SizedBox(height: kSpacingUnit.w * 0.8),
                    Container(
                      width: MediaQuery. of(context). size. width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          color: Colors.red,
                          textColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Email: ${authData.email ?? 'Anonymous'}",
                              style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                    ),
                    SizedBox(height: kSpacingUnit.w * 6),
                    Container(
                      width: MediaQuery. of(context). size. width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.green,
                            textColor: Colors.black,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Change Password",
                                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            onPressed:  () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignUpView(authFormType: AuthFormType.reset),
                                  ));
                            }
                        ),
                      ),
                    ),
                  ],
                ),
              )]  );
  }

}
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}