import 'package:flutter/material.dart';

import 'package:crafity/interface/features/card/mini_card.dart';

class PurchaseHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, idx) {
        return ProductMiniCard(
          subtitle: <Widget>[
            Flexible(
              child: Text(
                'Cosmic Gate',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Color(0xFF858585),
              ),
            ),
            Text('2'),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Color(0xFF858585),
              ),
            ),
            Text(
              '\$45',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: CircleAvatar(
                radius: 2,
                backgroundColor: Color(0xFF858585),
              ),
            ),
            Text(
              '5h',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
          hero: 'assets/perfume4.png',
          title: 'Deu Las Perfume',
          bgColorsHero: [0xFF5E686E, 0xFF11222C],
          onTap: () {},
        );
      },
      itemCount: 6,
      itemExtent: 96,
    );
  }
}
