import 'package:flutter/material.dart';

import 'package:crafity/interface/screen/details/widget/details_component.dart';
import 'package:crafity/interface/util/utils.dart';

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  BoxDecoration bgCover() {
    var isLarge = ResponsiveLayout.isLargeScreen(context);
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color(0xFF080F29),
          Color(0xFF002775),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      borderRadius: isLarge
          ? BorderRadius.vertical(
              top: Radius.circular(20),
            )
          : BorderRadius.zero,
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          offset: Offset(0, -3),
          blurRadius: 12,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ResponsiveLayout(
      largeScreen: BottomSheet(
        onClosing: () {},
        backgroundColor: Colors.white,
        elevation: 20,
        builder: (ctx) {
          return Container(
            height: size.height * .85,
            decoration: bgCover(),
            child: Row(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: ModelProduct(),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(40),
                      ),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(height: 15),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: size.width * .65,
                                height: 50,
                                child: OverflowBox(
                                  maxWidth: size.width * .68,
                                  maxHeight: 50,
                                  child: HeadDetails(),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(25, 18, 15, 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(
                                    child: ProductDesc(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: VerticalDivider(
                                      color: Color(0xFFD1D1D1),
                                    ),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 60),
                                      child: ReviewProduct(),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 18.0),
                                    child: VerticalDivider(
                                      color: Color(0xFFD1D1D1),
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      children: [
                                        SimilarProductEntry.role(itemList),
                                        Flexible(child: SimilarProductEntry()),
                                        SizedBox(height: 60),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            color: Colors.white,
                            elevation: 15,
                            margin: EdgeInsets.only(right: 18),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              child: DetailsBottomBar(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      smallScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        bottomSheet: BottomSheet(
          builder: (ctx) => SizedBox(
            height: size.height * .74,
            child: ReviewProduct(),
          ),
          onClosing: () {},
        ),
        persistentFooterButtons: <Widget>[
          SizedBox(
            height: 62,
            width: size.width,
            child: DetailsBottomBar(),
          ),
        ],
        body: Center(
          child: Container(
            decoration: bgCover(),
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    expandedHeight: size.height * .6,
                    pinned: true,
                    title: Text(
                      'Mafrodd Linoar',
                      overflow: TextOverflow.fade,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    backgroundColor: Color(0xFF00369D),
                    flexibleSpace: FlexibleSpaceBar(
                      background: ModelProduct(),
                    ),
                  ),
                ];
              },
              body: Container(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeaderDelegate(
                        minHeight: 190,
                        maxHeight: 190,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              HeadDetails(),
                              ProductDesc(),
                              SizedBox(height: 8),
                              reviewBarLite(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeaderDelegate(
                        minHeight: 52,
                        maxHeight: 52,
                        child: SimilarProductEntry.role(itemList),
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.all(12.0),
                      sliver: SimilarProductEntry(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget reviewBarLite() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          border: Border.symmetric(
            vertical: BorderSide(color: Color(0xFFDFDFDF)),
          ),
        ),
        child: ReviewProduct.reviewTile(
          TileAtr(
            photo: 'assets/person.jpg',
            name: 'Maffor lione',
            date: '3 weeks ago',
            msg: 'you interest, check details to get more information. ',
          ),
        ),
      ),
    );
  }

  List<String> itemList = ['Similar', 'Daniel Conte', 'Perfume', 'Young'];
}
