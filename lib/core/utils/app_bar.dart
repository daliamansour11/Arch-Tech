import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget? myAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    title: TextManger(
      title,
      style: TextStyleManager.headlineLarge,
    ),
  );
}
