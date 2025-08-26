import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:flutter/material.dart';

class TextStyleManager {
  // Body Text Styles
  static const TextStyle bodySmall = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  static const TextStyle bodySmallGrey = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  );
   static const TextStyle bodyLargeWhite = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyLargeBold = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyLargeBoldDarkOliveGreen = TextStyle(
    fontFamily: StringManager.fontFamily,
    color: ColorManger.darkOliveGreen,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );
  static const TextStyle errorStyle = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.red,
    letterSpacing: 0.5,
  );

  // Display Text Styles
  static const TextStyle displayLarge = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 57,
    fontWeight: FontWeight.w300,
    color: Colors.black,
    letterSpacing: -0.25,
  );

  // Headline Text Styles
  static const TextStyle headlineMedium = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  // Headline Text Styles
  static const TextStyle headlineMediumWhite = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 19,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMediumRed = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.red,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMediumWhite = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: 0.5,
  );

  static const TextStyle bodyMediumPrimary = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorManger.primary,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyLargePrimary = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: ColorManger.primary,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMediumBold = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMediumWhiteBold = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: Colors.white,
    letterSpacing: 0.5,
  );
  static const TextStyle titleMedium =
      TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold);
  static const TextStyle headlineLargeDarkGrey = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyMediumGrey = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: ColorManger.grey,
    letterSpacing: 0.5,
  );
  static const TextStyle bodyLargeGrey = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: ColorManger.grey,
    letterSpacing: 0.5,
  );
  static const TextStyle labelMediumBold = TextStyle(
    fontFamily: StringManager.fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.black,
    letterSpacing: 0.5,
  );

  // Add more styles as needed
}
