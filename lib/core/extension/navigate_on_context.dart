import 'package:archtech/config/routes/animation/fade_animation.dart';
import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  pushNamed(String page, {Object? arguments, bool rootNavigator = false}) =>
      Navigator.of(this, rootNavigator: rootNavigator).pushNamed(
        page,
        arguments: arguments,
      );
  pushNamedAndRemoveUntil(String page, {Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(page, (route) => false,
          arguments: arguments);

  pop() => Navigator.of(this).pop();
  void safePop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  popParams(bool result) => Navigator.pop(this, result);

  pushReplacementNamed(String page, {Object? arguments}) =>
      Navigator.of(this).pushReplacementNamed(page, arguments: arguments);
  push(Widget page) => Navigator.push(this, FadeRoute(page));
  pushReplacement(Widget page) =>
      Navigator.pushReplacement(this, FadeRoute(page));
  pushAndRemoveUntil(Widget page) => Navigator.pushAndRemoveUntil(
        this,
        FadeRoute(page),
        (route) => false,
      );
  popAndPushNamed(String page, {Object? arguments}) =>
      Navigator.of(this).popAndPushNamed(page, arguments: arguments);
}
