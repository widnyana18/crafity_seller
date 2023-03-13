import 'package:flutter/material.dart';
import 'package:crafity/interface/features/card/mini_card.dart';

class BookmarkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF64314F),
        title: Text(
          'Bookmark',
          style: TextStyle(
            color: Color(0xFFDFDFDF),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 8,
        itemExtent: 100,
        padding: EdgeInsets.symmetric(horizontal: 15),
        itemBuilder: (ctx, idx) {
          return ProductMiniCard(
            subtitle: <Widget>[
              Flexible(
                child: Text(
                  'Cosmic Gate',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF858585),
                    fontSize: 12,
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
              Text(
                '5.7',
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
                  color: Color(0xFF858585),
                  fontSize: 12,
                ),
              ),
            ],
            hero: 'assets/perfume4.png',
            title: 'Deu Las Perfume',
            bgColorsHero: [0xFF5E686E, 0xFF11222C],
            onTap: () {},
          );
        },
      ),
    );
  }
}
