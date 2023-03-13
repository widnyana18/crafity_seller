import 'package:flutter/material.dart';

import 'package:crafity/interface/features/pngProduct.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class SimilarProductEntry extends StatelessWidget {
  static Widget role(List<String> data) {
    return SizedBox(
      height: 52,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (ctx, idx) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ChoiceChip(
              shape: StadiumBorder(
                side: BorderSide(color: Color(0xFF858585)),
              ),
              backgroundColor: Colors.transparent,
              selectedColor: Colors.transparent,
              selected: false,
              onSelected: (i) {},
              label: Text(data[idx]),
            ),
          );
        },
      ),
    );
  }

  Widget productBoxWidget() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: [
              Color(0xFFB92636),
              Color(0xFF2A1416),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(-2, 3),
              blurRadius: 12,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(6),
              child: PngProduct(imageSrc: 'assets/perfume2.png'),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Colors.black54,
                ),
                child: Text('\$46'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, idx) => productBoxWidget(),
      ),
      smallScreen: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        delegate: SliverChildBuilderDelegate(
          (ctx, idx) => productBoxWidget(),
          childCount: 12,
        ),
      ),
    );
  }
}

class ProductBox {
  ProductBox({this.image, this.price, this.onTap, this.bgColor});

  final String image;
  final String price;
  final VoidCallback onTap;
  final List<int> bgColor;
}
