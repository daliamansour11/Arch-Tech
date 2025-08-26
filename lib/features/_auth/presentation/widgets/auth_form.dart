import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/core/utils/custom_text_field.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final String title, hintText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputAction textInputAction;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const AuthForm({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 12,
        children: [
          TextManger(
            title,
            style: TextStyleManager.bodyMediumBold,
          ),
          CustomTextField(
            controller: controller,
            hintText: hintText,
            isPassword: isPassword,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            validator: validator,
          )
        ],
      ),
    );
  }
}
