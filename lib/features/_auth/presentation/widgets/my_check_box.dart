import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class MyCheckBox extends StatefulWidget {
  final String hint;
  final Function() onConfirm;
  const MyCheckBox({
    super.key,
    required this.hint,
    required this.onConfirm,
  });

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox.adaptive(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
            });
            if (isChecked) {
              widget.onConfirm();
            }
          },
          checkColor: Colors.white,
          activeColor: ColorManger.primary,
          side: const BorderSide(
            color: ColorManger.primary,
            width: 2.0,
          ),
        ),
         TextManger(
          widget.hint,
          style: TextStyleManager.bodySmall,
        ),
      ],
    );
  }
}
