import 'package:flutter/material.dart';
import 'package:crafity/interface/features/pngProduct.dart';

class ProductMiniCard extends StatelessWidget {
  ProductMiniCard({
    this.hero,
    this.title,
    this.bgColorsHero,
    this.onTap,
    this.subtitle,
    this.trailing,
  });

  final String hero;
  final String title;
  final List<int> bgColorsHero;
  final VoidCallback onTap;
  final List<Widget> subtitle;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {},
        child: Ink(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: bgColorsHero.map((item) => Color(item)),
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: PngProduct(imageSrc: hero),
                    ),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Row(children: subtitle),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 18),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}

class ProductTileData {
  ProductTileData({
    this.hero,
    this.prodName,
    this.company,
    this.rate,
    this.price,
    this.onTap,
    this.colors,
  });

  final String hero;
  final String prodName;
  final String company;
  final double rate;
  final int price;
  final List<int> colors;
  final VoidCallback onTap;
}
