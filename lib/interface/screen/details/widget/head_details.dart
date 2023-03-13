import 'package:flutter/material.dart';
import 'package:crafity/interface/util/responsiveLayout.dart';

class HeadDetails extends StatelessWidget {
  List<ListTile> productMenuList() {
    return [
      ListTile(
        leading: Icon(Icons.bookmark),
        title: Text('Bookmark'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: () {},
      ),
    ];
  }

  List<ListTile> crudMenuList() {
    return [
      ListTile(
        leading: Icon(Icons.library_add),
        title: Text('Add to Collection'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.edit),
        title: Text('Edit'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.delete),
        title: Text('Delete'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.share),
        title: Text('Share'),
        onTap: () {},
      ),
    ];
  }

  Widget featureButton() {
    return Row(
      children: <Widget>[
        Container(
          height: 30,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 3),
                blurRadius: 6,
              ),
            ],
          ),
          child: Row(
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
              CircleAvatar(backgroundColor: Color(0xFF858585), radius: 3),
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
        ),
        PopupMenuButton(
          offset: Offset(0, 120),
          child: RaisedButton(
            child: Icon(
              Icons.expand_more,
              size: 16,
              color: Color(0xFF858585),
            ),
            color: Colors.white,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          itemBuilder: (ctx) {
            return productMenuList().map((item) {
              return PopupMenuItem(
                child: item,
                value: item.title,
              );
            }).toList();
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/person.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daniel Mirowlo',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Monarci Venged XC',
                            style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Offstage(
                      offstage: false,
                      child: IconButton(
                        icon: Icon(
                          Icons.person_add,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 8),
                child:
                    CircleAvatar(backgroundColor: Color(0xFF858585), radius: 3),
              ),
              Text(
                '05/21/2019',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          featureButton()
        ],
      ),
      smallScreen: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/person.jpg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Daniel Mirowlo',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Monarci Venged XC',
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Offstage(
                offstage: false,
                child: IconButton(
                  icon: Icon(
                    Icons.person_add,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              featureButton(),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 8),
                child:
                    CircleAvatar(backgroundColor: Color(0xFF858585), radius: 3),
              ),
              Text(
                '05/21/2019',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
