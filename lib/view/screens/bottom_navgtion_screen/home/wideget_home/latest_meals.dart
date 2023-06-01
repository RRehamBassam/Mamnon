
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/product_Details/product_details_screen.dart';
import 'package:mamnon/view/screens/resturant_details/e/e_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class LatestMeals extends StatefulWidget {
  const LatestMeals({Key? key}) : super(key: key);

  @override
  _LatestMealsState createState() => _LatestMealsState();
}

class _LatestMealsState extends State<LatestMeals> {
  NetworkRequest networkRequest=new NetworkRequest();

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 249,
      child:FutureBuilder<dynamic>(
        future: networkRequest.mealsApi(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
          print(snapshot.data.length);
          return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount:snapshot.data.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1.0;
            return InkWell(
              onTap: ()  {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ProductDetailsScreen(data:snapshot.data[index] ,)),
                );
             /*   Navigator.push(context,PageTransition(
                type: PageTransitionType.fade,

                isIos: true,
                duration: Duration(milliseconds: 550) ,
                reverseDuration: Duration(milliseconds: 700),
                child: ProductDetailsScreen(),
              ));*/
                }
              ,
              child: Container(
                padding: EdgeInsets.all(4),
                margin:  EdgeInsets.all(8),
                width: 176,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1e000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child:  Container(
                  width: 157,
                  height: 196,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width: 152,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child:  Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index]['imageName']}",fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return  Image.asset("assets/errerImage.jpg");
                        },),
                      ),
                      SizedBox(height: 6),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:[
                          SizedBox(
                            width: 150,
                            height: 20,
                            child: Text(
                              "${snapshot.data[index]['title']}",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: 150,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset("assets/Rectangle 1391.png"),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 122,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:[

                                      Container(

                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Text(
                                              "McDonald’s",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff38672d),
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children:[
                                                SizedBox(

                                                  height: 16,
                                                  child: Text(
                                                    "الطائف",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Color(0xffa2a2a2),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 0),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      SizedBox(
                                        height: 16,
                                        child: Text(
                                          "2.1 mi",
                                          style: TextStyle(
                                            color: Color(0xffa2a2a2),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),      // Figma Flutter Generator Group33496Widget - GROUP

              ),
            );}); }
    else if (snapshot.hasError) {

      return Center(child: Text("تأكد من إتصال بالإنرنت"));
    }
    // By default, show a loading spinner.
    return Container(
      height: 249,
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
              child:Container(
                padding: EdgeInsets.all(8),
                margin:  EdgeInsets.all(8),
                width: 176,
                height: 220,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1e000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.white,
                ),
                child:  Container(
                  width: 152,
                  height: 196,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:[
                      Container(
                        width: 152,
                        height: 129,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child:index%2 !=0?Image.asset("assets/Rectangle_223.png"): Image.asset("assets/Rectangle 23.png"),
                      ),
                      SizedBox(height: 4),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children:[
                          SizedBox(
                            width: 150,
                            height: 24,
                            child: Text(
                              "بيف بيرجر كلاسيك...",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            width: 150,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children:[
                                Container(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset("assets/Rectangle 1391.png"),
                                ),
                                SizedBox(width: 4),
                                Container(
                                  width: 122,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children:[

                                      Container(

                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Text(
                                              "McDonald’s",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff38672d),
                                                fontSize: 12,
                                              ),
                                            ),
                                            SizedBox(height: 4),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children:[
                                                SizedBox(
                                                  width: 33,
                                                  height: 16,
                                                  child: Text(
                                                    "الطائف",
                                                    textAlign: TextAlign.right,
                                                    style: TextStyle(
                                                      color: Color(0xffa2a2a2),
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 2),

                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      SizedBox(
                                        height: 16,
                                        child: Text(
                                          "2.1 mi",
                                          style: TextStyle(
                                            color: Color(0xffa2a2a2),
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),      // Figma Flutter Generator Group33496Widget - GROUP

              ),
            );}),
    );})
    );
  }
}
