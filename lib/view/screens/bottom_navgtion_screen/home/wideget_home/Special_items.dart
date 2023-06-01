
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:shimmer/shimmer.dart';

class SpecialItem extends StatefulWidget {
  const SpecialItem({Key? key}) : super(key: key);

  @override
  _SpecialItemState createState() => _SpecialItemState();
}

class _SpecialItemState extends State<SpecialItem> {
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: networkRequest.SpecialItem(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    print(snapshot.data.length);
    return   Container(
      height: 220,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Card(
                      elevation: 3,
                      child: Container(
                        width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image:    new DecorationImage(
                          image: new NetworkImage("http://mamnoon.somee.com/Images/${snapshot.data[0]['imageName']}"),
                        fit: BoxFit.fill,
                      ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1e000000),
                                blurRadius: 4,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        child: Stack(

                          children: [
                            Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001a1a1a), Color(
                                    0xc31a1a1a)], ),
                              ),
                            ),
                            Container(
                              width:  double.maxFinite,
                              margin: EdgeInsets.only(bottom: 6),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("${snapshot.data[0]['title']}",  textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,

                                      fontWeight: FontWeight.w500,
                                    ),)
                                ],
                              ),
                            ),
                          ],
                        ),
  ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Card(elevation: 3,
                      child: Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image:    new DecorationImage(
                              image: new NetworkImage("http://mamnoon.somee.com/Images/${snapshot.data[1]['imageName']}"),
                              fit: BoxFit.fill,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x1e000000),
                                blurRadius: 6,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),child: Stack(

                        children: [
                          Container(

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001a1a1a), Color(
                                  0xc31a1a1a)], ),
                            ),
                          ),
                          Container(
                            width:  double.maxFinite,
                            margin: EdgeInsets.only(bottom: 6),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("${snapshot.data[1]['title']}",  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,

                                    fontWeight: FontWeight.w500,
                                  ),)
                              ],
                            ),
                          ),
                        ],
                      )
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          Expanded(
            flex: 1,
            child: Container(
              height:   double.maxFinite,
              child: Card(
                elevation: 3,
                child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image:    new DecorationImage(
                        image: new NetworkImage("http://mamnoon.somee.com/Images/${snapshot.data[2]['imageName']}"),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1e000000),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),child: Stack(

                  children: [
                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0x001a1a1a), Color(
                            0xc31a1a1a)], ),
                      ),
                    ),
                    Container(
                      width:  double.maxFinite,
                      margin: EdgeInsets.only(bottom: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("${snapshot.data[2]['title']}",  textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,

                              fontWeight: FontWeight.w500,
                            ),)
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ),
          )
        ],
      ),
    );}
    else if (snapshot.hasError) {

      return Center(child: Text("تأكد من إتصال بالإنرنت"));
    }
    // By default, show a loading spinner.
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Shimmer.fromColors(

              baseColor:Color(0xFFF3F3F3),
              highlightColor: Color(0xFFF5F5F5),
              enabled: true,
              child: Card(
                elevation: 3,
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1e000000),
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Image.asset("assets/Group_33495.png")),
              ),
            ),
            SizedBox(height: 8,),
            Shimmer.fromColors(

              baseColor:Color(0xFFF3F3F3),
              highlightColor: Color(0xFFF5F5F5),
              enabled: true,
              child: Card(elevation: 3,
                child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x1e000000),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),child: Image.asset("assets/Group_33501.png")),
              ),
            )
          ],
        ),
        SizedBox(width: 8,),
        Shimmer.fromColors(

          baseColor:Color(0xFFF3F3F3),
          highlightColor: Color(0xFFF5F5F5),
          enabled: true,
          child: Card(
            elevation: 3,
            child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x1e000000),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),child: Image.asset("assets/Group_33500.png")),
          ),
        )
      ],
    );});
  }
}
