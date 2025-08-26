// ignore_for_file: must_be_immutable

import 'package:archtech/core/theme/color_manger.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int currentPage;
  Color? color;
  DotsIndicator({super.key, required this.currentPage, this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: index == currentPage ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == currentPage
                ? color ?? ColorManger.darkOliveGreen
                : ColorManger.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
