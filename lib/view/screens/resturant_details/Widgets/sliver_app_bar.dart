import 'package:flutter/material.dart';

class SliverAppBarBldr extends StatelessWidget {
  const SliverAppBarBldr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      pinned: true,
      centerTitle: false,
      stretch: true,
      expandedHeight: 300.0,
          title: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                child: Image.asset("assets/Rectangle 1391.png"),
              ),
              Text(
                "McDonald’s",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xff1a1a1a),
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              )

            ],
          ),
      flexibleSpace: const FlexibleSpaceBar(

          title: Text(
            "McDonald’s",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xff1a1a1a),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        stretchModes: [StretchMode.zoomBackground],

        background: Image(
          image: AssetImage('assets/Rectangle_23.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
