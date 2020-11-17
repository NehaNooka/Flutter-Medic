import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Notes/components/notes_stream.dart';
import 'package:wallpaper/Notes/screens/note_screen.dart';
import 'package:wallpaper/constants.dart';

class NotesScreen extends StatefulWidget {
  static final String routeName = '/';

  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: appBarColor,
        title: Text("NOTES",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
      ),
      body: ListView(
        children: <Widget>[NotesStream(firestore: _firestore)],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NoteScreen.routeName);
        },
        backgroundColor: Colors.blue[800],
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
