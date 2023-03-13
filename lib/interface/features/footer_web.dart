import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  var value = 'Language';

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Image.asset('assets/bottom-bg.png'),
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: socialMedia(context)
                  .map(
                    (item) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: IconButton(
                        icon: Icon(item, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: company(context).map((item) => item).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: ourTeams.map((item) => item).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: service(context).map((item) => item).toList(),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Feedback',
                      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      width: 400,
                      child: ListTile(
                        title: TextField(),
                        trailing:
                            IconButton(icon: Icon(Feather.send), onPressed: () {}),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Get Apps',
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton.icon(
                          textColor: Colors.white,
                          color: Color(0xFF2E224E),
                          shape: StadiumBorder(),
                          label: Text(
                            'AppStore',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          icon: Icon(Zocial.appstore),
                          onPressed: () {},
                        ),
                        FlatButton.icon(
                          textColor: Colors.white,
                          color: Color(0xFF2E224E),
                          shape: StadiumBorder(),
                          label: Text(
                            'Googleplay',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          icon: Icon(Zocial.googleplay),
                          onPressed: () {},
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('©️2019 Miec99midnight, All right deserved'),
                DropdownButton(
                  items: [
                    DropdownMenuItem(value: 'id', child: Text('Indonesia')),
                    DropdownMenuItem(value: 'en', child: Text('English'))
                  ],              
                  value: value,
                  onChanged: (newValue) {setState(() => value = newValue);},
                  style: TextStyle(fontSize: 15, color: Color(0xFFF5F5F5)),
                  icon: Icon(Icons.keyboard_arrow_down, color: Color(0xFFF5F5F5)),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  List<IconData> socialMedia(BuildContext context) {
    return [
      FlutterIcons.email_box_mco,
      FontAwesome.twitter_square,
      AntDesign.instagram,
      AntDesign.facebook_square,
    ];
  }

  List<Widget> company(BuildContext context) {
    return [
      Text(
        'Company',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      SizedBox(height: 8),
      FlatButton(
        child: Text('Terms & Condition'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('Privacy Policy'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('Our License'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('About Us'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('Blog'),
        onPressed: () {},
      ),
    ];
  }

  List<Widget> service(BuildContext context) {
    return [
      Text(
        'Help',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      SizedBox(height: 8),
      FlatButton(
        child: Text('Notification'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('Support'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('Contact'),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('FAQ'),
        onPressed: () {},
      ),
    ];
  }

  List<Text> get ourTeams => [
        Text(
          'Our Teams',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 1),
        ),
        Text('I Komang Widnyana'),
        Text('Sona Purnamanta'),
        Text('Bagus Aditya'),
        Text('Yossi Iqbal'),
        Text('Agga Permadi'),
      ];
}
