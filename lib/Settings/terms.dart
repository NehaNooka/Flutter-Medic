import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
        appBar: AppBar(
          title: Text('Terms & Conditions'),
          backgroundColor: Color(0xFF0A0E21),
        ),
        body:Container(margin: EdgeInsets.all(20),
          child: ListView(
            children: <Widget>[
              Container(child:Text("Terms & Conditions",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.red
                ),)
              ),
              Container(child:Text(" By downloading or using the app, these terms will automatically apply to you – you should make sure  that you read them carefully before using the app. You’re not allowed to copy, or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages, or make derivative versions. The app itself, and all the trade marks, copyright, database rights and other intellectual property rights related to it, still belong to us. \n \n"
                  " The Medical Dictionary App app stores and processes personal data that you have provided to us, in order to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Medical Dictionary App app won’t work properly or at all. \n \n"
                  " The app does use third party services that declare their own Terms and Conditions.\nLink to Terms and Conditions of third party service providers used by the app\n",
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
                      title: new Text('Google play sevices',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            color: Colors.blue
                        ),),
                      onTap: () => launch('https://policies.google.com/terms')
                  ),
                  new ListTile(
                      leading: new MyBullet(),
                      title: new Text('Google Analytics for Firebase',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w500,
                            color: Colors.blue
                        ),),
                      onTap: () => launch('https://firebase.google.com/terms/analytics')

                  )
                ],
              ),
              Container(child:Text(" You should be aware that there are certain things that we will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi, or provided by your mobile network provider, but we cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left. \n"
                  " If you’re using the app outside of an area with Wi-Fi, you should remember that your terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app. \n",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("Changes to Terms and Conditions",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.red
                ),)
              ),
              Container(child:Text(" We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page. \n These terms and conditions are effective as of 2020-09-19 \n",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
              Container(child:Text("Contact us",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w500,
                    color: Colors.red
                ),)
              ),
              Container(child:Text(" If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact us at dhwani1896@gmail.com.",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 18.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),)
              ),
            ],),) );
  }
}
class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }
}