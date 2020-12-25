import 'package:flutter/material.dart';

class SideWave extends CustomClipper<Path> {
  Path path = Path();
  @override
  Path getClip(Size size) {
    var h = size.height;
    var w = size.width;
    path.moveTo(0, 0);
    path.lineTo(0, h * 0.8);
    path.quadraticBezierTo(w * 0.7, h * 0.4, w * 0.4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
