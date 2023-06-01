
import 'package:flutter/material.dart';
import 'package:mamnon/view/screens/home/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class OrderSuccessfulScreen extends StatefulWidget {
  const OrderSuccessfulScreen({Key? key}) : super(key: key);

  @override
  _OrderSuccessfulScreenState createState() => _OrderSuccessfulScreenState();
}

class _OrderSuccessfulScreenState extends State<OrderSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          width: 1170,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset("assets/order_placed.png", width: 150, height: 150, color: Theme.of(context).primaryColor),
            SizedBox(height: 20.0),
            Text(
             "تم تقديم الطلب بنجاح",
              style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            ),
            SizedBox(height: 10.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(' 2222: رقم الخاص بالطلبك',
                  style:TextStyle(fontSize:16, )),
            ]),
            SizedBox(height: 30),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextButton(
                   // onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor:Theme.of(context).primaryColor,
                      minimumSize: Size(MediaQuery.of(context).size.width, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          PageTransition(
                            type: PageTransitionType.fade,

                            isIos: true,
                            duration: Duration(milliseconds: 550) ,
                            reverseDuration: Duration(milliseconds: 700),
                            child: HomeScreen(),
                          ),(route)=> false
                      );
                    },
                    child: Text("العودة إلى صفحه الرئيسية", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
            ),)
          ]),
        ),
      ),
    );
  }
}
