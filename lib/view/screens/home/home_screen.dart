import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';


import 'package:flutter/material.dart';
import 'package:mamnon/Configs/app_constant.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/favorite/favorite_screen.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/home/home.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/order_screen/order_screen.dart';
import 'package:mamnon/view/screens/bottom_navgtion_screen/profile/profile_screen.dart';
//import 'package:mamnon/view/screens/wideget/CircleBottomNavigation.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int currentPage;
  @override
  void initState() {
    currentPage=0;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgettajerAccount = <Widget>[
      Home(),
      FavoriteScreen(),

     OrderScreen(),
      Profile_Screen(),

    ];
    return Scaffold(
        bottomNavigationBar:  CircleBottomNavigation(
          inactiveIconColor: Colors.grey,

          initialSelection: currentPage,
           circleOutline: 18,
           arcWidth: 880,
          arcHeight: 40,
          circleSize: 45,

          tabs: [

            TabData(icon: Icons.home_outlined,title: currentPage==0?'الرئيسية':""),
            TabData(icon: Icons.favorite_outline_rounded,title:  currentPage==1?'المفضلة':""),
            TabData(icon: Icons.article_outlined,title:  currentPage==2?'طلباتي':""),
            TabData(icon: Icons.perm_identity,title: currentPage==3? 'حسابي':""),
          ],

          onTabChangedListener: (index) => setState(() => currentPage = index),
        ),
      body: _widgettajerAccount[currentPage],
    );
  }
}
