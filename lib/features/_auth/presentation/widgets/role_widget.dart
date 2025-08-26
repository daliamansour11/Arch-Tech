import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class RoleWidget extends StatelessWidget {
  final String icon, role;
  final bool isActive;
  final void Function()? onTap;
  const RoleWidget({
    super.key,
    required this.icon,
    this.onTap,
    required this.role,
    this.isActive = false,
  });

  Color get color => isActive ? ColorManger.primary : Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      child: SizedBox(
        height: context.height * 0.15,
        width: context.width * 0.4,
        child: Card(
          shape: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(color: color),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 12,
            children: [
              VectorGraphic(
                  height: 56,
                  width: 56,
                  loader: AssetBytesLoader(
                    icon,
                  ),
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
              Expanded(
                child: TextManger(
                  role,
                  style: TextStyleManager.bodyLargeGrey
                      .copyWith(color: color, fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
