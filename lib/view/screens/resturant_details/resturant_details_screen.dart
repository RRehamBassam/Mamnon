
import 'package:flutter/material.dart';
import 'package:mamnon/view/screens/resturant_details/Widgets/sliver_app_bar.dart';
import 'package:mamnon/view/screens/resturant_details/Widgets/sliver_list.dart';
import 'package:mamnon/view/screens/resturant_details/Widgets/sliver_search.dart';

class ResturantDetailsScreen extends StatefulWidget {
  const ResturantDetailsScreen({Key? key}) : super(key: key);

  @override
  _ResturantDetailsScreenState createState() => _ResturantDetailsScreenState();
}

class _ResturantDetailsScreenState extends State<ResturantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text("الرجوع"),
        actions: [

          Icon(Icons.search_rounded),
          Icon(Icons.shopping_bag_outlined)
        ],
        backgroundColor: Colors.white.withOpacity(0),
      ),**/
body: CustomScrollView(
  slivers: [

    SliverAppBarBldr(),
    SliverSearch(),
    SliverListBldr(),
  ],
),
    );
  }
}
