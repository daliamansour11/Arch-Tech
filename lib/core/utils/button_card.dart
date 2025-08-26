import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final void Function()? onPressed;
  final String? text;
  final Color? color;
  final Widget? child;
  final Color? textColor;
  final Color? overlayColor;
  final double aspectRatio;
  const ButtonCard({
    super.key,
    required this.onPressed,
    this.text,
    this.overlayColor,
    this.aspectRatio = 5.6,
    this.color = Colors.transparent,
    this.child,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      overlayColor: WidgetStatePropertyAll(overlayColor),
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: color ?? Colors.transparent),
           
            borderRadius: BorderRadius.circular(12)),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Center(
            child: child ??
                TextManger(
                  '$text',
                  style: TextStyle(color: textColor),
                ),
          ),
        ),
      ),
    );
  }
}
