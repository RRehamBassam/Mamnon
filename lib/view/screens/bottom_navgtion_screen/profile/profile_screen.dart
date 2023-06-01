
import 'package:flutter/material.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/profile/icon_profile.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);

  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
   String userName="";
   String userPhone="";

  getNameUserState() async {
    print("HelperFunctions");
    await HelperFunctions.getUserNemeSharedPreference().then((value){
      setState(() {
          userName  = value! ;
        });
    });
  }
  getPhoneUsreState() async {
    print("HelperFunctions");
    await HelperFunctions.getUserPoneSharedPreference().then((value){
      setState(() {
        userPhone  = value!;
      });

    });
  }
  @override
  void initState() {
    getNameUserState();
    getPhoneUsreState();
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
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          children: [
        Expanded(
          flex: 1,
            child: Container(

              padding: EdgeInsets.all(8),

              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xfff2f2f2),
              ),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffe4e4e4),
                    ),
                    child: Center(child: Icon(Icons.perm_identity,color: Colors.black45,)),
                  ),
                  SizedBox(width: 12,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        userName!=null?"$userName":"اسم المستخدم",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff1a1a1a),
                          fontSize: 14,
                        ),

                      ),
                      SizedBox(height: 4,),
                      Text(
                        userPhone!=null?"$userPhone": "رقم الجوال",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xff1a1a1a),
                          fontSize: 14,
                        ),)
                    ],
                  )
                ],

              ),
            )),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(

                        children: [
                          Expanded(
                            flex:1,
                            child: Row(children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xfffce7e4),
                                ),
                                child: Center(
                                  child: Image.asset("assets/Frame_p.png",scale: 0.8),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "كمية التوفير",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 12,
                                    ),),
                                  SizedBox(height: 4,),
                                  Text(
                                    "(0) وجبة",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 14,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                ],
                              )
                            ],),
                          ),
                          Expanded(
                            flex:1,
                            child: Row(children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xffcfeac8),
                                ),
                                child: Center(
                                  child: Image.asset("assets/doler.png",scale: 0.8,),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "مبلغ التوفير",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 12,
                                    ),),
                                  SizedBox(height: 4,),
                                  Text(
                                    "0 \$",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xff1a1a1a),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),


                                ],
                              )
                            ],),
                          )

                        ],
                              ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.75,
                    color: Colors.grey,
                    height: 1,
                  ),
                ],
              ),
            )),
            Expanded(flex: 5,
                child: Icon_Profile()),
            Expanded(
              flex: 1,
                child: Container())
            
          ],
        ),
      ),
    );
  }
}
