
import 'dart:math';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/all_sections/all_sections_screen.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/home/wideget_home/Special_items.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/home/wideget_home/latest_meals.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/home/wideget_home/sction_item.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/home/wideget_home/silder_item.dart';
import 'package:mamnon/view/screens/resturant_details/e/e_screen.dart';
import 'package:mamnon/view/screens/resturant_details/resturant_details_screen.dart';
import 'package:mamnon/view/screens/search/s.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white.withOpacity(0.87),
        title: Image.asset('assets/Vector.png'),
        centerTitle: true,

      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: ListView(
          children: [

            Container(
              height: 57,
              child: TextFormField(
                onTap: (){
                  showSearch(context: context, delegate: SearchUser());
                  },

                readOnly: true,
                decoration: InputDecoration(

                  hintText: "ابحث",
                  prefixIcon:Image.asset('assets/Search.png'),

                 //  prefix: Image.asset('assets/Search.png'),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),

                ),
              ),
            ),
            SizedBox(height: 22,),
            Row(
              children: [
                Text(
                  "الأقسام",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xff1a1a1a),
                    fontSize: 16,

                    fontWeight: FontWeight.w500,
                  )),
                Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context,PageTransition(
                      type: PageTransitionType.fade,

                      isIos: true,
                      duration: Duration(milliseconds: 550) ,
                      reverseDuration: Duration(milliseconds: 700),
                      child: AllSectionsScreen(),
                    ));
                  },
                  child: Text(
                    "المزيد",
                    style: TextStyle(
                      color: Color(0xffa4c615),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            SctionItem(),


             SizedBox(height: 22,),
           /* Container(
              height: 150,
              child: Carousel(
                images: [

                  new Container(
                    height: 150.79,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/carouselslider_image.png",),
                      ),
                      //border: Border.all(width: 1.00, color: Color(0xfff5f5f5).withOpacity(0.4),), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.00), bottomRight: Radius.circular(12.00), ),
                    ),
                  ),
                  new Container(
                    height: 150.79,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:  AssetImage("assets/carouselslider_image.png",),
                      ),
                      //  border: Border.all(width: 1.00, color: Color(0xfff5f5f5).withOpacity(0.4),), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.00), bottomRight: Radius.circular(12.00), ),
                    ),
                  ),
                  new Container(
                    height: 203.79,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/carouselslider_image.png",),
                      ),
                      //  border: Border.all(width: 1.00, color: Color(0xfff5f5f5).withOpacity(0.4),), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.00), bottomRight: Radius.circular(12.00), ),
                    ),
                  ),       new Container(
                    height: 203.79,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image:  AssetImage("assets/carouselslider_image.png",),
                      ),
                      //   border: Border.all(width: 1.00, color: Color(0xfff5f5f5).withOpacity(0.4),), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.00), bottomRight: Radius.circular(12.00), ),
                    ),
                  ),
                ],
                dotPosition: DotPosition.bottomCenter,

                dotSize: 8,
                dotIncreaseSize: 1.5,
                dotSpacing: 20,
                dotColor: Colors.grey.withOpacity(0.9),
                dotBgColor: Colors.black.withOpacity(0.0),
                boxFit: BoxFit.cover,
                dotIncreasedColor: Color(0xFF38672D),
              ),
            ),*/
            SilderItem(),

            SizedBox(height: 8,),
            Text(
              "الأصناف المميزة",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff1a1a1a),
                fontSize: 16,

                fontWeight: FontWeight.w500,
              ),),
                  SizedBox(height: 8,),
            SpecialItem(),
            SizedBox(height: 8,),
            Text(
              "أحدث الوجبات",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff1a1a1a),
                fontSize: 16,

                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 8,),
            LatestMeals()
          ],
        ),
      ),
    );
  }
}
