import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SuccessDialog extends StatelessWidget {
  final String header;
  final String description;

  const SuccessDialog({
    super.key,
    required this.header,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            // Success Icon
            const DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Center(
                child: VectorGraphic(
                  loader: AssetBytesLoader(SvgConstantsAssets.assetsSvgSuccess),
                ),
              ),
            ),

            const SizedBox(height: 32),
            // Header Text
            TextManger(
              header,
              style: TextStyleManager.bodyLargeBold,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 8),
            // Description Text
            TextManger(
              description,
              style: TextStyleManager.bodyMediumGrey.copyWith(
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
