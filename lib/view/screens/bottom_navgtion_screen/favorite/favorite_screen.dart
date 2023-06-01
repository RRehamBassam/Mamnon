
import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/favorite/no_item_favorite.dart';
import 'package:mamnon/view/screens/googleMap/map_screen.dart';
import 'package:shimmer/shimmer.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
        elevation: 2,
        backgroundColor: Colors.white.withOpacity(0.87),
        title: Image.asset('assets/Vector.png'),
        centerTitle: true,
      ),
      body:Container(
        child:   FutureBuilder<dynamic>(
        future: networkRequest.favoritesResponse(idUser),
        builder: (context, snapshot) {
        if (snapshot.hasData) {
        print(snapshot.data.length);
        return  snapshot.data.length!=0?Container(
            child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount:snapshot.data.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              double scale = 1.0;
              return InkWell(
                onTap: (){
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MapScreen()),
                  );*/
                },
                child: Card(
                  elevation: 2,
                  margin:  EdgeInsets.all(8),
                  child: Container(

                    padding: EdgeInsets.all(12),

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
                      width: 110,
                      height: 105,
                      child: Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        child: Image.network("http://mamnoon.somee.com/Images/${snapshot.data[index]["post"]['imageName']}",fit: BoxFit.fill,errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return  Image.asset("assets/errerImage.jpg");
                        },),
                      ),
                    ),
                   // Image.asset("assets/Rectangle 33.png"),
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
                              "${snapshot.data[index]["post"]["title"]}"  ,//
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

                              child:Image.asset("assets/Group_f.png")//Image.asset("assets/Group_f.png"),
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
                ),
              );}),
      ):NoItemFavorite(); }
    else if (snapshot.hasError) {

      return Center(child: Text("تأكد من إتصال بالإنرنت"));
    }
    // By default, show a loading spinner.
    return Container(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount:10,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            double scale = 1.0;
            return InkWell(
              onTap: (){
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  MapScreen()),
                  );*/
              },
              child:   Shimmer.fromColors(

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
              ),
            );}),
    );}),
      )


    );
  }
}
