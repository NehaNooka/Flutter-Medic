import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wallpaper/constants.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
   
   Scaffold(

          appBar: AppBar(
            centerTitle: true,
            iconTheme: new IconThemeData(color: Colors.black),
            title: Text("PRIVACY POLICY",
                style: GoogleFonts.pacifico(
                    textStyle: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2))),
            backgroundColor: appBarColor,
           ),

          body:Container(margin: EdgeInsets.all(20),
            
            child: ListView(
              children: <Widget>[
                Container(child:Text("Privacy Policy",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(

                    child:Text("We built the Medical Dictionary app as a Free app. This SERVICE is provided by us and  is intended for use as it is.\n \nThis page is used to inform the visitors regarding our policies with the collection, use, and disclosure of Personal Information,if anyone decided to use our Service.If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy. "
                        " \n \n The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Medical Dictionary App unless otherwise defined in this Privacy Policy. \n"
                      ,
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                      ),)
                ),
                Container(child:Text("Information Collection and Use",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" For a better experience, while using our Service, We may require you to provide us with certain personally identifiable information. The information that we request will be retained on your device and is not collected by us in any way."
                    "\n \n The app does use third party services that may collect information used to identify you.\n \n Link to privacy policy of third party service providers used by the app.",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Column(
                  children: <Widget>[
                    new ListTile(
                        leading: new MyBullet(),
                        title: new Text('Google play sevices',
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                              decoration: TextDecoration.underline ,
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
                Container(child:Text("Log Data",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics. \n",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Cookies",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory. "
                    "\n \n  This Service does not use these “cookies” explicitly. However, the app may use third party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service. \n",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Service Providers",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Column(
                  children: <Widget>[
                    new ListTile(
                      leading: new MyBullet(),
                      title: new Text('To facilitate our Service',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                    ),
                    new ListTile(
                      leading: new MyBullet(),
                      title: new Text('To provide the Service on our behalf',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                    ),
                    new ListTile(
                      leading: new MyBullet(),
                      title: new Text('To perform Service-related services',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                    ),
                    new ListTile(
                      leading: new MyBullet(),
                      title: new Text('To assist us in analyzing how our Service is used.',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: Colors.black
                        ),),
                    )
                  ],
                ),
                Container(child:Text(" We may employ third-party companies and individuals due to the following reasons: \n"
                    " We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n ",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Security",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security. \n",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Links to Other Sites",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services. \n",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Changes to This Privacy Policy",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text("We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. we will notify you of any changes by posting the new Privacy Policy on this page.This policy is effective as of 2020-09-19\n ",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
                Container(child:Text("Contact Us",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 20.0,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w500,
                      color: Colors.red
                  ),)
                ),
                Container(child:Text(" If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact us at dhwani1896@gmail.com.",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
                ),
              ],),)
    );
  }
}
class MyBullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(margin:EdgeInsets.all(10.0),
      height: 10.0,
      width: 10.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
