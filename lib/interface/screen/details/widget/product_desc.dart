import 'package:flutter/material.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class ProductDesc extends StatelessWidget {
  Widget calculateProduct() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Text(
            '03',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF858585),
            ),
          ),
          SizedBox(width: 8),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 15,
                height: 15,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.add),
                  iconSize: 14,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 15,
                height: 15,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.minimize),
                  iconSize: 14,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  Widget detailsDesc() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Offstage(
              offstage: false,
              child: calculateProduct(),
            ),
            SizedBox(width: 25),
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
          'Size Product',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: List.generate(
            sizeProd.length,
            (idx) => Padding(
              padding: EdgeInsets.only(right: 18.0),
              child: RadioListTile(
                value: idx,
                groupValue: _selectedSize,
                onChanged: (value) {},
                title: Text(
                  sizeProd[idx],
                  style: TextStyle(color: Colors.black),
                ),
                activeColor: Color(0xFFE36789),
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 6),
        Row(
          children: List.generate(
            sizeProd.length,
            (idx) => Padding(
              padding: EdgeInsets.only(right: 12.0),
              child: OutlineButton(
                shape: CircleBorder(),
                color: idx == 0 ? Color(colorCircle[0]) : Colors.transparent,
                child: CircleAvatar(
                  backgroundColor: Color(colorCircle[idx]),
                  radius: 9,
                ),
                onPressed: () {},
              ),
            ),
          ),
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
              'Mafrodd Linoar',
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
            detailsDesc(),
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
            body: detailsDesc(),
          ),
        ],
      ),
    );
  }

  List<int> colorCircle = [0xFFe76781, 0xFF080F29, 0xFFA5668B];

  List<String> tagData = [
    'awesome',
    'flower',
    'big',
    'minimalism',
  ];

  int _selectedSize = 0;

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

class TagProduct {
  TagProduct(this.title, {this.onTap});

  final String title;
  final VoidCallback onTap;
}
