import 'package:flutter/material.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/order_screen/no_order.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/order_screen/order_successful_screen.dart';
import 'package:mamnon/view/screens/search/s.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
   String idUser="";
  NetworkRequest networkRequest=new NetworkRequest();
  getNameUserState() async {
    print("HelperFunctions");
    await HelperFunctions.getUserIdSharedPreference().then((value){
      setState(() {
        idUser  = value! ;
      });
    });
  }
  @override
  void initState() {
    getNameUserState();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        elevation: 1,
        backgroundColor: Colors.white.withOpacity(0.87),
        title: Image.asset('assets/Vector.png'),
        centerTitle: true,

      ),
      body:
      FutureBuilder<dynamic>(
          future: networkRequest.OrderResponse(idUser),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.length);
              return  Stack(
       children: [
         Container(

           padding: EdgeInsets.all(8),
           child: Column(
             children: [

               Expanded(flex: 1,
                   child: Container(
                     margin: EdgeInsets.symmetric(vertical: 8),
                     height: 57,
                     child: TextFormField(
                       onTap: (){
                         showSearch(context: context, delegate: SearchUser());
                       },
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
                   )),

            /*   Expanded(flex: 1,
                 child: Container(
                   margin: EdgeInsets.symmetric(vertical: 8),
                   child: Row(
                     children: [
                       Expanded(
                         flex: 1,
                         child: Container(
                           margin: EdgeInsets.all(8),
                           height: 48,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: Color(0xff38672d),
                           ),
                           child: Center(
                             child: Text(
                                 "الطلبات الحالية",
                                 textAlign: TextAlign.center,
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 16,
                                 )),
                           ),
                         ),
                       ),
                       Expanded(
                         flex: 1,
                         child: Container(
                           margin: EdgeInsets.all(8),
                           height: 48,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(8),
                             color: Color(0xfff2f2f2),
                           ),
                           child: Center(
                             child: Text(
                               "الطلبات السابقة",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 color: Color(0xff616161),
                                 fontSize: 16,
                               ),
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               ),*/

               Expanded(
                 flex: 8,
                 child: Container(
                  child: snapshot.data.length!=0? Container(
                   height: 300,
                   margin: EdgeInsets.only(top: 12),
                   padding:EdgeInsets.all(16),
                   child: ListView.builder(
                       shrinkWrap: true,
                       scrollDirection: Axis.vertical,
                       itemCount:snapshot.data.length,
                       physics: BouncingScrollPhysics(),
                       itemBuilder: (context, index) {
                         double scale = 1.0;
                         return  Container(
                           margin: EdgeInsets.symmetric(horizontal: 8),
                           child: Transform.rotate(
                             angle: 3.14,
                             child: Row(
                               children: [

                                 Expanded(
                                   flex:28,
                                   child:  Transform.rotate(
                                     angle: 3.14,
                                     child: Container(

                                       height: 136,
                                       margin: EdgeInsets.symmetric(vertical: 8),
                                       padding: EdgeInsets.all(16),
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.only(topLeft:
                                         Radius.circular(8),bottomLeft:
                                        Radius.circular(8)),
                                         boxShadow: [
                                           BoxShadow(
                                             color: Color(0x1e4a935e),
                                             blurRadius: 10,
                                             offset: Offset(0, 3),
                                           ),
                                         ],
                                         color: Colors.white,
                                       ),
                                       child:Container(
                                         child: Column(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                           children: [
                                             Row(

                                               children: [
                                                 Container(
                                                   width: 45,
                                                   height: 45,
                                                   decoration: BoxDecoration(
                                                     borderRadius: BorderRadius.circular(4),
                                                     color: Color(0xff38672d),
                                                   ),
                                                   child: Center(child: Icon(Icons.article_outlined,color: Colors.white,)),
                                                 ),

                                                 SizedBox(width: 8,),
                                                 Expanded(
                                                   child: Column(
                                                     children: [
                                                       Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           Text(
                                                             "الطلب ID:35454 ",
                                                             textAlign: TextAlign.right,
                                                             style: TextStyle(
                                                               color: Color(0xff1a1a1a),
                                                               fontSize: 16,

                                                               fontWeight: FontWeight.w500,
                                                             ),
                                                           ),
                                                           SizedBox(width: 32,),///
                                                           Text(
                                                             "\$23.45",
                                                             style: TextStyle(
                                                               fontSize: 14,

                                                               fontWeight: FontWeight.w500,
                                                             ),
                                                           ),

                                                         ],
                                                       ),
                                                       Row(
                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                         children: [
                                                           Text(
                                                             "02:00د",
                                                             textAlign: TextAlign.right,
                                                             style: TextStyle(
                                                               color: Color(0xff1a1a1a),
                                                               fontSize: 16,

                                                               fontWeight: FontWeight.w500,
                                                             ),
                                                           ),
                                                           SizedBox(width: 32,),
                                                           Text(
                                                             "الكمية: 4",
                                                             style: TextStyle(
                                                               fontSize: 14,

                                                               fontWeight: FontWeight.w500,
                                                             ),
                                                           )
                                                         ],
                                                       ),
                                                       SizedBox(height: 8,),
                                                       Row(
                                                         mainAxisAlignment: MainAxisAlignment.start,
                                                         children: [
                                                           Text(
                                                             "${snapshot.data[index]["post"]["title"]}",
                                                             textAlign: TextAlign.right,
                                                             style: TextStyle(
                                                               color: Color(0xff1a1a1a),
                                                               fontSize: 16,

                                                               fontWeight: FontWeight.w500,
                                                             ),
                                                           ),
                                                         ],
                                                       ),
                                                     ],
                                                   ),
                                                 )
                                               ],
                                             ),


                                             Row(
                                               mainAxisAlignment:
                                               MainAxisAlignment.spaceBetween,
                                               children: [
                                                 Container(),
                                                 InkWell(
                                                   onTap: (){
                                                     showDialog(
                                                       context: context,
                                                       builder: (BuildContext context) {
                                                         return Expanded(
                                                           child: AlertDialog(
                                                             title: Text('الطلب ID:35454',style: TextStyle(fontSize: 18,color: mamnongreen)),
                                                             content: Text('هل انت متاكد من الغاء الطلب',),
                                                             actions: [
                                                               FlatButton(
                                                                 textColor: Colors.black,
                                                                 onPressed: () async {
                                                               await    getUserSetPass(snapshot.data[index]["id"]);
                                                               Navigator.pop(context);
                                                                 },
                                                                 child: Container(
                                                                     width: 90,
                                                                     height: 32,
                                                                     alignment: Alignment.bottomLeft,
                                                                     decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(8),
                                                                       color:mamnongreen,//Color(0x1e4a935e)
                                                                     ),
                                                                     child: Center(child: Text('نعم',style: TextStyle(fontSize: 16,color: Colors.white)))),
                                                               ),
                                                               FlatButton(
                                                                 textColor: Colors.black,
                                                                 onPressed: () {
                                                                   Navigator.pop(context);
                                                                 },
                                                                 child: Container(
                                                                     width: 90,
                                                                     height: 32,
                                                                     alignment: Alignment.bottomLeft,
                                                                     decoration: BoxDecoration(
                                                                       borderRadius: BorderRadius.circular(8),
                                                                       color:  Color(0xffc3c3c3).withOpacity(0.8),
                                                                     ),
                                                                     child:Center(child: Text('الغاء',style: TextStyle(fontSize: 16,color: Colors.black45)))),
                                                               ),
                                                             ],
                                                           ),
                                                         );
                                                       },
                                                     );


                                                   },
                                                   child: Container(
                                                     width: 90,
                                                     height: 32,
                                                     alignment: Alignment.bottomLeft,
                                                     decoration: BoxDecoration(
                                                       borderRadius: BorderRadius.circular(8),
                                                       color: Color(0xfff9eeee),
                                                     ),
                                                     child: Center(
                                                       child: Text(
                                                         "إلغاء",
                                                         textAlign: TextAlign.center,
                                                         style: TextStyle(
                                                           color: Color(0xffb82121),
                                                           fontSize: 12,

                                                           fontWeight: FontWeight.w500,
                                                         ),
                                                       ),
                                                     ),
                                                   ),
                                                 )
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ),Expanded(
                                   flex:1,
                                   child: Container(

                                     child: Container(

                                       height: 136,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(0), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(0), ),
                                         color: Color(0xff38672d),
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),

                           ),
                         )
                         ;}),
                 ):NoOrder()
                 )//هنا
               )
             ],
           ),
         ),
         Positioned(
             bottom: 0,
             child:  snapshot.data.length!=0? Material(
               elevation: 16,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),

               child: Container(
                 width: MediaQuery.of(context).size.width,
                 padding: EdgeInsets.all(16),
                 height: 116,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
                   color: Colors.white,
                 ),
                 child:      Center(
                   child: InkWell(
                     onTap: (){
                       Navigator.push(context,PageTransition(
                         type: PageTransitionType.fade,

                         isIos: true,
                         duration: Duration(milliseconds: 550) ,
                         reverseDuration: Duration(milliseconds: 700),
                         child: OrderSuccessfulScreen(),
                       ));
                     },
                     child: Container(
                       width: MediaQuery.of(context).size.width*0.8,
                       height: 56,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                         color: Color(0xff38672d),
                       ),
                       child: Center(
                         child: Text(
                             "اطلب الان",
                             textAlign: TextAlign.center,
                             style: TextStyle(
                               color: Colors.white,
                               fontSize: 16,
                               fontWeight: FontWeight.w500,
                             )),
                       ),),
                   ),
                 ),
               ),
             ):Container()),

       ],
     ); }
            else if (snapshot.hasError) {

            return Center(child: Text("تأكد من إتصال بالإنرنت"));
            }
            // By default, show a loading spinner.
            return Container(
            height: 300,
            margin: EdgeInsets.only(top: 12),
            padding:EdgeInsets.all(16),
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
            double scale = 1.0;
            return Shimmer.fromColors(

            baseColor: Color(0xFFF3F3F3),
            highlightColor: Color(0xFFF5F5F5),
            enabled: true,
            child: Container(
            height: 300,
            margin: EdgeInsets.only(top: 12),
            padding:EdgeInsets.all(16),
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:10,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
            double scale = 1.0;
            return Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: Transform.rotate(
            angle: 3.14,
            child: Row(
            children: [

            Expanded(
            flex:28,
            child:  Transform.rotate(
            angle: 3.14,
            child: Container(

            height: 121,
            margin: EdgeInsets.symmetric(vertical: 8),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
            BoxShadow(
            color: Color(0x1e4a935e),
            blurRadius: 10,
            offset: Offset(0, 3),
            ),
            ],
            color: Colors.white,
            ),
            child:Container(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
            Row(

            children: [
            Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xff38672d),
            ),
            child: Center(child: Icon(Icons.article_outlined,color: Colors.white,)),
            ),
            SizedBox(width: 8,),
            Expanded(
            child: Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
            "الطلب ID:35454 ",
            textAlign: TextAlign.right,
            style: TextStyle(
            color: Color(0xff1a1a1a),
            fontSize: 16,

            fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(width: 32,),///
            Text(
            "\$23.45",
            style: TextStyle(
            fontSize: 14,

            fontWeight: FontWeight.w500,
            ),
            )
            ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(
            "02:00د",
            textAlign: TextAlign.right,
            style: TextStyle(
            color: Color(0xff1a1a1a),
            fontSize: 16,

            fontWeight: FontWeight.w500,
            ),
            ),
            SizedBox(width: 32,),
            Text(
            "الكمية: 4",
            style: TextStyle(
            fontSize: 14,

            fontWeight: FontWeight.w500,
            ),
            )
            ],
            ),
            ],
            ),
            )
            ],
            ),
            Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
            Container(),
            Container(
            width: 90,
            height: 32,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xfff9eeee),
            ),
            child: Center(
            child: Text(
            "إلغاء",
            textAlign: TextAlign.center,
            style: TextStyle(
            color: Color(0xffb82121),
            fontSize: 12,

            fontWeight: FontWeight.w500,
            ),
            ),
            ),
            )
            ],
            )
            ],
            ),
            ),
            ),
            ),
            ),Expanded(
            flex:1,
            child: Container(

            child: Container(

            height: 121,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(0), bottomLeft: Radius.circular(8), bottomRight: Radius.circular(0), ),
            color: Color(0xff38672d),
            ),
            ),
            ),
            ),
            ],
            ),

            ),
            )
            ;}),
            ),
            );}),
            );}),
    );
  }
   getUserSetPass(id) async {

     await   networkRequest.CancelOrder(id).then((value){
       setState(() {
       //  message  = value;

       });
     });
   }
}
