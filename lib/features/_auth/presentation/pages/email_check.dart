import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:flutter/material.dart';

class VerifyEmail extends StatelessWidget {
  static const routeName = 'verifyEmail/';
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: myAppBar(context, 'EmailVerification'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(
                  height: 32,
                ),
                Center(
                  child: Image.asset(
                    ImagesConstantsAsset.assetsImagesCheckEmail,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                const Center(
                  child: TextManger(
                    'VerificationDescription',
                    style: TextStyleManager.bodyMediumGrey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.only(top: 32, bottom: 16),
                  child: CustomButton(
                    onPressed: () {},
                    text: 'VerifyEmailButton',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
