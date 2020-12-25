import 'package:flutter/material.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    print("${size.height}this is path size");
    var path = Path();
    path.lineTo(0, size.height - 60);
    var endPoint = Offset(size.width, size.height - 60);
    var controllPoint = Offset(size.width / 2, size.height);
    path.conicTo(
        controllPoint.dx, controllPoint.dy, endPoint.dx, endPoint.dy, 1);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
