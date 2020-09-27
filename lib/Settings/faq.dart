import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text('FAQs'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body:Container(margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[ Container(child:Text("Medical Dictionary FAQs\n",textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 24.0,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                  color: Colors.red
              ),)
            ),
              Container(child:Text("1) Who is this app for?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(
                  child:Text("For healthcare ,pharmaceuticals ,physicians ,hospital nurses ,medical students ,nursing professionals ,pharmacy,physician assistants and for students who work in clinical practice and dispensary.\n",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),)
              ),
              Container(child:Text("2) How this app is useful?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(child:Text("With detailed information on 12000s of diseases and probable prescription drug info,this app is a free medical encyclopedia guide.\n",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("3) Which devices can I use?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(child:Text("You can use this app in any Android device.\n ",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("4) How it is different from other medical dictionary app?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(child:Text("Medical dictionary is  different from other applications  because it is an app in which user can search about any disease and get a detailed information about its description, causes ,overview. Also user can search about any medicine and get the information about the condition in which it is used. User can also make personal notes for future uses. And also user can calculate Body Mass Index of anyone to take care of his body weight. And last thing ,User can get new and mind blowing facts and hacks related to health and fitness daily to keep them motivated.\n ",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("5) Why can't I hear the audio pronunciations?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(child:Text("First, please check that your device is not muted. If you are not sure how to unmute your device, please refer to your device's user manual for more information.\n "
                  "Also, please check to make sure that you are connected to the Internet. Though the app allows you to look up words independently of a network connection, a network connection is required to access the graphical illustrations, audio pronunciations, voice search, and Word of the Day.\n",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("6) Why use apps when I can use Google?",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
              Container(child:Text("It’s quite likely that a lot of the information available in a medical dictionary app is probably also available via Google search – and for free at that.\n"
                  "But there are many reasons why having your medical dictionary information contained in an app is beneficial.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Column(
                children: <Widget>[
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Ease of use – apps are designed to provide a simple, easy and hassle free experience for the user.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Save time – the information is right there – so you don’t need to trawl through half a dozen websites in order to find what you need.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Free updates – the content should be updated regularly, so you can be confident your information is always current.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Quality source – if you choose an app from a high-quality publisher there’s a good change it will be accurate and reliable.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                  ),
                  new ListTile(
                    leading: new MyBullet(),
                    title: new Text('Convenience – the information is available at your fingertips, literally.',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),),
                  )
                ],
              ),
              Container(child:Text("Note : If you have any query related to our app then you can contact us on dhwani1896@gmail.com.We will try to respond as quickly as possible,but it may take a while.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.red
                ),)
              ),
            ],),) );
  }
}
class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(margin:EdgeInsets.all(10.0),
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}