import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/_settings/presentation/bloc/locale_cubit.dart';
import 'package:archtech/core/_settings/presentation/widgets/language_drop_card.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalePage extends StatelessWidget {
  final bool isLogin;
  static const String route = 'LocalePage/';
  const LocalePage({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'ChooseAppLanguage'),
      resizeToAvoidBottomInset: false,
      body: ListView(
        padding: const EdgeInsetsDirectional.all(16),
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
            child: Center(
                child: Image.asset(
              ImagesConstantsAsset.assetsImagesLocale,
              height: context.height * 0.22,
              fit: BoxFit.cover,
            )),
          ),
          const LanguageDropCard(),
          const SizedBox(height: 32),
          CustomButton(
              onPressed: () {
                context.read<LocaleCubit>().saveLocale();

                if (isLogin) {
                  context.pushNamed(RouteNames.login);
                }
              },
              text: 'Confirm')
        ],
      ),
    );
  }
}
