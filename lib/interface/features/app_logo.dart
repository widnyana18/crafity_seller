import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Color bgColor;

  AppLogo({this.bgColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(context, '/home');
      },
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
        ),
        child: Text(
          'M',
          style: TextStyle(
            color: bgColor == Color(0xFFEEEEEE)
                ? Color(0xFF82415F)
                : Color(0xFFEEEEEE),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
