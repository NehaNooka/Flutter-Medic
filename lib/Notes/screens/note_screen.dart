import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/Notes/constants.dart';
import 'package:wallpaper/Notes/models/Note.dart';
import 'package:wallpaper/constants.dart';

// ignore: must_be_immutable
class NoteScreen extends StatefulWidget {
  static final String routeName = '/note';
  Note note;

  NoteScreen(this.note);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {

  Note note;
  String titleString = '';
  String noteString = '';

  Firestore _firestore = Firestore.instance;

  TextEditingController controllerTitle;
  TextEditingController controllerNote;

  @override
  void initState() {
    super.initState();

    note = widget.note;
    if (note != null) {
      titleString = note.title;
      noteString = note.note;
    }

    controllerTitle =
        TextEditingController(text: note != null ? note.title : '');
    controllerNote = TextEditingController(text: note != null ? note.note : '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation:0.0,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: appBarColor,
        title: Text("ADD",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 20.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.black,
            ),
            onPressed: () {
              saveClicked();
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.black,
            ),
            onPressed: () {
              _firestore.collection('notes').document(note.id).delete();
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: kSmallMargin),
            child: TextField(
              controller: controllerTitle,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
              onChanged: (value) {
                titleString = value;
              },
            ),
          ),
          SizedBox(
            height: kSmallMargin,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(kLargeMargin),
              child: TextField(
                controller: controllerNote,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(hintText: 'Note content'),
                onChanged: (value) {
                  noteString = value;
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void saveClicked() {
    if (note == null) {
      _firestore
          .collection('notes')
          .add({'title': titleString, 'note': noteString});
    } else {
      _firestore
          .collection('notes')
          .document(note.id)
          .updateData({'title': titleString, 'note': noteString});
    }
  }
}
