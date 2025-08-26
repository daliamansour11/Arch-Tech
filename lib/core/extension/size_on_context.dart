import 'package:flutter/material.dart';

extension MediaQueryValue on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  // For tablets and larger devices
  bool get isTablet => width > 600;

  // Paddings
  double get smallPadding => height * 0.01;
  TextScaler get textScaleFactor {
    return MediaQuery.textScalerOf(this);
  }

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;

  double get mediumPadding => height * 0.02;
  double get largePadding => height * 0.04;
  int get maxLines {
    switch (height) {
      case > 700:
        return 9;

      default:
        return 7;
    }
  }
}
