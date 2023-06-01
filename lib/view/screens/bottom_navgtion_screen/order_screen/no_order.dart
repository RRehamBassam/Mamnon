
import 'package:flutter/material.dart';
import 'package:mamnon/Configs/app_constant.dart';

class NoOrder extends StatefulWidget {
  const NoOrder({Key? key}) : super(key: key);

  @override
  _NoOrderState createState() => _NoOrderState();
}

class _NoOrderState extends State<NoOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.5,
                child: Image.asset("assets/box.png",color: mamnongreen,scale: 1.05,)),
            SizedBox(height: 16,),
            Text(
              "لا توجد طلبات",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff1a1a1a),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.15,),
          /*  Padding(
              padding: EdgeInsets.all(8),
              child: TextButton(
                onPressed: (){

                },
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  minimumSize: Size(MediaQuery.of(context).size.width, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("هيا بنا الي الصفحة الرئيسية", style:TextStyle(color: Theme.of(context).accentColor, fontSize: 16)),
              ),
            )*/
          ],
        ),
      ),
    );
  }
}
