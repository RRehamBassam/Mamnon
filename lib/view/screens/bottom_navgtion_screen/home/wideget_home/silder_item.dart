
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:shimmer/shimmer.dart';

class SilderItem extends StatefulWidget {
  const SilderItem({Key? key}) : super(key: key);

  @override
  _SilderItemState createState() => _SilderItemState();
}

class _SilderItemState extends State<SilderItem> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return Container(
      child:    FutureBuilder<dynamic>(
          future: networkRequest.SlideImage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.length);
              return   CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    viewportFraction: 0.82,
                    height: 140.0, autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlay: true,
                    aspectRatio:  10 / 9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                  ),

                  items: [
                    ...snapshot.data.map((name) {
                      print(name);
                      return    Image.network("http://mamnoon.somee.com/Images/${name['image']}",
                        fit:BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return  Image.asset("assets/errerImage.jpg");
                      },);
                    },
                      // ItemCarouselSlider([]),
                      // ItemCarouselSlider(),
                      // ItemCarouselSlider(),
                      // ItemCarouselSlider(),
                      // ItemCarouselSlider(),
                    ),

                    //  Image.asset("assets/carouselslider_image.png"),
                    //  Image.asset("assets/carouselslider_image.png"),


                  ]) ; }
            else if (snapshot.hasError) {

              return Center(child: Text("تأكد من إتصال بالإنرنت"));
            }
            // By default, show a loading spinner.
            return CarouselSlider(
                options: CarouselOptions(

                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 1000),
                  viewportFraction: 0.82,
                  height: 140.0, autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  aspectRatio:  10 / 9,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                ),

                items: [
                    Shimmer.fromColors(

                    baseColor: Color(0xFFF3F3F3),
                    highlightColor: Color(0xFFF5F5F5),
                    enabled: true,child: Container(

                      child: Image.asset("assets/carouselslider_image.png"),
                    )),
                    Shimmer.fromColors(

                    baseColor: Color(0xFFF3F3F3),
                    highlightColor: Color(0xFFF5F5F5),
                    enabled: true,child: Container(
                      child: Image.asset("assets/carouselslider_image.png"),
                    )),
                    Shimmer.fromColors(

                    baseColor:Color(0xFFF3F3F3),
                    highlightColor: Color(0xFFF5F5F5),
                    enabled: true,child: Container(
                      child: Image.asset("assets/carouselslider_image.png"),
                    )),
                    // ItemCarouselSlider([]),
                    // ItemCarouselSlider(),
                    // ItemCarouselSlider(),
                    // ItemCarouselSlider(),
                    // ItemCarouselSlider(),


                  //  Image.asset("assets/carouselslider_image.png"),
                  //  Image.asset("assets/carouselslider_image.png"),


                ]) ;}),
    );
  }
}
