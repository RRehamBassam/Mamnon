import 'package:flutter/material.dart';
import 'package:mamnon/api/networkrequest.dart';



class SearchUser extends SearchDelegate {

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
  NetworkRequest networkRequest=new NetworkRequest();
  @override
  Widget buildResults(BuildContext context) {
    return   FutureBuilder<dynamic>(
        future: networkRequest.search(query),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
         
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
          return Container();});
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child:Container(
        height: MediaQuery.of(context).size.height*0.5,
        width:  MediaQuery.of(context).size.width*0.5,
        child:  Image.asset("assets/5870-removebg-preview.png",),
      ),
    );
  }
}