import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:flutter/material.dart';

class ValidateManager {
  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return '${context.translate('Email')} ${context.translate('Required')}';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return context.translate('InvalidEmail');
    }
    return null;
  }
}
