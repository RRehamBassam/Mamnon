
import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:shimmer/shimmer.dart';
import 'package:simple_star_rating/simple_star_rating.dart';

class MapScreen extends StatefulWidget {
  var data;
   MapScreen({Key? key,this.data}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState(data);
}

class _MapScreenState extends State<MapScreen> {
  var data;
  NetworkRequest networkRequest=new NetworkRequest();
  _MapScreenState(this.data);

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        toolbarHeight: 65,
        elevation: 5,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "رجوع",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Color(0xff1a1a1a),
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
        body: Stack(
          children: [
            GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                } ),
            Container(
              width: double.maxFinite,
              height:double.maxFinite ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 30,
                  ),
                  Card(
                    elevation: 5,

                    child: Container(
                      padding: EdgeInsets.all(8),
                      width: 335,
                      height: 123,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x19000000),
                            blurRadius: 6,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child:Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                clipBehavior: Clip.antiAlias,
                                child: Image.network('http://mamnoon.somee.com/Images/${data["logo"]}') // Image.asset("assets/Group 3.png"),

                              ),
                              Column(
                                children: [
                                  Text(
                                    data["name"],// "McDonald’s",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    data['address'],//  "طريق الطائف - يبعد 50 كيلو متر",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xffa2a2a2),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xfff2f2f2),
                                ),
                                child: Center(child: Icon(Icons.favorite_outline_rounded)),
                              ),


                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            width : MediaQuery.of(context).size.width*0.7,
                            height: 1,
                            color: Color(0xfff2f2f2),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/Send.png"),
                                  Text(
                                      "200m",
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xff1a1a1a),
                                        fontSize: 12,
                                      )),
                                  Container(
                                    height : 14,
                                    width: 1,
                                    color: Color(0xfff2f2f2),

                                  ),
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
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ) ,
                    ),
                  ),
                  Spacer(),
                  FutureBuilder<dynamic>(
                      future: networkRequest.PostRestauranId(data['id']),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          print(snapshot.data.length);
                          print("33");
                          print(snapshot.data);
                          return    CarouselSlider(
                              options: CarouselOptions(

                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration: Duration(milliseconds: 1000),
                                viewportFraction: 0.87,
                                height: 140.0,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlay: true,
                                aspectRatio:  10 / 5,
                                enlargeCenterPage: true,
                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                              ),

                              items: [
                                ...snapshot.data.map((name) {
                                  print(name);
                                  return    Card(
                                    elevation: 3,
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      width: MediaQuery.of(context).size.width*0.8,
                                      height: 86,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x0f202020),
                                            blurRadius: 20,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          Card(
                                            clipBehavior: Clip.antiAlias,
                                            child: Container(
                                                height: 85,
                                                width: 85,
                                                child: Image.network("http://mamnoon.somee.com/Images/${name["imageName"]}",fit:BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                                                    StackTrace? stackTrace) {
                                                  return  Image.asset("assets/errerImage.jpg");
                                                },)// Image.asset("assets/Rectangle 2.png") ,
                                            ),
                                          ),
                                          SizedBox(width: 16,),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                " ${ name["title"]}" ,   //"بيف برجر كلاسيك 500..."
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  color: Color(0xff1a1a1a),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "\$7.54",
                                                style: TextStyle(
                                                  color: Color(0xff1a1a1a),
                                                  fontSize: 14,
                                                ),
                                              )
                                            ],
                                          )

                                        ],
                                      ),
                                    ),
                                  );
                                },

                                ),





                              ]); }
                        else if (snapshot.hasError) {

                          return Center(child: Text("تأكد من إتصال بالإنرنت"));
                        }
                        // By default, show a loading spinner.
                        return   CarouselSlider(
                            options: CarouselOptions(

                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              viewportFraction: 0.87,
                              height: 140.0,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              autoPlay: true,
                              aspectRatio:  10 / 5,
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                            ),

                            items: [
                        Shimmer.fromColors(

                        baseColor: Color(0xFFF3F3F3),
                        highlightColor: Color(0xFFF5F5F5),
                        enabled: true,
                      
                                child: Card(
                                  elevation: 3,
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    padding: EdgeInsets.all(12),
                                    width: MediaQuery.of(context).size.width*0.8,
                                    height: 86,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x0f202020),
                                          blurRadius: 20,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 95,
                                          child:  Image.asset("assets/Rectangle 2.png") ,
                                        ),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "بيف برجر كلاسيك 500...",
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xff1a1a1a),
                                                fontSize: 16,
                                              ),
                                            ),
                                            Text(
                                              "\$7.54",
                                              style: TextStyle(
                                                color: Color(0xff1a1a1a),
                                                fontSize: 14,
                                              ),
                                            )
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              )




                            ]);}),
                
                  Container(
                    height: MediaQuery.of(context).size.height*0.12,
                  ),
                ],
              ),
            ),


          ],
        ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text(''),
        icon: Icon(Icons.map),
      ),
    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
