import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/_auth/presentation/widgets/role_widget.dart';
import 'package:flutter/material.dart';

class StartJourney extends StatefulWidget {
  static const String routeName = 'start-journey/';
  const StartJourney({super.key});

  @override
  State<StartJourney> createState() => _StartJourneyState();
}

class _StartJourneyState extends State<StartJourney> {
  String? selectedRole;

  void selectRole(String? role) {
    setState(() {
      selectedRole = selectedRole == role ? null : role;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'StartJourney'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: AspectRatio(
                      aspectRatio: 4 / 2,
                      child: Image.asset(
                        ImagesConstantsAsset.startJourney,
                      )),
                ),
                const Center(
                  child: TextManger(
                    'ChooseRole',
                    textAlign: TextAlign.center,
                    style: TextStyleManager.bodyLargeGrey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoleWidget(
                        icon: SvgConstantsAssets.assetsSvgTourist,
                        role: 'Tourist',
                        isActive: selectedRole == StringManager.userRole,
                        onTap: () => selectRole(StringManager.userRole),
                      ),
                      RoleWidget(
                        icon: SvgConstantsAssets.assetsSvgSpecialist,
                        role: 'Specialist',
                        isActive: selectedRole == StringManager.specialRole,
                        onTap: () => selectRole(StringManager.specialRole),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: CustomButton(
                color: selectedRole != null ? ColorManger.primary : Colors.grey,
                onPressed: () {
                  if (selectedRole != null) {
                    context.pushNamed(RouteNames.register,
                        arguments: selectedRole);
                  }
                },
                text: 'Next'),
          ),
        ],
      ),
    );
  }
}
