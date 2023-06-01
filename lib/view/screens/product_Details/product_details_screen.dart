import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class ProductDetailsScreen extends StatefulWidget {
  var data;
   ProductDetailsScreen({Key? key,this.data}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState(data);
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  var data;
  late String IdUser;
  getNameUserState() async {
    print("HelperFunctions");
    await HelperFunctions.getUserIdSharedPreference().then((value){
      setState(() {
        IdUser  = value! ;
      });
    });
  }

  _ProductDetailsScreenState(this.data);
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  void initState() {
    isFavorit=false;
    getNameUserState();
    // TODO: implement initState
    super.initState();
  }
late bool isFavorit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("رجوع",style: TextStyle(color: Color(0xff1a1a1a),fontSize: 18),),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color:Color(0xff1a1a1a))),
      ),
body: Column(
  children: [
    Container(
      child:  Expanded(
            child: Container(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                        height: 320,
                        child: Image.network("http://mamnoon.somee.com/Images/${data['imageName']}",fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return  Image.asset("assets/errerImage.jpg");
                        },)),
                   // Image.asset("assets/Rectangle 1396.png"),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(

                       width: MediaQuery.of(context).size.width*0.75,
                       margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                       child: Text(
                         "${data["title"]}",//  "بيف برجر كلاسيك 500سعر حراري",
                         textAlign: TextAlign.right,
                         style: TextStyle(
                           color: Color(0xff1a1a1a),
                           fontSize: 24,

                           fontWeight: FontWeight.w500,
                         ),
                       ),
                     ),
                     Container()
                   ],
                 ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [

                          Icon(Icons.location_on_outlined,color:Color(0xffa2a2a2)),
                        Text(
                          "${data["title"]}",//"طريق الطائف "
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xffa2a2a2),
                          fontSize: 12,
                        ),
                      ),
                          Spacer(),
                          SimpleStarRating(
                            allowHalfRating: true,
                            starCount: 5,
                            rating: 3,
                            size: 12,

                            onRated: (rate) {

                            },
                            spacing: 3,
                          ),
                          Text(
                            "(1.245)",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xffa2a2a2),
                              fontSize: 12,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            width: 1,
                            height: 14,
                            color: Color(0xff828282),
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal: 4),
                              child: Image.asset("assets/Send.png")),
                          Text(
                            "200m",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children:[
                                  Text(
                                    "\$6.45",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "السعر:",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "*متبقي 5",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff616161),
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: Color(0xfff2f2f2),
                                ),
                                child: Center(child: Icon(Icons.minimize_rounded,color:Colors.black)),
                              ),
                              SizedBox(width: 8,),
                              Text(
                                "1",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xff1b1b1b),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                width: 34,
                                height: 34,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: mamnongreen,
                                ),
                                child: Center(child: Icon(Icons.add,color:Colors.white)),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.86,
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff2f2f2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                            "الصنف الجانبي*",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: 16,
                            ),
                          ),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffa2a2a2),
                              ),
                              child: Center(child: Icon(Icons.add,color:Colors.white)),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        width: MediaQuery.of(context).size.width*0.86,
                        height: 48,
                        padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xfff2f2f2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "مشروبات",
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Color(0xff1a1a1a),
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xffa2a2a2),
                              ),
                              child: Center(child: Icon(Icons.add,color:Colors.white)),
                            ),


                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "وصف المنتج",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff1a1a1a),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "${data["body"]}"  ,//"هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق."
                          textAlign: TextAlign.right,
                          maxLines: 4,

                          style: TextStyle(
                            color: Color(0xff1a1a1a),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                  ],
                ),
              ),
            ),
      ) ),
    Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(16),
      height: 106,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24), bottomLeft: Radius.circular(0), bottomRight: Radius.circular(0), ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex:8,
            child: InkWell(
              onTap: () async {
                await   networkRequest.AddOder(data["id"],IdUser).then((value){
                  setState(() {

                    print("message: $value");

                  });
                  if(value.toString()=="true")
                    Fluttertoast.showToast(
                        msg: "تم اضافة الطلب",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xff38056e).withOpacity(0.9),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  else
                    Fluttertoast.showToast(
                        msg: "تم اضافة الطلب من قبل",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xff38056e).withOpacity(0.9),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                });

              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(

                height: 56,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xff38672d),
                ),
                child: Center(
                  child: Text(
                      "أضف إلى السلة",
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
          Expanded(
            flex: 1,
              child: Container()),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () async {
                print(isFavorit);
                print(data["id"]);
                print(IdUser);
                print("rrrr");
                if(!isFavorit){

                await   networkRequest.AddF(data["id"],IdUser).then((value){
                  setState(() {
                    print("message: $value");
                    isFavorit=!isFavorit;
                  });
                  if(value=="true")
                    Fluttertoast.showToast(
                        msg: "تم اضافه الطلب الي المفضلة",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Color(0xff38056e).withOpacity(0.9),
                        textColor: Colors.white,
                        fontSize: 16.0
                    );

                }); }
                else{
                  await   networkRequest.CancelFavorite(data["id"]).then((value){
                    setState(() {
                      print("message: $value");
                      isFavorit=!isFavorit;
                    });


                  }); }
              },
              child: Card(
                elevation: 2,margin: EdgeInsets.symmetric(horizontal: 6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(

                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffe4e4e4),
                  ),
                  padding: const EdgeInsets.all(12),
                  child:Icon(isFavorit?Icons.favorite:Icons.favorite_outline_rounded,color:isFavorit?Colors.red: Colors.black26,size: 24,) ,
                ),
              ),
            ),
          )

        ],
      ),
    )
  ],
),
    );
  }
}
