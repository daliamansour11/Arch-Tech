// ignore_for_file: must_be_immutable
import 'package:archtech/core/_settings/presentation/pages/setting_page.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/widgets/user_circlemage.dart';
import 'package:flutter/material.dart';

class ProfHeader extends StatelessWidget {
  const ProfHeader({super.key});
  bool get isTourist => !(SessionData.isTourist ?? false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserCirclemage(),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextManger(
                    'Welcome',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${SessionData.userModel?.name}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextManger(
                    isTourist ? 'Researcher' : 'Trourist',
                    style: isTourist
                        ? TextStyleManager.bodyMedium
                        : TextStyleManager.bodyMediumWhite,
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 7),
              GestureDetector(
                onTap: () {
                  context.pushNamed(SettingPage.routeName, rootNavigator: true);
                },
                child: const Icon(
                  Icons.list,
                  color: ColorManger.blackStroke,
                  size: 28,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
