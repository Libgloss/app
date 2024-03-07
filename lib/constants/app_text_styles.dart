import 'package:flutter/material.dart';
import 'package:libgloss/constants/app_colors.dart';

class AppTextStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subtitleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  static const TextStyle bodyStyleBold = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: Colors.black,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.accentColor,
  );
}
