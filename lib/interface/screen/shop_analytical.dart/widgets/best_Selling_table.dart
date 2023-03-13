import 'package:crafity/interface/features/card/mini_card.dart';
import 'package:flutter/material.dart';

class BestSellingTable extends StatelessWidget {
  Widget separator(int idx) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15),
        Text(
          '20${idx.toString()}',
          style: TextStyle(
            color: Color(0xFF858585),
          ),
        ),
        SizedBox(width: 15),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0),
      child: Column(
        children: <Widget>[
          Text(
            'Best Selling 10 Years',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18),
          Expanded(
            child: ListView.separated(
              itemCount: 11,
              itemBuilder: (ctx, idx) {
                if (idx == 0) {
                  return SizedBox(height: 15);
                }
                return LimitedBox(
                  maxHeight: 70,
                  child: ProductMiniCard(
                    bgColorsHero: [0xFF00369D, 0xFF000B23],
                    hero: 'assets/perfume11.png',
                    title: 'Growell Potion',
                    onTap: () {},
                  ),
                );
              },
              separatorBuilder: (ctx, idx) => separator(idx),
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellingTile {
  BestSellingTile({this.year, this.photo, this.title, this.sold});

  final int year;
  final String photo;
  final String title;
  final int sold;
}
