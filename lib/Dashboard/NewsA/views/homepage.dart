import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper/Dashboard/NewsA/helper/widgets.dart';
import 'package:wallpaper/home.dart';
import '../helper/news.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;



  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed:  ( () {
      Navigator.pushReplacement(
      context,
      MaterialPageRoute(
      builder: (context) => Home()),
      );
      }
      ),
        ),
        title: Text("NEWS",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 22.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
        backgroundColor: appBarColor,
      ),
      body: SafeArea(
        child: _loading
            ? Container(
          color: Colors.white,
          child: new Center(

              child: SpinKitSquareCircle(
                color: Colors.black38,

                size: 100.0,
              )),
        )
            : SingleChildScrollView(
                child: Container(
                        margin: EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: newslist.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                imgUrl: newslist[index].urlToImage ?? "",
                                title: newslist[index].title ?? "",
                                desc: newslist[index].description ?? "",
                                content: newslist[index].content ?? "",
                                posturl: newslist[index].articleUrl ?? "",
                              );
                            }),

                ),
              ),
      ),
    );
  }
}

