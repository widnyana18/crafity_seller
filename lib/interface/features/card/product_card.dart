import 'package:flutter/material.dart';
import 'package:crafity/interface/features/widgets.dart';

class ProductCard extends StatefulWidget {
  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 232,
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
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF080F29),
                    Color(0xFF002775),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  PngProduct(imageSrc: 'assets/perfume11.png'),
                  Positioned(
                    top: -14,
                    right: -8,
                    child: TagButton(
                      label: 'HOT',
                      color: Color(0xFFF66C6C),
                    ),
                  ),
                  Positioned(
                    bottom: -12,
                    right: -12,
                    left: -14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        PopupMenuButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: Color(0xFF858585),
                          ),
                          itemBuilder: (_) {
                            return prodEventItem().map((item) {
                              return PopupMenuItem(
                                child: item,
                                value: item,
                              );
                            }).toList();
                          },
                          // initialValue: initValue,
                          onSelected: (value) {
                            // setState(() => initValue = value);
                          },
                          offset: Offset(0, 120),
                        ),
                        Offstage(
                          offstage: false,
                          child: FlatButton(
                            shape: CircleBorder(),
                            padding: EdgeInsets.zero,
                            color: Colors.black54,
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Color(0xFFEEEEEE),
                              size: 12,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Bleu Da Chennal',
                  maxLines: 1,
                  softWrap: false,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Runner Marcopolo',
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                      ),
                    ),
                    CircleAvatar(backgroundColor: Colors.grey, radius: 3),
                    Row(
                      children: <Widget>[
                        Text(
                          '7.4',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.grey, size: 12),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: '\$67 ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFFB4B4B4),
                        ),
                        children: [
                          TextSpan(
                            text: ' \$87',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '02/2019',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFFB4B4B4),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> prodEventItem() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChoiceChip(
            backgroundColor: Colors.transparent,
            selectedColor: Colors.transparent,
            avatar: Icon(
              Icons.thumb_up,
              color: Color(0xFF858585),
              size: 16,
            ),
            label: Text(
              '4.1k',
              style: TextStyle(
                color: Color(0xFF858585),
              ),
            ),
            onSelected: (_) {},
            selected: false,
          ),
          ChoiceChip(
            backgroundColor: Colors.transparent,
            selectedColor: Colors.transparent,
            avatar: Icon(
              Icons.thumb_down,
              color: Color(0xFF858585),
              size: 16,
            ),
            label: Text(
              '46',
              style: TextStyle(
                color: Color(0xFF858585),
              ),
            ),
            onSelected: (_) {},
            selected: false,
          ),
        ],
      ),
      Text(
        'Share',
        style: TextStyle(
          color: Color(0xFF858585),
        ),
      ),
      Text(
        'Bookmark',
        style: TextStyle(
          color: Color(0xFF858585),
        ),
      ),
    ];
  }

  List<String> crudEventItem = ['Share', 'Add to Collection', 'Edit', 'Delete'];
}
