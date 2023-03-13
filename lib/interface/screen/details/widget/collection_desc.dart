import 'package:flutter/material.dart';
import 'package:crafity/interface/screen/details/widget/product_desc.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class CollectionDesc extends StatelessWidget {
  Widget overviewProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            4,
            (idx) => Icon(
              Icons.star,
              color: Color(0xFFE36778),
            ),
          )..add(
              Icon(
                Icons.star_border,
                color: Color(0xFFE36778),
              ),
            ),
        ),
        Text(
          'Rate 7.4 / 10',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        CircleAvatar(backgroundColor: Color(0xFF858585), radius: 3),
        Text(
          ' 1450 sold',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget collectionDescWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: '\$67 ',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFB4B4B4),
                ),
                children: [
                  TextSpan(
                    text: ' \$38',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Product Details',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xFF858585),
          ),
        ),
        Text(
          'Marina Newvise',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '8.2',
              style: TextStyle(color: Color(0xFF858585)),
            ),
            Icon(Icons.star, size: 16, color: Color(0xFF858585)),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 8),
              child: CircleAvatar(
                backgroundColor: Color(0xFF858585),
                radius: 3,
              ),
            ),
            Text(
              '2 items',
              style: TextStyle(color: Color(0xFFE36789)),
            ),
          ],
        ),
        Text(
          'Description',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'met consectetur adipisicing elit. Exercitationem tempore impedit'
          'autem consectetur qui am met consectetur adipisicing elit.'
          'Exercitationem tempor you interest, check details to get more information.'
          'you interest, check details to get more  you interest, check details to get more'
          'ctetur adipisicing elit. Exercitationem tempor you interest, check details to get mo',
        ),
        Wrap(
          children: List.generate(
            tagProduct.length,
            (idx) => ActionChip(
              label: Text(tagProduct[idx].title),
              onPressed: tagProduct[idx].onTap,
              shape: StadiumBorder(side: BorderSide(color: Color(0xFF858585))),
              backgroundColor: Colors.transparent,
              labelStyle: TextStyle(
                color: Color(0xFF858585),
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Gold Chest Collection',
              overflow: TextOverflow.fade,
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            overviewProduct(),
            SizedBox(height: 10),
            collectionDescWidget(),
          ],
        ),
      ),
      smallScreen: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.only(
          top: 12,
          bottom: 8,
        ),
        expansionCallback: (panelIndex, isExpanded) => null,
        children: [
          ExpansionPanel(
            isExpanded: false,
            headerBuilder: (ctx, isExpanded) => overviewProduct(),
            body: collectionDescWidget(),
          ),
        ],
      ),
    );
  }

  List<String> tagData = [
    'awesome',
    'flower',
    'big',
    'minimalism',
  ];

  List<String> sizeProd = [
    'Big',
    'Medium',
    'Small',
  ];

  List<TagProduct> tagProduct = [
    TagProduct('Hot', onTap: () {}),
    TagProduct('Perfume', onTap: () {}),
    TagProduct('New', onTap: () {}),
    TagProduct('Botle', onTap: () {}),
  ];
}
