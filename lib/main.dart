import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:mamnon/servise/helperFunctions.dart';
import 'package:mamnon/view/screens/auth/login_screen.dart';
import 'package:mamnon/view/screens/home/home_screen.dart';

import 'package:mamnon/Configs/app_constant.dart';
import 'package:page_transition/page_transition.dart';

import 'view/screens/bottom_navgtion_screen/home/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await translator.init(
    localeType: LocalizationDefaultType.device,
    languagesList: <String>['ar'],

    assetsDirectory: 'assets/lang/',
  );
  runApp(LocalizedApp(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mamnon',
      theme: ThemeData(
        fontFamily: 'Tajawal',

            primaryColor: mamnongreen,
            primaryColorLight: mamnongreen,
            indicatorColor: mamnonLightGreen,
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: translator.delegates,
      locale: translator.locale,
      supportedLocales: translator.locals(),

      home: AnimatedSplashScreen.withScreenFunction(
        splash: 'assets/splash-Screen-01.gif',
        splashIconSize: 750,
        screenFunction: () async{
       /*   translator.setNewLanguage(
                context,
            newLanguage:  'ar' ,
              remember: true,

             );*/
          return fristPage();
            LoginScreen();
        },
        splashTransition: SplashTransition.rotationTransition,
        duration:300,
        pageTransitionType: PageTransitionType.fade,


      ),
    );

  }

}
class fristPage extends StatefulWidget {
   fristPage({Key? key}) : super(key: key);

  @override
  _fristPageState createState() => _fristPageState();
}

class _fristPageState extends State<fristPage> {
late bool userIsLoggedIn;
  @override
  void initState() {
    userIsLoggedIn=false;
    getLoggedInState();
    // TODO: implement initState
    super.initState();
  }
  getLoggedInState() async {
    print("HelperFunctions");
    await HelperFunctions.getUserLoggedInSharedPreference().then((value){
      if(value!=null) {
        setState(() {
          userIsLoggedIn  = value;
        });

      }else{
        HelperFunctions.saveUserLoggedInSharedPreference(false);
        print(value!);
        setState(() {
          userIsLoggedIn  = value;
        });

      }
     print("userIsLoggedIn");
      print(userIsLoggedIn);
    });
  }


  @override
  Widget build(BuildContext context) {
    return userIsLoggedIn?HomeScreen():LoginScreen();
  }
}

