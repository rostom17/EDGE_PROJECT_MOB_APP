import 'package:flutter/material.dart';

class ColorPallet {
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color mainBackgroundColor = Color(0xFFF7FCF9);
  static const Color primaryThemeColor = Color(0xFF2DD4BF);
  static const Color secondaryThemeColor = Color(0xFFEF4444);
  static const Color ornageAccent = Color(0xFFFFB045);
  static const Color lightGreyAccent = Color(0xFFE2E8F0);
  static const Color primaryTextColor = Color(0xFF1E293B);
  static const Color secondaryTextColor = Color(0xFF64748B);

  static Color getCardColor(int index) {
    int rem = index % 5;
    switch (rem) {
      case 1:
        return Color(0xFFFCE788);
      case 2:
        return Color(0xFFFFB26B);
      case 3:
        return Color(0xFFF299DC);
      case 4:
        return Color(0xFFD6EEFB);
      default:
        return Color(0xFF80E194);
    }
  }
}
