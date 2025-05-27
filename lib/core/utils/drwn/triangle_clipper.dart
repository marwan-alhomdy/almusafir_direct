import 'package:flutter/material.dart';

class TriangleClipper extends CustomClipper<Path> {
  final double _top = 40;
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 90 + _top);

    path.lineTo(size.width / 9 * 6, 40 + _top);
    path.quadraticBezierTo(
        size.width / 2, 10 + _top, (size.width / 9 * 3), 40 + _top);
    path.lineTo(0, 90 + _top);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
