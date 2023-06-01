
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/resturant_details/e/e_screen.dart';
import 'package:mamnon/view/screens/search/s.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class AllResturantScreen extends StatefulWidget {
 var data;

   AllResturantScreen({Key? key,this.data}) : super(key: key);



  @override
  _AllResturantScreenState createState() => _AllResturantScreenState(data);
}

class _AllResturantScreenState extends State<AllResturantScreen> {
  var data;

  _AllResturantScreenState(this.data);

  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container( padding: EdgeInsets.all(8),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "جميع ${data['name']}",
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
              child: TextFormField(  onTap: (){
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

            Expanded(

              child: FutureBuilder<dynamic>(
                  future: networkRequest.RestaurantsApi(data['id']),
                  builder: (context, snapshot) {
                  if (snapshot.hasData) {
                  print(snapshot.data);
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount:snapshot.data.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double scale = 1.0;
                      return    InkWell(
                        onTap: (){
                          Navigator.push(context,PageTransition(
                            type: PageTransitionType.fade,
                            isIos: true,
                            duration: Duration(milliseconds: 550) ,
                            reverseDuration: Duration(milliseconds: 700),
                            child: Example(snapshot.data[index]),
                          ));
                        },
                        child: Card(
                            elevation:2,
                          margin: EdgeInsets.all(4),
                          child: Container(
                            padding: EdgeInsets.all(8),
                          //  margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                             /* boxShadow: [
                                BoxShadow(
                                  color: Color(0x1e000000),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],**/
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [

                                Card(
                            elevation:1,
                                  child: Container(
                                      width: double.infinity,
                                      height: 150,
                                      child: Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index]['image']}", fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context, Object exception,
                                            StackTrace? stackTrace) {
                                          return  Image.asset("assets/errerImage.jpg");
                                        },)
                                  )
                                ),
                              // index%2!=0?Image.asset("assets/Rectangle 23_1.png",fit: BoxFit.fitWidth,):Image.asset("assets/Rectangle 233.png",fit: BoxFit.fitWidth),
                                Container(
                                  margin: EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Card(
                                  elevation:1,
                                          clipBehavior: Clip.antiAlias,
                                          child: Container(
                                            padding: EdgeInsets.all(4),
                                            width: 58,
                                              height: 58,
                                              child:Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index]['logo']}",fit: BoxFit.fill, errorBuilder: (BuildContext context, Object exception,
                                                  StackTrace? stackTrace) {
                                                return  Image.asset("assets/errerImage.jpg");
                                              },)
                                          )
                                      ),
                                      SizedBox(width: 8,),
                                      Column(

                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(
                                        "${snapshot.data[index]['name']}",
                                        style: TextStyle(
                                          color: Color(0xff1a1a1a),
                                          fontSize: 16,

                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                          Row(
                                            children: [
                                              Image.asset("assets/Location.png"),
                                              SizedBox(width: 4,),
                                              Text(
                                                "${snapshot.data[index]['address']}",// "طريق الطائف - يبعد 50 كيلو متر"
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xffa2a2a2),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ) ;})
              ; }
              else if (snapshot.hasError) {

      return Center(child: Text("تأكد من إتصال بالإنرنت"));
      }
      // By default, show a loading spinner.
      return Container(
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:2,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1.0;
            return     Shimmer.fromColors(

              baseColor: Color(0xFFF3F3F3),
              highlightColor: Color(0xFFF5F5F5),
              enabled: true,
              child: Card(
                elevation:0,
                margin: EdgeInsets.all(4),
                child: Container(
                  padding: EdgeInsets.all(8),
                  //  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    /* boxShadow: [
                                BoxShadow(
                                  color: Color(0x1e000000),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],**/
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [

                      Card(
                          elevation:3,
                          child: Container(
                              width: double.infinity,
                              child: Image.asset("assets/Rectangle 23_1.png",fit: BoxFit.fitWidth,))
                      ),
                      // index%2!=0?Image.asset("assets/Rectangle 23_1.png",fit: BoxFit.fitWidth,):Image.asset("assets/Rectangle 233.png",fit: BoxFit.fitWidth),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          children: [

                            Column(

                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "KFC",
                                  style: TextStyle(
                                    color: Color(0xff1a1a1a),
                                    fontSize: 16,

                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset("assets/Location.png"),
                                    Text(
                                      "طريق الطائف - يبعد 50 كيلو متر",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xffa2a2a2),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),
              ),
            ) ;}),
      );


                  }),


            ),
          ],
        ),
      ),
    );
  }
}
