import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatelessWidget {
  final String message;
  final String? title;

  const MyAlertDialog({
    super.key,
    required this.message,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 8,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: TextManger(
                title ?? context.translate('oops'),
                style: TextStyleManager.bodyLargeBold,
              ),
            ),

            // Message content centered
            Flexible(
              child: SingleChildScrollView(
                child: TextManger(
                  message,
                  style: TextStyleManager.bodyMedium,
                  textAlign: TextAlign.start,
                ),
              ),
            ),

            // OK button centered
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.pop(),
                child: TextManger(
                  context.translate('Ok'),
                  style: const TextStyle(
                    color: ColorManger.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
