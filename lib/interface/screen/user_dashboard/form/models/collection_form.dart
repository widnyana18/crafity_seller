import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:crafity/interface/features/pngProduct.dart';
import 'package:crafity/interface/util/sliver_header_delegate.dart';

class CollectionForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            child: DefaultTabController(
              length: 3,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: TextFormField(
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                        labelText: 'Collection Name',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    sliver: SliverPersistentHeader(
                      delegate: SliverHeaderDelegate(
                        child: TabBar(
                          indicatorColor: Color(0xFFE36789),
                          unselectedLabelColor: Color(0xFF858585),
                          labelColor: Color(0xFFE36789),
                          tabs: [
                            Tab(text: 'Cosmetic'),
                            Tab(text: 'accessories'),
                            Tab(text: 'Magazine'),
                          ],
                          onTap: (idx) {},
                        ),
                        minHeight: 30,
                        maxHeight: 30,
                      ),
                      pinned: true,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (ctx, idx) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.0),
                          child: ListTile(
                            leading: Container(
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xFFB92636),
                                    Color(0xFF2A1416),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:
                                  PngProduct(imageSrc: 'assets/perfume2.png'),
                            ),
                            title: Text(
                              'Deu Las Perfume',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: 'Raleway',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            subtitle: Row(
                              children: [
                                Text(
                                  '6.7',
                                  style: TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 12,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 12,
                                ),
                                SizedBox(width: 8),
                                CircleAvatar(
                                  radius: 2,
                                  backgroundColor: Color(0xFF858585),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '\$22',
                                  style: TextStyle(
                                    color: Color(0xFF858585),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.check_circle_outline),
                              onPressed: () {},
                              color: Color(0xFF858585),
                            ),
                            dense: true,
                          ),
                        );
                      },
                      childCount: 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'Discount',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Slider(
            value: 3.5,
            onChanged: (newVal) {},
            divisions: 5,
            label: '35%',
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    FlutterIcons.calculator_ent,
                    size: 14,
                    color: Color(0xFF858585),
                  ),
                  SizedBox(width: 6),
                  Text(
                    'Discount',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              RichText(
                text: TextSpan(
                  text: '\$67 ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFB4B4B4),
                  ),
                  children: [
                    TextSpan(
                      text: ' \$38',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          RaisedButton(
            child: Text('Build Collection'),
            onPressed: () {},
            color: Color(0xFFE36789),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
