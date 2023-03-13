import 'package:flutter/material.dart';

import 'package:crafity/interface/screen/shop_analytical.dart/widgets/widgets.dart';

class SlaesAnalytical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: AnalyticalNavBar(),
      bottomSheet: BottomSheet(
        builder: (ctx) => LimitedBox(
          maxHeight: size * .94,
          child: BestSellingTable(),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        ),
        backgroundColor: Colors.white,
        onClosing: () {},
        elevation: 20,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 8,
            floating: true,
            title: Text(
              'Product Chart',
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.view_list),
                color: Color(0xFFF9F9F9),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: AnalyticalScatterChart(),
          ),
        ],
      ),
    );
  }
}
