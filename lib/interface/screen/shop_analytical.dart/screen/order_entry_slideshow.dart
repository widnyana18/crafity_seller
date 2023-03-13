import 'package:crafity/interface/screen/shop_analytical.dart/widgets/analytical_nav_bar.dart';
import 'package:crafity/interface/util/sliver_header_delegate.dart';
import 'package:flutter/material.dart';
import 'package:crafity/interface/features/searchBar.dart';

class OrderEntrySlideView extends StatefulWidget {
  @override
  _OrderEntrySlideViewState createState() => _OrderEntrySlideViewState();
}

class _OrderEntrySlideViewState extends State<OrderEntrySlideView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      bottomNavigationBar: AnalyticalNavBar(),
      persistentFooterButtons: <Widget>[
        Text(
          '22 orders',
          style: TextStyle(
            fontSize: 12,
          ),
        ),
        IconButton(
          icon: Icon(Icons.cancel),
          color: Color(0xFF858585),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.send),
          color: Color(0xFF858585),
          onPressed: () {},
        ),
      ],
      body: NestedScrollView(
        headerSliverBuilder: (ctx, isScroll) => [
          SliverAppBar(
            expandedHeight: 90,
            backgroundColor: Colors.white,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: SearchBar(usePopupMenu: true),
              centerTitle: true,
              background: Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  color: Colors.white,
                  child: Text(
                    'Order Entry',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        body: Center(
          child: CustomScrollView(
            scrollDirection: Axis.horizontal,
            slivers: <Widget>[
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverHeaderDelegate(
                  minHeight: 40,
                  maxHeight: 85,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(12, 22, 12, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: dataTableList.keys
                          .map(
                            (item) => Text(
                              item,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF858585),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  collapseChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: iconLabel
                        .map(
                          (item) => Icon(
                            item,
                            color: Color(0xFF858585),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (ctx, rowIdx) {
                    if (rowIdx.isOdd) {
                      return VerticalDivider();
                    }
                    return LimitedBox(
                      maxWidth: 190,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            dataTableList.values.length + 1,
                            (colIdx) {
                              if (colIdx == 0) {
                                return Expanded(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Checkbox(
                                      value: false,
                                      onChanged: (val) {},
                                    ),
                                  ),
                                );
                              } else if (colIdx == 2) {
                                final products = dataTableList[1][rowIdx]
                                    [rowIdx] as ProductOrderEntity;

                                return Expanded(
                                  child: ListView.builder(
                                    itemBuilder: (ctx, idx) => Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 6),
                                      child: Text(
                                          "${products.product}   (${products.count}) \$${products.price}"),
                                    ),
                                  ),
                                );
                              }
                              return Expanded(
                                child: Align(
                                  alignment: Alignment.center,
                                  child:
                                      Text(dataTableList[colIdx - 1][rowIdx]),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: dataTableList.values.first.length * 2 - 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<IconData> iconLabel = [
    Icons.perm_contact_calendar,
    Icons.format_list_bulleted,
    Icons.account_circle,
    Icons.place,
    Icons.credit_card,
    Icons.date_range
  ];

  Map<String, List<dynamic>> dataTableList = {
    'User': ['Daniel Jack', 'Lion Barck', 'Rainer Vanquin'],
    'Products': <List<ProductOrderEntity>>[
      [
        ProductOrderEntity(
          product: 'Layang',
          count: 2,
          price: 56,
        ),
        ProductOrderEntity(
          product: 'Amaia Mask',
          count: 1,
          price: 66,
        ),
      ],
      [
        ProductOrderEntity(
          product: 'Katana Girl',
          count: 3,
          price: 126,
        ),
      ],
      [
        ProductOrderEntity(
          product: 'Dracula Stone',
          count: 2,
          price: 56,
        ),
        ProductOrderEntity(
          product: 'Liliput',
          count: 1,
          price: 66,
        ),
      ],
    ],
    'Account': [
      'danieljack12@gmail.com, 085666745239',
      'danieljack12@gmail.com, 085666745239',
      'danieljack12@gmail.com, 085666745239'
    ],
    'Address': [
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773',
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773',
      'autem consectetur qui amet Exercitationem, Bali, Indonesia, 15773'
    ],
    'Credit': [
      'Daniel 88 Jack, BCA Mandiri',
      'Daniel 88 Jack, BCA Mandiri',
      'Daniel 88 Jack, BCA Mandiri'
    ],
    'Date': ['05/03/2020', '08/22/202', '09/15/2020'],
  };
}

class ProductOrderEntity {
  ProductOrderEntity({this.product, this.count, this.price});

  final String product;
  final int count;
  final int price;
}
