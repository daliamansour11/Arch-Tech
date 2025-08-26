import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onTap;
  final Color? textColor;
  final EdgeInsetsDirectional? padding;
  final ShapeBorder? shape;
  const RoundedButton({
    super.key,
    required this.text,
    this.color,
    this.padding,
    this.shape,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap ?? () {},
      child: Card(
        color: color ?? ColorManger.primary,
        shape: shape ?? const StadiumBorder(),
        child: Padding(
          padding: padding ??
              const EdgeInsetsDirectional.symmetric(
                  horizontal: 14, vertical: 12),
          child: Center(
            child: TextManger(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
