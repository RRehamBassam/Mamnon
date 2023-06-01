
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/api/networkrequest.dart';
import 'package:mamnon/view/screens/auth/confirm_screen.dart';
import 'package:mamnon/view/screens/widget/louding.dart';
import 'package:page_transition/page_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  NetworkRequest networkRequest=new NetworkRequest();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'SA';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
  late String PhoneNumberUser="";
  late String PhoneNumberUserLast;
  late String verificationId;
  Future<void> verfiyPhone() async{
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId){
      this.verificationId = verId;
    };
    final PhoneCodeSent smsCodeSent= (String verId, [int? forceCodeResent]) {
      this.verificationId = verId;

      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ConfirmScreen(verificationId :verId,phone: PhoneNumberUser),
      ));


      // smsCodeDialoge(context).then((value){
      //   print("Code Sent");
      // });
    } as PhoneCodeSent;
    final PhoneVerificationCompleted verifiedSuccess= (AuthCredential auth){};
    final PhoneVerificationFailed verifyFailed= (FirebaseAuthException e){
      print('${e.message}');
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: PhoneNumberUser,
      timeout: const Duration(seconds: 5),
      verificationCompleted : verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: autoRetrieve,

    );


  }
  Future<void> signIn2(String smsCode) async{
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,);

    await FirebaseAuth.instance.signInWithCredential(
        credential).then((user) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => ConfirmScreen(),
      ));
    }).catchError((e){
      Fluttertoast.showToast(

          msg: "ادخل كود صحيح",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Color(0xff38672d).withOpacity(0.9),
          textColor: Colors.white,
          fontSize: 16.0
      );
      print(e);
    });
  }
  late bool isload;
  @override
  void initState() {
    isload=false;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
                    flex: WidgetsBinding.instance?.window.viewInsets.bottom == 0.0?2:1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "مرحبا بك ",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xff1a1a1a),
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "مرحباً بك من جديد في تطبيقنا",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff616161),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "رقم الجوال",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xff1a1a1a),
                                  fontSize: 16,
                                ),),
                            ],
                          ),
                        ),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: Container(
                      padding: EdgeInsets.symmetric( vertical: 4,horizontal: 16),
                            width: MediaQuery.of(context).size.width*0.815,
                           // height: MediaQuery.of(context).size.height*0.065,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.00, color:  Color(0xff38672d),), borderRadius: BorderRadius.circular(30.00),
                            ),
                            child: Form(
                              key: formKey,
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Theme(
                                      data: new ThemeData(
                                        primaryColor:  Color(0xFF38672D),
                                        primaryColorDark:Color(0xFF38672D),
                                        primarySwatch: Colors.teal,
                                      ),
                                      child: InternationalPhoneNumberInput(

                                        onInputChanged: (PhoneNumber number) {
                                  print(formKey.toString());
                                  print("22");
                                  setState(() {
                                      PhoneNumberUser=number.phoneNumber!;
                                      PhoneNumberUserLast=number.dialCode!;
                                  });
                                        },
                                        onInputValidated: (bool value) {
                                          print(value);
                                        },
                                        selectorConfig: SelectorConfig(
                                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                        ),
                                        ignoreBlank: false,
                                        autoValidateMode: AutovalidateMode.disabled,
                                        selectorTextStyle: TextStyle(color: Colors.black),
                                        initialValue: number,
                                        textFieldController: controller,
                                        formatInput: true,

                                        keyboardType:
                                        TextInputType.numberWithOptions(signed: true, decimal: true),
                                        inputBorder: InputBorder.none,
                                       // inputBorder: OutlineInputBorder(),
                                        onSaved: (PhoneNumber number) {
                                          print('On Saved: $number');
                                        },
                                      ),
                                    ),
                                /*    ElevatedButton(
                                      onPressed: () {
                                        formKey.currentState?.validate();
                                      },
                                      child: Text('Validate'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                       // getPhoneNumber('+15417543010');
                                      },
                                      child: Text('Update'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        formKey.currentState?.save();
                                      },
                                      child: Text('Save'),
                                    ),*/
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        isload?Loading():    InkWell(
                          onTap: () async {
                            print("$PhoneNumberUser");
                            if(PhoneNumberUser.length>4){
                              if(PhoneNumberUser.length>12){
                               setState(() {
                                 isload=true;
                               });

                             await   verfiyPhone();
                             await  Future<void>.delayed(Duration(seconds:6));
                               setState(() {
                                 isload=false;
                               });
    /* 
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ConfirmScreen(verificationId :"",phone: PhoneNumberUser),
                            ));
                         Navigator.push(context,PageTransition(
                          type: PageTransitionType.fade,

                          isIos: true,
                          duration: Duration(milliseconds: 550) ,
                          reverseDuration: Duration(milliseconds: 700),
                          child: ConfirmScreen(),
                        ));*/ }else{
                                Fluttertoast.showToast(
                                    msg: "ادخل رقم الجوال صحيح",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Color(0xff38672d),
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }

                            }else {
                              Fluttertoast.showToast(
                                  msg: "ادخل رقم الجوال",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,

                                  backgroundColor:Color(0xff38672d),
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                            },
                          child: Container(
                            width: 335,
                            height: 48,
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
                    flex: WidgetsBinding.instance?.window.viewInsets.bottom == 0.0?3:2,
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

    await   networkRequest.LoginWithPhone(PhoneNumberUser).then((value){
      setState(() {
        message  = value;

      });
    });
  }
}
