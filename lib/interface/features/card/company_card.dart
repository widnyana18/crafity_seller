import 'package:flutter/material.dart';

class CompanyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage('assets/person.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          'Roxy Monrow FT',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Daniel Sircrow',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '17 items',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: Row(
          children: <Widget>[
            Text(
              '6.7',
              style: TextStyle(color: Color(0xFF858585)),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.star,
              size: 16,
              color: Color(0xFF858585),
            ),
          ],
        ),
        onTap: () {},
        dense: true,
        isThreeLine: true,
      ),
    );
  }
}
