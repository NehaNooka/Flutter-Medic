import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/constants.dart';

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    'https://i.pinimg.com/474x/39/fc/4b/39fc4b6d914f5b23d997d293d8b6b008.jpg',
   'https://i.pinimg.com/474x/6b/fe/0d/6bfe0d7ba6c04c617fc2b9404ecdc6bd.jpg',
    'https://i.pinimg.com/474x/72/f4/a3/72f4a3e0184c52f1ed318a0e807d5d92.jpg',
    'https://i.pinimg.com/474x/ee/7a/59/ee7a595952cb74a244947258c17b27b0.jpg',
    'https://i.pinimg.com/474x/b7/85/b5/b785b5dd2cf3ca337e5235dab21f46af.jpg',
    'https://i.pinimg.com/474x/ff/a8/dc/ffa8dcda4d0c9db4d1eaf0a4fb11ab62.jpg',
    'https://i.pinimg.com/474x/a2/fe/c8/a2fec8ca31be296c0435f0f283cbcabf.jpg',
    'https://i.pinimg.com/474x/b5/d1/d5/b5d1d51217c2e290874cabaf02f1b419.jpg',
    'https://i.pinimg.com/474x/84/5c/a4/845ca4ae1cc277329683e3274c4f3625.jpg',
    'https://i.pinimg.com/474x/cf/c5/59/cfc5593318571f9ca06a72ad95f7d322.jpg',
'https://i.pinimg.com/474x/b9/71/86/b971862b96ed2a2f921b123050864a6a.jpg',
    'https://i.pinimg.com/474x/1e/b6/8d/1eb68d535196a04508c9f4db660a7f3f.jpg',
    'https://i.pinimg.com/474x/00/28/88/002888b2341788f697e1a3565fb7326a.jpg',
    'https://i.pinimg.com/474x/ea/52/84/ea52844c6d39f99aea593340fb2b621f.jpg',
    'https://i.pinimg.com/474x/12/d5/7f/12d57f21554ba285267e534cc52b5d17.jpg',
     'https://i.pinimg.com/474x/28/64/aa/2864aa0abdb088b6620b536ac15ce26d.jpg',
    'https://i.pinimg.com/474x/48/d1/81/48d1814bc7964517c307aeea97580e7f.jpg',
    'https://i.pinimg.com/474x/61/00/0a/61000a5a065062a198500cc645731fb3.jpg',
'https://i.pinimg.com/474x/5a/15/f5/5a15f5c89260cda9c182cd258bf2a966.jpg',
    'https://i.pinimg.com/474x/76/32/a6/7632a6441017f86f460597fc5f675102.jpg',
    'https://i.pinimg.com/474x/b6/59/a0/b659a01b4df6e5f5b07d0d310c8af4ef.jpg',
    'https://i.pinimg.com/474x/28/73/64/28736444fa2022192177d3cde432477f.jpg',
    'https://i.pinimg.com/474x/ef/02/07/ef020785ff151bf3344619fefb5d9ade.jpg',
'https://i.pinimg.com/474x/33/dd/3a/33dd3a941cb9a68c1a8b436f0bddc6d2.jpg',
    'https://i.pinimg.com/474x/63/93/34/639334d690b2214797a7409c07d7b8e0.jpg',
'https://i.pinimg.com/474x/c8/41/f2/c841f2dbf59fb142210e01131b326886.jpg',

  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        backgroundColor: appBarColor,
        title: Text("FACTS",
            style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                    fontSize: 24.0,
                    color: appBarTextColor,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2))),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            carouselSlider = CarouselSlider(
              height: MediaQuery.of(context).size.height*0.65,
              initialPage: (imgList.length==null) ? Container(
                color: Colors.white,
                child: new Center(

                    child: SpinKitSquareCircle(
                      color: Colors.black38,

                      size: 100.0,
                    )),
              ) : 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              onPageChanged: (index) {
                setState(() {
                  _current = index;
                });
              },
              items: imgList.map((imgUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                      ),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? appBarTextColor : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  color: Colors.grey,
                  onPressed: goToPrevious,
                  child: Text("<-" ,style:TextStyle(fontSize: 30,color:appBarTextColor,fontWeight:FontWeight.bold)),
                ),
                OutlineButton(
                  color: Colors.grey,
                  onPressed: goToNext,
                  child: Text("->",style:TextStyle(fontSize: 30,color:appBarTextColor,fontWeight:FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
