import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../../core/theme/color_manger.dart';

class CustomIcon extends StatelessWidget {
  final String path;
  final String label;
  final VoidCallback onTap;

  const CustomIcon({
    super.key,
    required this.path,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            VectorGraphic(
              colorFilter: const ColorFilter.mode(
                ColorManger.primary,
                BlendMode.srcIn,
              ),
              loader: AssetBytesLoader(path),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
