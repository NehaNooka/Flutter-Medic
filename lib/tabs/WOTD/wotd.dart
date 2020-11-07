import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/WOTD/models/saved_words.dart';
import 'package:wallpaper/tabs/WOTD/screens/home_screen/home_screen.dart';
import 'package:wallpaper/tabs/WOTD/screens/past_words/past_words.dart';



class Wotd extends StatefulWidget {
  static final _savedWords = SavedWords.savedWords;
  @override
  _WotdState createState() => _WotdState();
}

class _WotdState extends State<Wotd> with SingleTickerProviderStateMixin{
  TabController _tabController;
  var _savedWords = Wotd._savedWords;
  void _openFavouriteWords() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                iconTheme: new IconThemeData(color: Colors.black),
                centerTitle: true,
                title: Text("FAVOURITES",
                    style: GoogleFonts.pacifico(
                        textStyle: TextStyle(
                            fontSize: 22.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)))),
            body: Container(
              child: _savedWords.length != 0
                  ? ListView(
                children: _savedWords
                    .map(
                      (word) => Padding(
                    padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                    child: Text(
                      '${word[0].toUpperCase()}${word.substring(1)}',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                )
                    .toList(),
              )
                  : Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'No favorite words! Click the heart on a word card to add some!',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  @override
  void initState() {
    _tabController = new TabController(length: 2,vsync:this);
    super.initState();
  }

  PageController _controller = PageController(
      initialPage: 1,
      viewportFraction: 0.8
  );
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text("WORD OF THE DAY",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: _openFavouriteWords,
          ),
        ],
        backgroundColor: appBarColor,
        bottom: TabBar(
          unselectedLabelColor: Colors.black26,
          labelColor: Colors.black,
          tabs: [
            new Tab(
              icon: Icon(
                Icons.calendar_today,
              ),
            ),
            new Tab(
              icon: FaIcon(
                FontAwesomeIcons.calendarWeek,
              ),
            ),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorSize: TabBarIndicatorSize.tab,),
        bottomOpacity: 1,
      ),


      body: TabBarView(
        children: [
          Home(),
          PastWords(),
        ],
        controller: _tabController,),

    );
  }
}
