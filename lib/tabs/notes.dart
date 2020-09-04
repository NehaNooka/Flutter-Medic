import 'package:flutter/material.dart';

class Notes1 extends StatelessWidget {
  Notes1({this.uid});
  final String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Notes());
  }
}

class Notes extends StatefulWidget {
  @override
  _NotesState createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
