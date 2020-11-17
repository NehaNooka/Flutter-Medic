import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Notes/constants.dart';
import 'package:wallpaper/Notes/models/Note.dart';

class NoteCard extends StatefulWidget {
  final Note note;
  final Function onPressed;

  NoteCard({this.note, this.onPressed});

  @override
  _NoteCardState createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: EdgeInsets.symmetric(
              horizontal: kLargeMargin, vertical: kSmallMargin),
          child: ListTile(
            title: Text(widget.note.title),
            subtitle: Text(widget.note.note),
            trailing: IconButton(icon: Icon(Icons.delete, color: Colors.red,),
                onPressed: () {
                  _firestore.collection('notes').document(widget.note.id).delete();
                }

            ),
          ),
        ));
  }
}

