
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/home/home_screen.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:page_transition/page_transition.dart';

class NameScreen extends StatefulWidget {
  String? phone;
   NameScreen({Key? key,this.phone}) : super(key: key);

  @override
  _NameScreenState createState() => _NameScreenState(phone);
}

class _NameScreenState extends State<NameScreen> {
  String? phone;

  _NameScreenState(this.phone);
late bool isload;
  @override
  void initState() {
    isload=false;
    // TODO: implement initState
    super.initState();
  }
  NetworkRequest networkRequest=new NetworkRequest();
  late String UserName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child:  Image.asset("assets/Asset 1.png"),),
            Container(
              child: Column(
                children: [
                  Expanded(
                      flex:1,
                      child: Container()),
                  Expanded(
                      flex:2,
                      child: Center(child: Image.asset("assets/logo_lagin.png"))),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            "يرجى ادخال اسم المستخدم",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff1a1a1a),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(

                        margin: EdgeInsets.symmetric(horizontal: 8),
                          child: Theme(
                            data: new ThemeData(
                              primaryColor:  Color(0xFF38672D),
                              primaryColorDark:Color(0xFF38672D),
                              primarySwatch: Colors.teal,
                            ),
                            child: TextFormField(

                              decoration: const InputDecoration(

                               suffixIcon: Icon(Icons.person),
                                hintText: 'اسم المستخدم',
                                labelText: 'اسم المستخدم',
                                  focusColor:Color(0xFF38672D),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFF38672D)), //<-- SEE HERE
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:  BorderRadius.all(Radius.circular(30.0)),
                                    borderSide: BorderSide(
                                        width: 1, color: Color(0xFF38672D)), //<-- SEE HERE
                                  ),
                                border: OutlineInputBorder(
                                  borderRadius:  BorderRadius.all(Radius.circular(30.0)),
                                  borderSide: BorderSide(
                                    color:  Color(0xFF38672D),
                                  ),


                                )
                              ),
                             onChanged: (val){
                                setState(() {
                                  UserName=val;
                                });

                                    },
                            ),
                          ),
                        ),

                        isload?Loading() :    InkWell(
                          onTap: () async {
                            if(UserName!=null){
                              setState(() {
                                isload=true;
                              });
                              await getUserSetPass();
                              await getUserSetPass();
                              HelperFunctions.saveUserLoggedInSharedPreference(true);
                              HelperFunctions.saveUserNameSharedPreference(message["applicationUser"]["userName"]);
                              HelperFunctions.saveUserIdSharedPreference(message["applicationUser"]["id"]);
                              HelperFunctions.saveUserPhoneSharedPreference(message["applicationUser"]["phoneNumber"]);
                              Navigator.of(context).pushAndRemoveUntil(
                                  PageTransition(
                                    type: PageTransitionType.fade,

                                    isIos: true,
                                    duration: Duration(milliseconds: 550) ,
                                    reverseDuration: Duration(milliseconds: 700),
                                    child: HomeScreen(),
                                  ),(route)=> false
                              );

                              setState(() {
                                isload=false;
                              });
                            }else{
                              Fluttertoast.showToast(
                                  msg: "ادخل الاسم",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Color(0xff38672d).withOpacity(0.9),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }

                          },
                          child: Container(
                            width: 335,
                            height: 48,
                            margin: EdgeInsets.symmetric(vertical:WidgetsBinding.instance?.window.viewInsets.bottom != 0.0? 0:0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x1e4a935e),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ],
                              color: Color(0xff38672d),
                            ),
                            child: Center(
                              child: Text(
                                "تسجيل",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [


                          ],
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container())
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  var message;
  getUserSetPass() async {

    await   networkRequest.RegisterWithName(phone!,UserName).then((value){
      setState(() {
        message  = value;
        print("$message");

      });
    });
  }
}
