
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/auth/name_Screen.dart';
import 'package:mamnon/view/screens/home/home_screen.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

class ConfirmScreen extends StatefulWidget {
  String? verificationId;
  String? phone;
   ConfirmScreen({Key? key,this.verificationId,this.phone}) : super(key: key);

  @override
  _ConfirmScreenState createState() => _ConfirmScreenState(verificationId!,phone!);
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  String verificationId;
  String phone;
  _ConfirmScreenState(this.verificationId,this.phone);
  NetworkRequest networkRequest=new NetworkRequest();
  late bool isload;
  @override
  void initState() {
    isload=false;
    startTimer();

    super.initState();
  }
  @override
  void dispose() {

    stopTimer();
    super.dispose();
  }

  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1,seconds: 10);
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }
  void stopTimer() {

    countdownTimer!.cancel();

  }
  Future<void> signIn2(String smsCode) async{
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,);
    await   getUserSetPass();

    await FirebaseAuth.instance.signInWithCredential(
        credential).then((user) {

        print("messageboolStatus");
        print(message["boolStatus"]);
      if(message["boolStatus"]){
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
      }else{

        Navigator.push(context,PageTransition(
          type: PageTransitionType.fade,

          isIos: true,
          duration: Duration(milliseconds: 550) ,
          reverseDuration: Duration(milliseconds: 700),
          child: NameScreen(phone:phone),
        ));
      }/*
      Navigator.push(context,PageTransition(
        type: PageTransitionType.fade,

        isIos: true,
        duration: Duration(milliseconds: 550) ,
        reverseDuration: Duration(milliseconds: 700),
        child: HomeScreen(),
      ));*/

    }).catchError((e){
      Fluttertoast.showToast(

          msg: "ادخل كود صحيح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff38056e).withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e);
    });
  }
  String? smsOTP;
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final days = strDigits(myDuration.inDays);
    // Step 7
    final hours = strDigits(myDuration.inHours.remainder(24));
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      body:Container(
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
                      Container(
                     width:   MediaQuery.of(context).size.width*0.68,
                        child: Text(
                        "يرجى الاطلاع على الرسائل تم ارسال رمز التحقق إلى الرقم :$phone",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xff1a1a1a),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex:3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Theme(
                          data: new ThemeData(
                            primaryColor:  Color(0xFF38672D),
                            primaryColorDark:Color(0xFF38672D),
                            primarySwatch: Colors.teal,
                          ),
                          child: Directionality(

                            textDirection: TextDirection.ltr,
                            child: PinEntryTextField(

                              fields: 6,
                              showFieldAsBox: true,
                              onSubmit: (String pin){
                              setState(() {

                                smsOTP=pin;
                              });

                            },),
                          ),
                        ),

                        isload?Loading():    InkWell(
                          onTap: () async {
                            setState(() {
                              isload=true;
                            });
                         await  signIn2(smsOTP!);
                            setState(() {
                              isload=false;
                            });

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
                                "أرسل رمز التحقق",
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

                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:[
                                Text(
                                  "يمكنك إعادة الارسال بعد",
                                  style: TextStyle(
                                    color: Color(0xffa6a6a6),
                                    fontSize: 14,
                                  ),
                                ),

                                SizedBox(width: 8),

                                Text(
                                  "$minutes:$seconds",
                                  style: TextStyle(
                                    color: Color(0xff4a935e),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: (){
                                startTimer();
                                setState(() {

                                });
                              },
                              child: Text(
                                "$minutes:$seconds"=="00:00" ?    "إعادة ارسال رسالة" :"",
                                style: TextStyle(
                                  color: Color(0xff38672d),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
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
    await   networkRequest.LoginWithPhone(phone).then((value){
      setState(() {
        message  = value;
        print("message: $message");

      });
    });
  }
}
