import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class TextManger extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;
  final TextStyle? style;
  final bool isError;

  const TextManger(
    this.text, {
    super.key,
    this.fontSize,
    this.color,
    this.isError = false,
    this.textAlign,
    this.fontWeight,
    this.height,
    this.maxLines,
    this.overflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      context.translate(text),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: isError ? TextStyleManager.errorStyle : style,
    );
  }
}
