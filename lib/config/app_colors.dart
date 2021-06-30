import 'package:flutter/material.dart';

class AppColors {
  static Color lightBlue = Color(0xff56CCF2);
  static Color darkBlue = Color(0xff2F80ED);

  static Color lightGreen = Color(0xff6FE37D);
  static Color darkGreen = Color(0xff17CD25);

  static LinearGradient scaffoldBgGradient = LinearGradient(
      colors: [lightBlue, darkBlue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static LinearGradient buttonGreenGradient = LinearGradient(
      colors: [lightGreen, darkGreen],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);
}
