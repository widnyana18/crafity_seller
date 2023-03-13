import 'package:flutter/material.dart';

import 'package:crafity/interface/screen/shop_analytical.dart/widgets/widgets.dart';
import 'package:crafity/interface/util/utils.dart';

class SlaesAnalytical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Material(
        color: Color(0xFFF9F9F9),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Material(
                color: Colors.white,
                elevation: 12,
                child: TabBar(
                  indicatorColor: Color(0xFFE36789),
                  unselectedLabelColor: Color(0xFF858585),
                  labelColor: Color(0xFFE36789),
                  tabs: [
                    Tab(text: 'Order Entry'),
                    Tab(text: 'Sale Curves'),
                    Tab(text: 'Product Chart'),
                  ],
                  onTap: (idx) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      OrderEntryTable(),
                      Column(
                        children: [
                          AnalyticalLineChart(),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: Colors.white,
                                  elevation: 8,
                                  child: AnalyticalBarChart(),
                                ),
                              ),
                              SizedBox(width: 8),
                              Flexible(
                                flex: 2,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                  color: Colors.white,
                                  elevation: 8,
                                  child: AnalyticalPieChart(),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(flex: 3, child: AnalyticalScatterChart()),
                          SizedBox(width: 8),
                          Flexible(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              color: Colors.white,
                              elevation: 8,
                              child: BestSellingTable(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      smallScreen: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        bottomNavigationBar: AnalyticalNavBar(),
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (ctx, _) => [
              SliverAppBar(
                backgroundColor: Colors.white,
                elevation: 8,
                floating: true,
                title: Text(
                  'Sales Analysis',
                  style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              SliverPersistentHeader(
                delegate: SliverHeaderDelegate(
                  minHeight: 45,
                  maxHeight: 45,
                  child: TabBar(
                    indicatorColor: Color(0xFFE36789),
                    unselectedLabelColor: Color(0xFF858585),
                    labelColor: Color(0xFFE36789),
                    tabs: [
                      Tab(icon: Icon(Icons.table_chart)),
                      Tab(icon: Icon(Icons.insert_chart)),
                      Tab(icon: Icon(Icons.pie_chart)),
                    ],
                    onTap: (idx) {},
                  ),
                ),
                pinned: true,
              ),
            ],
            body: TabBarView(
              children: [
                CustomScrollView(
                  slivers: <Widget>[
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverHeaderDelegate(
                        maxHeight: 180,
                        minHeight: 40,
                        child: AnalyticalHeader(),
                        collapseChild: Text(
                          'Sale Curves',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: AnalyticalTable(),
                    ),
                  ],
                ),
                AnalyticalBarChart(),
                AnalyticalPieChart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
