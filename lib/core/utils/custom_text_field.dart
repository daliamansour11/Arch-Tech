import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
  });

  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with TextFieldMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      textInputAction: inputAction,
      style: TextStyleManager.bodyMedium,
      obscureText: widget.isPassword && !showPassword,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return '${context.translate(widget.hintText)} ${context.translate('Required')}';
            }
            return null;
          },
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: context.translate(widget.hintText),
          suffixIcon: suffixIcon,
          hintStyle: TextStyleManager.bodyMediumGrey),
    );
  }
}

mixin TextFieldMixin on State<CustomTextField> {
  bool showPassword = false;
  IconData get passwordIcon =>
      showPassword ? Icons.visibility : Icons.visibility_off;
  Widget? get suffixIcon => isPassword
      ? IconButton(
          onPressed: () {
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: Icon(
            passwordIcon,
            color:
                showPassword ? ColorManger.primary : ColorManger.selectionColor,
          ),
        )
      : null;

  bool get isPassword => widget.keyboardType == TextInputType.visiblePassword;

  TextInputAction get inputAction =>
      isPassword ? TextInputAction.done : widget.textInputAction;
}
