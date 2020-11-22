import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wallpaper/Dashboard/NewsA/helper/news.dart';
import 'package:wallpaper/Dashboard/NewsA/helper/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';
class CategoryNews extends StatefulWidget {

  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    NewsForCategorie news = NewsForCategorie();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation:0.0,
        iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: ( () {
            Navigator.pop(context);
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
      body: _loading ? Container(
        color: Colors.white,
        child: new Center(

            child: SpinKitSquareCircle(
              color: Colors.black38,

              size: 100.0,
            )),
      ) : SingleChildScrollView(
        child: Container(
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
