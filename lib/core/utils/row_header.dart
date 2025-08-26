import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';

class RowHeader extends StatelessWidget {
  final String headline, textButton;
  final void Function() onPressed;
  const RowHeader({
    super.key,
    required this.headline,
    required this.textButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextManger(
            headline,
            style:
                Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          ),
          TextButton(
            onPressed: onPressed,
            child: TextManger(
              textButton,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: ColorManger.primary, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
