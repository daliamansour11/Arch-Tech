import 'package:archtech/core/_settings/model/setting_model.dart';
import 'package:archtech/core/extension/dialog_on_context.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/features/_auth/presentation/pages/sing_out.dart';
import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../../../utils/custom_button.dart';
import '../../../utils/text_style_manager.dart';

class SettingPage extends StatelessWidget {
  static const routeName = 'settings/';
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Settings'),
      body:ListView.builder(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 16),
        itemCount: SettingModel.settings.length + 1,
        physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          // Show Restore Purchases button at the top (index 0)
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: CustomButton.icon(
                onPressed: () {
                  // context.read<UpgradeCubit>().restorePurchases();
                },
                shape: const StadiumBorder(),
                text: 'CancelSubscriptions',
                icon: Icons.bookmark_remove_outlined,
                style: TextStyleManager.bodyLargeWhite
                    .copyWith(color: Colors.white),
              ),
            );
          }

          // Adjust index for settings list
          final setting = SettingModel.settings[index - 1];
          return Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
            child: ListTile(
              onTap: () {
                final route = setting.routeName;
                if (route != null) {
                  context.pushNamed(route,
                      rootNavigator: true, arguments: setting.args);
                } else {
                  context.openDialog(SingOutDialog(
                    isDeleteAccount:
                    index - 1 == SettingModel.settings.length - 1,
                  ));
                }
              },
              leading: VectorGraphic(
                  loader: AssetBytesLoader(setting.icon), height: 24),
              title: TextManger(setting.title),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      )

    );
  }
}
