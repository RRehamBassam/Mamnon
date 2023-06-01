
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/all_resturant/all_resturant_screen.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/all_sections/all_sections_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class SctionItem extends StatefulWidget {
  const SctionItem({Key? key}) : super(key: key);

  @override
  _SctionItemState createState() => _SctionItemState();
}

class _SctionItemState extends State<SctionItem> {
  NetworkRequest networkRequest=new NetworkRequest();
  var list = [Color(0xffECFFE7),Color(0xffFFEFEF),Color(0xffF6ECFF),Color(0xffFFF8EC),Color(0xffECFCFF)];
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:   FutureBuilder<dynamic>(
          future: networkRequest.AllSections(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.length);
              return InkWell(
                onTap: (){

                },
                child: Container(
                  height: 149,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount:snapshot.data.length+1,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        return InkWell(
                          onTap: (){
                            Navigator.push(context,PageTransition(
                              type: PageTransitionType.fade,

                              isIos: true,
                              duration: Duration(milliseconds: 550) ,
                              reverseDuration: Duration(milliseconds: 700),
                              child: AllResturantScreen(data:snapshot.data[index-1] ),
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.all(2),
                            child:       // Figma Flutter Generator Group33496Widget - GROUP
                            index!=0?  Card(
                              elevation: 2,
                              child: Container(
                                  width: 82,
                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.all(
                                        Radius.circular(4)
                                    ),
                                    color : list[_random.nextInt(list.length)],
                                  ),
                                  child: Center(
                                    child:Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${snapshot.data[index-1]['name']}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xff1a1a1a),
                                            fontSize: 12,
                                          ),),
                                        SizedBox(height: 8,),
                                        Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index-1]['imageName']}",errorBuilder: (BuildContext context, Object exception,
                                            StackTrace? stackTrace) {
                                          return  Image.asset("assets/errerImage.jpg");
                                        },)
                                      ],
                                    ),
                                  )

                              ),
                            ):Card(
                              elevation: 2,
                              child: Container(
                                  width: 82,


                                  decoration: BoxDecoration(
                                    borderRadius : BorderRadius.all(
                                        Radius.circular(4)
                                    ),
                                    color : Color.fromRGBO(164, 198, 21, 1),
                                  ),
                                  child: Center(
                                    child: Text('جميع الأقسام', textAlign: TextAlign.center, style: TextStyle(
                                        color: Color.fromRGBO(255, 255, 255, 1),

                                        fontSize: 14,
                                        letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                        fontWeight: FontWeight.normal,
                                        height: 1
                                    ),),
                                  )

                              ),
                            ),
                          ),
                        );}),
                ),
              ) ; }
            else if (snapshot.hasError) {

              return Center(child: Text("تأكد من إتصال بالإنرنت"));
            }
            // By default, show a loading spinner.
            return Container(
              height: 149,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:4,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    double scale = 1.0;
                    return     Shimmer.fromColors(

                      baseColor: Color(0xFFF3F3F3),
                      highlightColor: Color(0xFFF5F5F5),
                      enabled: true,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child:       // Figma Flutter Generator Group33496Widget - GROUP
                        index!=0?  Container(
                            width: 82,
                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.all(
                                  Radius.circular(4)
                              ),
                              color : list[_random.nextInt(list.length)],
                            ),
                            child: Center(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 12,
                                    ),),
                                  SizedBox(height: 8,),
                                  Image.asset("assets/image _1.png")
                               //   Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index-1]['imageName']}")
                                ],
                              ),
                            )

                        ):Container(
                            width: 82,


                            decoration: BoxDecoration(
                              borderRadius : BorderRadius.all(
                                  Radius.circular(4)
                              ),
                              color : Color.fromRGBO(164, 198, 21, 1),
                            ),
                            child: Center(
                              child: Text('جميع الأقسام', textAlign: TextAlign.center, style: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1),

                                  fontSize: 14,
                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1
                              ),),
                            )

                        ),
                      ),
                    );}),
            );}),
    );
  }
}
