import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  static const routeName = 'privacy-policy/';
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'PrivacyPolicy'),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: TextManger('PrivacyPolicyContent',
              style: TextStyleManager.bodyLarge),
        ),
      ),
    );
  }
}
