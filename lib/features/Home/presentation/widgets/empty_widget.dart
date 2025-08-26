import 'package:archtech/core/utils/text_manager.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/_constants/svg_constants.dart';
import '../../../../core/theme/color_manger.dart';

class EmptyWidget extends StatelessWidget {
  final String text;
  const EmptyWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VectorGraphic(
              width: 150,
              height: 150,
              colorFilter:
                  ColorFilter.mode(ColorManger.primary, BlendMode.srcIn),
              loader: AssetBytesLoader(
                SvgConstantsAssets.assetsSvgTourist,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextManger(
              text,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
              color: ColorManger.primary,
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
