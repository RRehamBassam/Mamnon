
import 'package:flutter/material.dart';

class NoItemFavorite extends StatefulWidget {
  const NoItemFavorite({Key? key}) : super(key: key);

  @override
  _NoItemFavoriteState createState() => _NoItemFavoriteState();
}

class _NoItemFavoriteState extends State<NoItemFavorite> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/noItem.png"),
        ],
      ),
    );
  }
}
