// ignore_for_file: must_be_immutable

import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class CustomIconRow extends StatelessWidget {
  bool isprof ;
   CustomIconRow( {
    super.key,
    required this.path,
    required this.label,
    this.isprof=false,
     this.onTap,

      

  });

  final String path;
  final String label;
   VoidCallback? onTap; 

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 190,
        margin: const EdgeInsets.symmetric(vertical: 10),
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 5,
            ),
            TextManger(label, style: TextStyleManager.bodySmallGrey),
            const SizedBox(width: 10),
            VectorGraphic(
              width: 20,
              height: 20,
              loader: AssetBytesLoader(path)
            ),
            const SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
