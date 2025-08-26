import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        visualDensity: VisualDensity.compact,
        fontFamily: StringManager.fontFamily,

        // Color Scheme
        colorScheme: const ColorScheme.light(
          brightness: Brightness.light,
          primary: ColorManger.primary, // Primary color from ColorManager
        ),

        // Text Themes (kept the same as original)
        textTheme: const TextTheme(
          bodySmall: TextStyleManager.bodySmall,
          bodyLarge: TextStyleManager.bodyLarge,
          displayLarge: TextStyleManager.displayLarge,
          headlineMedium: TextStyleManager.headlineMedium,
          headlineLarge: TextStyleManager.headlineLarge,
        ),

        // Button Theme
        buttonTheme: const ButtonThemeData(
          height: 36,
          minWidth: 88,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(2, 2)),
          ),
        ),

        // Other Theme Properties
        scaffoldBackgroundColor:
            ColorManger.backGround, // Changed to match second color
        canvasColor: Colors.white,
        cardColor: Colors.white,
        iconTheme: const IconThemeData(
          color: ColorManger.primary, // Using primary color
        ),

        // Additional Properties
        splashColor: const Color(0x66C8C8C8),
        highlightColor: const Color(0x66BCBCBC),
        dividerColor: const Color(0x1F191C20),
        disabledColor: const Color(0x61000000),
        hoverColor: const Color(0x0A000000),
        focusColor: const Color(0x1F000000),
        hintColor: const Color(0x99000000),
        appBarTheme: const AppBarTheme(),
        dialogTheme: const DialogThemeData(backgroundColor: Colors.white));
  }
}
