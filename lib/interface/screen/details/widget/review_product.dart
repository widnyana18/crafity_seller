import 'package:flutter/material.dart';

class ReviewProduct extends StatelessWidget {
  Widget commentField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/person.jpg'),
          radius: 16,
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mafrodd Linoar',
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Row(
              children: <Widget>[
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type Something Here',
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  iconSize: 16,
                  color: Color(0xFF858585),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  static Widget reviewTile(TileAtr data,
      {bool showNavControl = false, bool showReplyBtn = false, Widget child}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(data.photo),
          radius: 16,
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      hoverColor: Color(0xFFE36789),
                      onTap: () {},
                      child: Text(
                        data.name,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      data.date,
                      style: TextStyle(
                        color: Color(0xFF858585),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                Offstage(
                  offstage: !showNavControl,
                  child: IconButton(
                    icon: Icon(Icons.more_vert),
                    iconSize: 16,
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(data.msg),
            SizedBox(height: 6),
            child,
            SizedBox(height: 6),
            Offstage(
              offstage: !showReplyBtn,
              child: Row(
                children: [
                  OutlineButton(
                    child: Text(
                      'reply',
                      style: TextStyle(color: Color(0xFF858585), fontSize: 12),
                    ),
                    shape: StadiumBorder(),
                    color: Color(0xFF858585),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.report),
                    color: Color(0xFF858585),
                    iconSize: 16,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Review',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.rate_review,
                  size: 16,
                  color: Color(0xFF858585),
                ),
                Text(
                  '387',
                  style: TextStyle(color: Color(0xFF858585)),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 6),
        Offstage(
          offstage: false,
          child: commentField(),
        ),
        SizedBox(height: 12),
        Flexible(
          child: ListView(
            children: List.generate(reviewProdList.length, (idx) {
              if (reviewProdList[idx].reply == null) {
                return reviewTile(
                  reviewProdList[idx],
                  showReplyBtn: true,
                );
              }
              return reviewTile(
                reviewProdList[idx],
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xFFF3F3F3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: reviewTile(
                    reviewProdList[idx].reply,
                    showNavControl: true,
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  List<TileAtr> reviewProdList = [
    TileAtr(
      photo: 'assets/person.jpg',
      name: 'Mamang Sinaga',
      date: '2 weeks ago',
      msg: 'Be Yourself and Never Surender. lmao I Joke to You theres lot',
      reply: TileAtr(
        photo: 'assets/person.jpg',
        name: 'Mamang Sinaga',
        date: '2 weeks ago',
        msg: 'Be Yourself and Never Surender. lmao I Joke to You theres lot ',
      ),
    ),
    TileAtr(
      photo: 'assets/person.jpg',
      name: 'Moria Bridg',
      date: '2 weeks ago',
      msg:
          'Be Yourself and Never Surender. lmao I Joke to You theres lot more information',
    ),
    TileAtr(
      photo: 'assets/person.jpg',
      name: 'Yellow Stone',
      date: '2 weeks ago',
      msg:
          'you interest, check details to get more information. you interest, check details to get more information',
    ),
  ];
}

class TileAtr {
  TileAtr({this.photo, this.name, this.date, this.msg, this.reply});

  final String photo;
  final String name;
  final String date;
  final String msg;
  final TileAtr reply;
}
