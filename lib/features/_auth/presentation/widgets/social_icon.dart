import 'package:archtech/core/theme/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class SocialIcon extends StatelessWidget {
  final String icon;
  final void Function()? onTap;
  const SocialIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap ?? () {},
      child: DecoratedBox(
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(8)), // Const-compatible radius
          ),
          color: ColorManger.socialBackGround,
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 12),
          child: VectorGraphic(
            loader: AssetBytesLoader(icon),
            height: 25,
            width: 28,
          ),
        ),
      ),
    );
  }
}
