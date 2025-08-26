import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;
  final Color? color;
  final Widget? child;
  final ShapeBorder? shape;
  final double? height;
  final double? width;
  final Color? textColor;
  final Color? overlayColor;
  final double? contentPadding;
  final TextStyle? style;

  const CustomButton({
    super.key,
    required this.onPressed,
    this.text,
    this.color,
    this.child,
    this.shape,
    this.height,
    this.width,
    this.textColor,
    this.overlayColor,
    this.contentPadding,
    this.style,
  });

  factory CustomButton.icon({
    Key? key,
    required VoidCallback? onPressed,
    String? text,
    Color? color,
    ShapeBorder? shape,
    double? height,
    double? width,
    Color? textColor,
    Color? overlayColor,
    double? contentPadding,
    TextStyle? style,
    required IconData? icon,
    Widget? iconWidget,
  }) {
    return CustomButton(
      key: key,
      onPressed: onPressed,
      text: text,
      color: color,
      shape: shape,
      height: height,
      width: width,
      textColor: textColor,
      overlayColor: overlayColor,
      contentPadding: contentPadding,
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (text != null) ...[
            TextManger(
              text,
              style: style ??
                  TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const SizedBox(width: 8),
          ],
          iconWidget ?? Icon(icon, color: textColor ?? Colors.white),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: onPressed,
        overlayColor: WidgetStatePropertyAll(overlayColor),
        focusColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Card(
          shape: shape ?? _defaultShape(),
          elevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          color: color ?? ColorManger.primary,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * (contentPadding ?? 0.015),
              ),
              child: child ??
                  CustomButtonText(
                      text: text, style: style, textColor: textColor),
            ),
          ),
        ),
      ),
    );
  }

  ShapeBorder _defaultShape() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    );
  }
}

class CustomButtonText extends StatelessWidget {
  const CustomButtonText({
    super.key,
    required this.text,
    required this.style,
    required this.textColor,
  });

  final String? text;
  final TextStyle? style;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return TextManger(
      text ?? '',
      style: style ??
          TextStyle(
            color: textColor ?? Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}
