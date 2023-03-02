import 'package:flutter/material.dart';

class AppStyles {
//colors
  static const primaryColor = Color(0xFF4A4A4A);
  static const secondaryColor = Color(0xffC4C4C4);

  //shadow
  static const boxShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.16),
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 0,
    )
  ];

  static const appBarShadow = [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.08),
      offset: Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    )
  ];
}
