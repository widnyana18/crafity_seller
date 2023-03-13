import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:crafity/interface/features/pngProduct.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class ModelProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: ResponsiveLayout(
        largeScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: List.generate(
                4,
                (idx) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.white30,
                  ),
                ),
              ),
            ),
            Expanded(
              child: CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, idx) =>
                    PngProduct(imageSrc: 'assets/perfume11.png'),
                options: CarouselOptions(
                  aspectRatio: 5 / 12,
                ),
              ),
            ),
            FlatButton(
              shape: CircleBorder(),
              onPressed: () {},
              color: Colors.black45,
              child: Icon(
                Icons.ondemand_video,
                size: 16,
                color: Color(0xFFEFEFEF),
              ),
            ),
          ],
        ),
        smallScreen: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    4,
                    (idx) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.white30,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  shape: CircleBorder(),
                  onPressed: () {},
                  color: Colors.black45,
                  child: Icon(
                    Icons.ondemand_video,
                    size: 16,
                    color: Color(0xFFEFEFEF),
                  ),
                ),
              ],
            ),
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, idx) =>
                  PngProduct(imageSrc: 'assets/perfume11.png'),
              options: CarouselOptions(
                aspectRatio: 5 / 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
