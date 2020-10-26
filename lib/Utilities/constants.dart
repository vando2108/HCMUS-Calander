import 'package:flutter/material.dart';

final Color kPrimaryDarkColor = Color(0xff222327);
final Color kPrimaryLightColor = Color(0xff2B3147);

TextStyle dayStyle(FontWeight fontWeight) {
  return TextStyle(color: Colors.white, fontWeight: fontWeight);
}

final kBoxDecorationStyle = BoxDecoration(
  color: kPrimaryLightColor,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);
