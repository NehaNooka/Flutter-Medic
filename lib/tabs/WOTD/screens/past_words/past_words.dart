import 'package:flutter/material.dart';
import 'package:wallpaper/tabs/WOTD/screens/past_words/components/main.dart';
import 'package:wallpaper/tabs/WOTD/screens/past_words/components/top_section.dart';

class PastWords extends StatefulWidget {
  @override
  _PastWordsState createState() => _PastWordsState();
}

class _PastWordsState extends State<PastWords> {

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
