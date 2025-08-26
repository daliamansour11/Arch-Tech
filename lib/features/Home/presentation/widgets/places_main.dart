import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';

class PlaceMainCard extends StatelessWidget {
  const PlaceMainCard(
      {super.key,
      required this.textKey,
      required this.imagePath,
      required this.onTap});

  final String textKey;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            TextManger(
              textKey,
              style: TextStyleManager.bodyMediumBold,
            ),
          ],
        ),
      ),
    );
  }
}
