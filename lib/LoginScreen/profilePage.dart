import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallpaper/LoginScreen/resetPassword.dart';
import 'package:wallpaper/constants.dart';
import 'dart:math' as math;
class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  File _image;
  final databaseReference = FirebaseFirestore.instance;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  String url;
  String username, email, city, age, image;
  final usernamecontroller = new TextEditingController();
  final agecontroller = new TextEditingController();
  final citycontroller = new TextEditingController();
  final emailcontroller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void getdata() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser;
    databaseReference
        .collection("User")
        .doc(firebaseUser.uid)
        .get()
        .then((value) {
      setState(() {
        username = value.data()["username"];
        email = value.data()["email"];
        city = value.data()["city"];
        age = value.data()["age"];
        image = value.data()["photourl"];
      });
    });
  }
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    getdata();
    _controller = AnimationController(
      value: 0.0,
      duration: Duration(seconds: 25),
      upperBound: 1,
      lowerBound: -1,
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Future uploadPic() async{
      var firebaseUser = await FirebaseAuth.instance.currentUser;
      String filName = p.basename(_image.path);
      Reference reference = FirebaseStorage.instance.ref().child(
          filName);
      UploadTask uploadTask = reference.putFile(_image);

    uploadTask.whenComplete(() {
        reference.getDownloadURL().then((val) {
          setState(() {
            print("Image Uploaded");
            SnackBar(content: Text("Image Uploaded"));
            print(val);
            url = val;
          });
    });
      }).catchError((onError) {
        print(onError);
      });

      databaseReference.collection("User").doc(firebaseUser.uid).update({
        'photourl': url,
        'age': agecontroller.text != ""
            ? agecontroller.text
            : age != null
            ? age
            : "AGE",
        'city': citycontroller.text != ""
            ? citycontroller.text
            : city != null
            ? city
            : "CITY",
        'username':
        usernamecontroller.text != "" ? usernamecontroller.text : username,
        'email': emailcontroller.text != "" ? emailcontroller.text : email,
      }).then((_) {
        print("success!");
      });
    }

    Future getImage() async {
      // ignore: deprecated_member_use
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print("Image path $_image");
      });
      uploadPic();
    }
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Profile"),
            content:
            Text("Updated Successfully"),
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
    Future updatedata() async {
      var firebaseUser = await FirebaseAuth.instance.currentUser;
      setState(() {
        _showMyDialog();
      });
      databaseReference
          .collection("User")
          .doc(firebaseUser.uid)
          .update({
        'photourl': url,
        'age': agecontroller.text != ""
            ? agecontroller.text
            : age != null
                ? age
                : "AGE",
        'city': citycontroller.text != ""
            ? citycontroller.text
            : city != null
                ? city
                : "CITY",
        'username':
            usernamecontroller.text != "" ? usernamecontroller.text : username,
        'email': emailcontroller.text != "" ? emailcontroller.text : email,
      }).then((_) {
        print("success!");
      });
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment(0.5, 0.3),
          colors: [
            Colors.red,
            Colors.green,
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          iconTheme: new IconThemeData(color: Colors.black),
          centerTitle: true,
          title: Text("MY ACCOUNT",
              style: GoogleFonts.pacifico(
                  textStyle: TextStyle(
                      fontSize: 22.0,
                      color: appBarTextColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2))),
          backgroundColor: appBarColor,
        ),
        body: Stack(
            children: [
            AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return ClipPath(
                clipper: DrawClip(_controller.value),
                child: Container(
                  height: size.height * 0.5,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [Colors.deepOrange[300], Colors.lightBlue[200]]),
                  ),
                ),
              );
            },
          ), Form(
                key: _formKey,
            child: SingleChildScrollView(

            child:Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 60,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 90,
                        child: ClipOval(
                          child: new SizedBox(
                            width: 180.0,
                            height: 180.0,
                            child: (_image!=null)?Image.file(
                              _image,
                              fit: BoxFit.fill,
                            ):(image!=null)?Image.network(image,fit: BoxFit.fill,): new Image.asset("assets/login/man_avatar.png", fit:BoxFit.fill)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 60.0, right: 30),
                      child: IconButton(
                        icon: Icon(
                          FontAwesomeIcons.camera,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImage();
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextFormField(
                     keyboardType: TextInputType.name,
                    onChanged: null,
                    validator: (value) {
                     return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      hintText: username != null ?  username : "Enter full name" ,
                      border: InputBorder.none,
                    ),
                    controller: usernamecontroller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onChanged: null,
                    validator: (value) {
                       return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      hintText: email != null ? email : "Email",
                      border: InputBorder.none,
                    ),
                    controller: emailcontroller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30,bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: null,
                    validator: (value) {
                      if(int.parse(value)< 1){
                        return "Age can't be negative!";
                      }
                      else if(int.parse(value) > 140){
                        return "Please enter a valid Age!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.bolt,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      hintText: age != null ? age : "Age",
                      border: InputBorder.none,
                    ),
                    controller: agecontroller,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  padding: EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      )),
                  child: TextFormField(
                    keyboardType: TextInputType.text ,
                    onChanged: null,
                    validator: (value) {
                      if(value.contains("[0-9]")){
                        return "City must be characters only!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      icon: Icon(
                        FontAwesomeIcons.city,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      hintText: city != null ? city : "City",
                      border: InputBorder.none,
                    ),
                    controller: citycontroller,
                  ),
                ),


                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: FlatButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetPassword()));},
                        child: Text(
                          "FORGOT PASSWORD??",
                          style: GoogleFonts.aldrich(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      width: MediaQuery.of(context).size.width * 0.45,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          )),
                      child: FlatButton(
                        onPressed: () {
                          if(_formKey.currentState.validate()){
                            _formKey.currentState.save();
                            updatedata();
                          };

                        },
                        child: Text(
                          "SUBMIT",
                          style: GoogleFonts.aldrich(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            )),])

      ),
    );
  }
}
class DrawClip extends CustomClipper<Path> {
  double move = 0;
  double slice = math.pi;
  DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * math.sin(move * slice);
    double yCenter = size.height * 0.8 + 69 * math.cos(move * slice);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}