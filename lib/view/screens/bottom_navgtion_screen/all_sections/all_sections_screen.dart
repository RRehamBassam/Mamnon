
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/all_resturant/all_resturant_screen.dart';
import 'package:mamnon/view/screens/search/s.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:page_transition/page_transition.dart';

class AllSectionsScreen extends StatefulWidget {
  const AllSectionsScreen({Key? key}) : super(key: key);

  @override
  _AllSectionsScreenState createState() => _AllSectionsScreenState();
}
var list = [Color(0xffECFFE7),Color(0xffECFCFF),Color(0xffF6ECFF),Color(0xffFFF8EC),Color(0xffFFEFEF)];
final _random = new Random();

class _AllSectionsScreenState extends State<AllSectionsScreen> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0.0),
        title: Text("رجوع",style:TextStyle(
            color: Color(0xff38672d),
        fontSize: 18,
      ),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.black38,)),

      ),
      body:Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
        Container( padding: EdgeInsets.all(8),
            child:  Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
     children: [
         Text(
             "جميع الأقسام",
             textAlign: TextAlign.right,
             style: TextStyle(
               color: Color(0xff1a1a1a),
               fontSize: 24,

               fontWeight: FontWeight.w700,
             )),
         Container()
     ],
     )),
            SizedBox(height: 22,),
            Container(
              height: 49,
              child: TextFormField(
                onTap: (){
                  showSearch(context: context, delegate: SearchUser());
                },
                decoration: InputDecoration(
                  hintText: "ابحث",
                  prefix: Image.asset('assets/Search.png'),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none,
                  ),

                ),
              ),
            ),
            SizedBox(height: 22,),
            FutureBuilder<dynamic>(
                future: networkRequest.AllSections(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data.length);
                    return Expanded(
                      child: Container(

                        child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            mainAxisSpacing: 16.0,
                            children: List.generate(snapshot.data.length, (index) {
                              return InkWell(
                                onTap: () { Navigator.pop(context);
                                  Navigator.push(context,PageTransition(
                                type: PageTransitionType.fade,

                                isIos: true,
                                duration: Duration(milliseconds: 550) ,
                                reverseDuration: Duration(milliseconds: 700),
                                child: AllResturantScreen(data:snapshot.data[index] ,),
                              ));},
                                child: Container(
                                   
                                  margin: EdgeInsets.all(6),

                                  child:       // Figma Flutter Generator Group33496Widget - GROUP
                                 Card(
                                   elevation: 5,
                                   shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(15)
                               ),
                                  side: BorderSide(width: 0.5, color:mamnongreen)),

                                   clipBehavior: Clip.antiAlias,
                                   child: Container(
                                        width: 82,
                                       padding:EdgeInsets.all(6) ,
                                        decoration: BoxDecoration(
                                          borderRadius : BorderRadius.all(
                                              Radius.circular(4)
                                          ),
                                          color : list[index],//_random.nextInt(list.length)
                                        ),
                                        child: Center(
                                          child:FittedBox(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "${snapshot.data[index]['name']}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xff1a1a1a),
                                                    fontSize: 12,
                                                  ),),
                                                SizedBox(height: 8,),
                                                Container(
                                                  width: MediaQuery.of(context).size.width*0.25,
                                                  height: MediaQuery.of(context).size.width*0.25,
                                                  // margin: EdgeInsets.all(16.0),
                                                  decoration: BoxDecoration(

                                                    borderRadius: BorderRadius.circular(14.0),
                                                    image: DecorationImage(
                                                      image:   NetworkImage("http://mamnoon.somee.com/Images/${snapshot.data[index]['imageName']}",),
                                                      //MemoryImage(bytes),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  //  child: Image.memory(bytes),
                                                )
                                       ,
                                              //  Image.asset("assets/image _1.png")
                                              ],
                                            ),
                                          ),
                                        )

                                    ),
                                 )

                                ),
                              );
                            }
                            )),
                      ),
                    ) ; }
                  else if (snapshot.hasError) {

                    return Center(child: Text("تأكد من إتصال بالإنرنت"));
                  }
                  // By default, show a loading spinner.
                  return Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Loading(),
                        // ViewRestaurantDiscountsLoud(),
                        // ViewRestaurantDiscountsLoud()
                        // Loading(),
                        // Center(
                        //   child: PixLoader(
                        //       loaderType: LoaderType.Spinner, faceColor: Color(0xfff99b1d)),
                        // )
                        //CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Color(0xfff99b1d) ),)
                      ],
                    ),
                  );}),

          ],
        ),
      ),
    );
  }
}
