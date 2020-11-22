import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/tabs/WOTD/screens/home_screen/home_screen.dart';
import 'package:wallpaper/tabs/WOTD/screens/past_words/past_words.dart';



class Wotd extends StatefulWidget {
  @override
  _WotdState createState() => _WotdState();
}

class _WotdState extends State<Wotd> with SingleTickerProviderStateMixin{
  TabController _tabController;


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
        elevation:0.0,
        centerTitle: true,
        title: Text("WORD OF THE DAY",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        actions: [
        ],
        backgroundColor: appBarColor,
        bottom: TabBar(
          unselectedLabelColor: Colors.blueGrey[400],
          labelColor: Colors.blue[900],
          tabs: [
            new Tab(
              icon: Icon(
                Icons.today ,
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
