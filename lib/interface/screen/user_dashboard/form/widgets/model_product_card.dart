import 'package:flutter/material.dart';
import 'package:crafity/interface/features/pngProduct.dart';

class ModelProductCard extends StatelessWidget {
  ModelProductCard({this.model});

  final ModelProductEntity model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 75,
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
            child: PngProduct(imageSrc: 'assets/perfume2.png'),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '\$67 ',
                    style: TextStyle(
                      color: Color(0xFFB4B4B4),
                    ),
                    children: [
                      TextSpan(
                        text: ' \$38',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: sizeList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Text(item),
                        ),
                      )
                      .toList(),
                ),
                SizedBox(height: 8),
                Row(
                  children: colorList
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Color(item),
                            radius: 7,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {},
            color: Color(0xFF858585),
            iconSize: 17,
          ),
        ],
      ),
    );
  }

  List<String> sizeList = ['Big', 'Small'];
  List<int> colorList = [0xFFF66C6C, 0xFF6A446C];
}

class ModelProductEntity {
  ModelProductEntity({
    this.image,
    this.price,
    this.discount,
    this.size,
    this.color,
    this.bgColor,
    this.onDelete,
  });

  final String image;
  final String price;
  final String discount;
  final List<String> size;
  final List<int> color;
  final List<int> bgColor;
  final VoidCallback onDelete;
}
