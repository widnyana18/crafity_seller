import 'package:flutter/material.dart';
import 'package:crafity/interface/features/pngProduct.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class DetailsBottomBar extends StatelessWidget {
  static Widget crud() {
    return ButtonBar(
      children: <Widget>[
        FlatButton(
          child: Text('Reset'),
          onPressed: () {},
          color: Color(0xFF858585),
          textColor: Color(0xFFD5D5D5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        FlatButton(
          child: Text('Save'),
          onPressed: () {},
          color: Color(0xFFC84C6E),
          textColor: Color(0xFFD5D5D5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );
  }

  static Widget collection() {
    return Row(
      children: [
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: VerticalDivider(color: Color(0xFFD1D1D1)),
        ),
        Text(
          '\$310',
          style: TextStyle(fontSize: 30, color: Color(0xFFA74D76)),
        ),
        SizedBox(width: 12),
        RaisedButton(
          child: Icon(
            Icons.add_shopping_cart,
            color: Color(0xFFD5D5D5),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Color(0xFFA74D76),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var largeScr = ResponsiveLayout.isLargeScreen(context);

    return Row(
      children: [
        Flexible(
          child: ListView.separated(
            itemBuilder: (ctx, idx) {
              return Row(
                children: <Widget>[
                  PngProduct(imageSrc: 'assets/perfume2.png'),
                  SizedBox(width: 12),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Color(0xFFA74D76),
                      ),
                      SizedBox(width: 4),
                      Text('Big'),
                      Text('x2'),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (ctx, idx) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: VerticalDivider(color: Color(0xFFD1D1D1)),
            ),
            itemCount: 2,
            scrollDirection: Axis.horizontal,
          ),
        ),
        SizedBox(width: 15),
        Text(
          '\$310',
          style: TextStyle(fontSize: 30, color: Color(0xFFA74D76)),
        ),
        SizedBox(width: 12),
        RaisedButton(
          child: Icon(
            Icons.add_shopping_cart,
            color: Color(0xFFD5D5D5),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Color(0xFFA74D76),
          onPressed: () {},
        ),
      ],
    );
  }
}
