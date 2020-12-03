import 'package:flutter/material.dart';
import 'package:wallpaper/tabs/WOTD/screens/home_screen/components/main.dart';
import 'package:wallpaper/tabs/WOTD/screens/home_screen/components/top_section.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    fetchWord();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TopSection(),
          Main(),
        ],
      ),
    );
  }
}