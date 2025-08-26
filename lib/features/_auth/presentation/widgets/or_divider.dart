import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorManger.greyDivider,
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.all(8.0),
          child: TextManger(
            'OR',
            style: TextStyleManager.bodyMediumBold,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: ColorManger.greyDivider,
          ),
        ),
      ],
    );
  }
}
