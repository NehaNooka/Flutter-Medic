import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/Dashboard/News/details.dart';
import 'package:wallpaper/constants.dart';
import 'package:wallpaper/home.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List data;

  @override
  void initState() {
    super.initState();
    fetch_data_from_api();
  }

  // ignore: non_constant_identifier_names
  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(
        "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=4a4d2dbf973841c99975594e64acad76"
      //"https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=4a4d2dbf973841c99975594e64acad76"
    );
    var fetchdata = jsonDecode(jsondata.body);
    setState(() {
      data = fetchdata["articles"];
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Scaffold(
            appBar: AppBar(
              elevation:0.0,
              iconTheme: new IconThemeData(color: Colors.black),
              centerTitle: true,
              leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,),
                onPressed: ( () {
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

            body: Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsPage(
                                author: data[index]["author"],
                                title: data[index]["title"],
                                description: data[index]["description"],
                                urlToImage: data[index]["urlToImage"],
                                publishedAt: data[index]["publishedAt"],
                              )));
                    },
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(35.0),
                              topRight: Radius.circular(35.0),
                            ),
                            child: Image.network(
                              data[index]["urlToImage"],
                              fit: BoxFit.cover,
                              height: 400.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                          child: Container(
                            height: 150.0,
                            width: 300.0,
                            child: Material(
                              borderRadius: BorderRadius.circular(35.0),
                              elevation: 10.0,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        20.0, 20.0, 10.0, 20.0),
                                    child: Text(
                                      data[index]["title"],
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: data == null ? 0 : data.length,
                autoplay: true,
                viewportFraction: 0.8,
                scale: 0.9,
              ),
            )));
  }
}