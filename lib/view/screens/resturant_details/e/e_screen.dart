
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/googleMap/map_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliverbar_with_card/sliverbar_with_card.dart';
import 'dart:math' as math;


class Example extends StatefulWidget {
  var data;
  Example(this.data);
  @override
  _ExampleState createState() => _ExampleState(data);


}

class _ExampleState extends State<Example> {
  var data;
  bool favorito = false;
  NetworkRequest networkRequest=new NetworkRequest();

  _ExampleState(this.data);

  bool expandText = false;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(

      body: Container(
        child: Transform(
          alignment: Alignment.center,
          transform:   Matrix4.rotationY(pi*2),

          child: CardSliverAppBar(
            height: 300,

            background: Stack(
              children: [

                Container(
                  width: double.maxFinite,
                    height: double.maxFinite,
                    child: Image.network("http://mamnoon.somee.com/Images/${data['image']}", fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return  Image.asset("assets/errerImage.jpg");
                    },)),
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x88ffffff), Color(0xe3ffffff)], ),
                  ),
                ),
              ],
            ),//'assets/Rectangle_23.png'
            title:
              Text(
                "${data['name']}",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Color(0xff1a1a1a),
                  fontSize: 22,

                  fontWeight: FontWeight.w500,
                ),
              ),


            titleDescription:Row(

              children: [

              Container(),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  MapScreen(data:data)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 12),
                    child: Text(
                        "${data['address']}",//طريق الطائف - يبعد 50 كيلو متر
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 11)),
                  ),
                )
              ],
            ),
            card:Card(
              clipBehavior: Clip.antiAlias,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),//"assets/Group 3.png"
              child: Image.network("http://mamnoon.somee.com/Images/${data['logo']}", fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return  Image.asset("assets/errerImage.jpg");
                },),
              ),
            ),

            backButton: true,
            backButtonColors: [Colors.white, Colors.black],

            action: IconButton(
              onPressed: () {
                setState(() {
                  favorito = !favorito;
                });
              },
              icon:
              favorito ? InkWell(
                onTap: () async {

                },
                  child: Icon(Icons.favorite,color: Colors.red,)) : InkWell(
                onTap: () async {
                /*  await   networkRequest.AddF().then((value){
                    setState(() {

                      print("message: $value");

                    });
                  });*/
                },
                  child: Icon(Icons.favorite_border)),
              color: Color(0xffA3A3A3),
              iconSize: 30.0,
            ),
            body: Container(
              alignment: Alignment.topLeft,
              color: Colors.white,
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: <Widget>[
                    FutureBuilder<dynamic>(
                    future: networkRequest.PostRestauranId(data['id']),
                    builder: (context, snapshot) {
                    if (snapshot.hasData) {
                    print(snapshot.data.length);
                    print("33");
                    print(snapshot.data);
                    return  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:snapshot.data.length,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          double scale = 1.0;
                                          return Container(
                                            height: 120,

                                            padding: EdgeInsets.all(12),
                                            margin:  EdgeInsets.all(8),
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
                                            child: Row(
                                              children: [
                                                Container(

                                                  width: MediaQuery.of(context).size.width*0.35,
                                                  height: double.maxFinite,
                                                  child: Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index]['imageName']}",fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                                                      StackTrace? stackTrace) {
                                                    return  Image.asset("assets/errerImage.jpg");
                                                  },),
                                                ),

                                              //  Image.asset("assets/Rectangle 33.png"),
                                                SizedBox(width: 8,),
                                                Expanded(
                                                  child: Container(
                                                    padding: EdgeInsets.all(8),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(context).size.width*0.48,
                                                          child: Text(
                                                            "${snapshot.data[index]['title']}",//بيف برجر كلاسيك 500سعر حراري
                                                            textAlign: TextAlign.right,
                                                            style: TextStyle(
                                                              color: Color(0xff1a1a1a),
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 2,),
                                                        Row(
                                                          children: [Container(
                                                            width: 14,

                                                            child: Image.asset("assets/Group_f.png"),
                                                          ),

                                                            SizedBox(width: 4),

                                                            Text(
                                                              "McDonald’s",
                                                              textAlign: TextAlign.right,
                                                              style: TextStyle(
                                                                color: Color(0xffa2a2a2),
                                                                fontSize: 12,
                                                              ),
                                                            ),
                                                          ],
                                                        ),    SizedBox(height: 2,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Icon(Icons.star,color: Color(0xfffbbd3f),), SizedBox(width: 4,),
                                                                Text(
                                                                  "4.0",
                                                                  style: TextStyle(
                                                                    color: Color(0xff1a1a1a),
                                                                    fontSize: 12,

                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                )

                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "\$7.54",
                                                                  style: TextStyle(
                                                                    color: Color(0xff1a1a1a),
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                                SizedBox(width: 4,),
                                                                Text(
                                                                  "\$4.54",
                                                                  style: TextStyle(
                                                                    fontSize: 18,

                                                                    fontWeight: FontWeight.w500,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )

                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          );}),
                                  ); }
                    else if (snapshot.hasError) {

                      return Center(child: Text("تأكد من إتصال بالإنرنت"));
                    }
                    // By default, show a loading spinner.
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount:10,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          return  Shimmer.fromColors(

                              baseColor: Color(0xFFF3F3F3),
                              highlightColor: Color(0xFFF5F5F5),
                              enabled: true,
                            child: Container(

                              padding: EdgeInsets.all(12),
                              margin:  EdgeInsets.all(8),
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
                              child: Row(
                                children: [
                                  Image.asset("assets/Rectangle 33.png"),
                                  SizedBox(width: 8,),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width*0.48,
                                            child: Text(
                                              "بيف برجر كلاسيك 500سعر حراري",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff1a1a1a),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 2,),
                                          Row(
                                            children: [Container(
                                              width: 14,

                                              child: Image.asset("assets/Group_f.png"),
                                            ),

                                              SizedBox(width: 4),
                                              Text(
                                                "McDonald’s",
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xffa2a2a2),
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),    SizedBox(height: 2,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.star,color: Color(0xfffbbd3f),), SizedBox(width: 4,),
                                                  Text(
                                                    "4.0",
                                                    style: TextStyle(
                                                      color: Color(0xff1a1a1a),
                                                      fontSize: 12,

                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )

                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "\$7.54",
                                                    style: TextStyle(
                                                      color: Color(0xff1a1a1a),
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4,),
                                                  Text(
                                                    "\$4.54",
                                                    style: TextStyle(
                                                      fontSize: 18,

                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );});}),
                /*  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        _ratingIcon(
                            Icon(Icons.star),
                            Text("84%",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        _ratingIcon(
                            Icon(Icons.personal_video),
                            Text("AMC",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        _ratingIcon(
                            Icon(Icons.people),
                            Text("TV-MA",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        _ratingIcon(
                            Icon(Icons.av_timer),
                            Text("45m",
                                style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  Divider(),
                  Container(
                    height: expandText ? 145 : 65,
                    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            expandText = !expandText;
                          });
                        },
                        child: Text(
                            "The series centers on sheriff's deputy Rick Grimes, who wakes up from a coma to discover the apocalypse. He becomes the leader of a group of survivours from the Atlanta, Georgia..\n" +
                                "region as they attempt to sustain themselves and protect themselves not only against attacks by walkers but by other groups of survivors willing to assure their longevity by any means necessary.")),
                  ),
                  SizedBox(
                    height: 20,
                  ),**/


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _exampleRelatedShow() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.grey,
      ),
      width: 80,
      height: 100,
    );
  }

  Widget _ratingIcon(Icon icon, Text text) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.grey),
            child: IconButton(
              onPressed: () {},
              icon: icon,
              color: Colors.white,
              iconSize: 30,
            ),
          ),
          Divider(),
          text
        ],
      ),
    );
  }
}