import 'package:flutter/material.dart';

class ShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();    
    
    var firstAxis = Offset(size.width, size.height);
    var secondAxis = Offset(size.width * .75, size.height * .7);
    var thirdAxis = Offset(size.width * .5, size.height * .5);
    var fourAxis = Offset(size.width * .25, size.height * .3);
    var fiveAxis = Offset(size.width * .16, size.height * .4);    
    
    path.lineTo(secondAxis.dx, 0);         
    path.quadraticBezierTo(firstAxis.dx * .9, fourAxis.dy * .4, firstAxis.dx * .96, fourAxis.dy + .8);
    path.quadraticBezierTo(firstAxis.dx, fiveAxis.dy, firstAxis.dx * .98, thirdAxis.dy );
    path.quadraticBezierTo(firstAxis.dx * 0.95, thirdAxis.dy * 1.4, secondAxis.dx * .8, thirdAxis.dy * 1.3);
    path.quadraticBezierTo(secondAxis.dx * .5, thirdAxis.dy * 1.2, thirdAxis.dx * .5, secondAxis.dy * .91);     
    path.quadraticBezierTo(fourAxis.dx * .4, secondAxis.dy, firstAxis.dx * .08, firstAxis.dy * .92);
    path.quadraticBezierTo(fourAxis.dx * .27, secondAxis.dy * 1.38, firstAxis.dx * .04, firstAxis.dy * .98);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }
 
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// class ShapeHeroDetails extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();
    
//     return path;  
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false
// }