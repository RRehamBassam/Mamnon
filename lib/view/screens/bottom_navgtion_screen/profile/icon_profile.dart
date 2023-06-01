
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/auth/login_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class Icon_Profile extends StatefulWidget {
  const Icon_Profile({Key? key}) : super(key: key);

  @override
  _Icon_ProfileState createState() => _Icon_ProfileState();
}

class _Icon_ProfileState extends State<Icon_Profile> {
  @override
  Widget build(BuildContext context) {
    return     Container(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
      Container(
      margin: EdgeInsets.all(12),child:  Row(
            children: [
              Image.asset("assets/Frame.png"),
              SizedBox(width: 12,),
              Text(
                "إدارة العناوين",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff1a1a1a),
                  fontSize: 16,
                ),)
            ],
          )),
    Container(
    margin: EdgeInsets.all(8),child:
          Row(
            children: [
              Image.asset("assets/Setting.png"), SizedBox(width: 12,),
              Text(
                "الإعدادات",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff1a1a1a),
                  fontSize: 16,
                ),)
            ],
          )),
          InkWell(
            onTap: () async {
              await FlutterShare.share(
                  title: 'Example share',
                  text: 'Example share text',
                  linkUrl: 'https://flutter.dev/',
                  chooserTitle: 'Example Chooser Title'
              );
            },
            child: Container(
              margin: EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset("assets/2 User.png"), SizedBox(width: 12,),
                  Text(
                    "المشاركة مع صديق",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Color(0xff1a1a1a),
                      fontSize: 16,
                    ),)
                ],
              ),
            ),
          ),
              InkWell(
                onTap: (){
                  launchUrl(
                      Uri.parse("https://mamnoonfoundationapplicationsf.godaddysites.com/"),
                    mode: LaunchMode.inAppWebView,
                  );
                },
                child: Container(
                margin: EdgeInsets.all(8),child:    Row(
            children: [
                Image.asset("assets/Info Circle.png"), SizedBox(width: 12,),
                Text(
                  "من نحن",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff1a1a1a),
                    fontSize: 16,
                  ),)
            ],
          )),
              ),
          Container(
          margin: EdgeInsets.all(8),child:  Row(
            children: [
              Image.asset("assets/Star.png"), SizedBox(width: 12,),
              Text(
                "تقييماتي",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff1a1a1a),
                  fontSize: 16,
                ),)
            ],
          )),
          InkWell(
            onTap: ()async{
              var whatsappURl_android = "whatsapp://send?phone="+"+971561460023"+"&text=مرحبا";
              var whatappURL_ios ="https://wa.me/+971561460023?text=${Uri.parse("مرحبا")}";//971 56 146 0023
              if(Platform.isIOS){
                print("1");
                // for iOS phone only
                if( await canLaunch(whatappURL_ios)){
                  print("2");
              await launch(whatappURL_ios, forceSafariVC: false);
              }else{
                  print("3");
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));

              }

              }else{
                print("4");
                await launch(whatsappURl_android,);
              // android , web
              if( await canLaunch(whatsappURl_android)){
                print("5");
              await launch(whatsappURl_android,);
              }else{
                print("6");
            /*  ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: new Text("whatsapp no installed")));
*/
              }


              }
            },
            child: Container(
                 margin: EdgeInsets.all(8),
                child:Row(
                  children: [
                Image.asset("assets/Call.png"), SizedBox(width: 12,),
                Text(
                  "تواصل معنا",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff1a1a1a),
                    fontSize: 16,
                  ),)
              ],
            )),
          ),
          InkWell(
            onTap: ()async{
              HelperFunctions.saveUserLoggedInSharedPreference(false);
              Navigator.of(context).pushAndRemoveUntil(
                  PageTransition(
                    type: PageTransitionType.fade,

                    isIos: true,
                    duration: Duration(milliseconds: 550) ,
                    reverseDuration: Duration(milliseconds: 700),
                    child: LoginScreen(),
                  ),(route)=> false
              );

            },
            child: Container(
                margin: EdgeInsets.all(8),
                child:Row(
                  children: [
                   Icon(Icons.logout,color: Color(0xffA3A3A3).withOpacity(0.8),), SizedBox(width: 12,),
                    Text(
                      "تسجيل خروج",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Color(0xff1a1a1a),
                        fontSize: 16,
                      ),)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
