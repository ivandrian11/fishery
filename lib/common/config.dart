// Color
import './size_config.dart';
import 'package:flutter/material.dart';

final defaultMargin = (SizeConfig.safeBlockHorizontal * 7.78).roundToDouble();

// Color
final Color primaryColor = Color(0xff318D90);
final Color mainTextColor = Color(0xff2E3E5C);
final Color secondaryTextColor = Color(0xff9FA5C0);

// TextStyle
final TextStyle inputTextStyle = TextStyle(
  fontSize: (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
);

final TextStyle headingOneTextStyle = TextStyle(
  color: mainTextColor,
  fontSize: (SizeConfig.safeBlockHorizontal * 6.1).roundToDouble(),
  fontWeight: bold,
);
final TextStyle paragraphOneTextStyle = TextStyle(
  color: mainTextColor,
  fontSize: (SizeConfig.safeBlockHorizontal * 4.72).roundToDouble(),
  fontWeight: medium,
);
final TextStyle paragraphTwoTextStyle = TextStyle(
  color: secondaryTextColor,
  fontSize: (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
  fontWeight: medium,
);
final TextStyle textButtonTextStyle = TextStyle(
  color: Colors.white,
  fontSize: (SizeConfig.safeBlockHorizontal * 4.17).roundToDouble(),
  fontWeight: bold,
);

final BorderRadius circularBorder = BorderRadius.all(Radius.circular(32));

// Decoration
final InputDecoration textFieldDecoration = InputDecoration(
  isDense: true,
  errorStyle: TextStyle(height: 0),
  labelStyle: paragraphTwoTextStyle,
  hintStyle: paragraphTwoTextStyle,
  border: OutlineInputBorder(borderRadius: circularBorder),
);

// FontWeight
FontWeight medium = FontWeight.w500;
FontWeight bold = FontWeight.w700;
