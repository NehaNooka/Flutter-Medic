import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/Notes/components/note_card.dart';
import 'package:wallpaper/Notes/models/Note.dart';
import 'package:wallpaper/Notes/screens/note_screen.dart';

class NotesStream extends StatefulWidget {
  final Firestore _firestore;

  NotesStream({firestore}) : _firestore = firestore;

  @override
  _NotesStreamState createState() => _NotesStreamState();
}

class _NotesStreamState extends State<NotesStream> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget._firestore.collection('notes').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            ),
          );
        }

        final notes = snapshot.data.documents;
        List<NoteCard> noteCards = [];
        for (var note in notes) {
          Note noteObject =
          Note(id: note.documentID, title: note.data['title'], note: note.data['note']);
          noteCards.add(NoteCard(
            note: noteObject,
            onPressed: () {
              Navigator.pushNamed(context, NoteScreen.routeName,
                  arguments: noteObject);
            },
          ));
        }

        return Column(
          children: noteCards,
        );
      },
    );
  }
}