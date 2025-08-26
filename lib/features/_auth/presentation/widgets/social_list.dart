import 'dart:io';

import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/_auth/bloc/auth_bloc.dart';
import 'package:archtech/features/_auth/presentation/widgets/role_widget.dart';
import 'package:archtech/features/_auth/presentation/widgets/social_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialList extends StatelessWidget {
  final String? role;

  const SocialList({
    super.key,
    this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                title: const TextManger(
                  'ChooseRole',
                  style: TextStyleManager.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      spacing: 8,
                      children: [
                        Expanded(
                          child: RoleWidget(
                            icon: SvgConstantsAssets.assetsSvgTourist,
                            role: 'Tourist',
                            isActive: false,
                            onTap: () {
                              Navigator.of(context).pop(); // Close dialog
                              // Set as tourist and navigate
                              SessionData.isTourist = true;
                              context.pushNamedAndRemoveUntil(
                                  RouteNames.touristHome);
                            },
                          ),
                        ),
                        Expanded(
                          child: RoleWidget(
                            icon: SvgConstantsAssets.assetsSvgSpecialist,
                            role: 'Specialist',
                            isActive: false,
                            onTap: () {
                              Navigator.of(context).pop(); // Close dialog
                              // Set as researcher and navigate
                              SessionData.isTourist = false;
                              context.pushNamedAndRemoveUntil(
                                  RouteNames.recarcherHomeScreen);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const TextManger(
                      'Cancel',
                      style: TextStyleManager.bodyMediumGrey,
                    ),
                  ),
                ],
              ),
            );
          },
          child: const DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              color: ColorManger.socialBackGround,
            ),
            child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                spacing: 8,
                children: [
                  TextManger('SignInAsGuest'),
                  Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (Platform.isAndroid)
          SocialIcon(
            icon: SvgConstantsAssets.assetsSvgGoogle,
            onTap: () {
              final String? ro = role;
              if (ro != null) {
                context.read<AuthBloc>().add(AuthEvent.registerWithGoogle(ro));
              } else {
                context.read<AuthBloc>().add(const AuthEvent.loginWithGoogle());
              }
            },
          ),
        if (Platform.isIOS)
          SocialIcon(
            icon: SvgConstantsAssets.assetsSvgApple,
            onTap: () {
              final String? ro = role;
              if (ro != null) {
                context.read<AuthBloc>().add(AuthEvent.registerWithApple(ro));
              } else {
                context.read<AuthBloc>().add(const AuthEvent.loginWithApple());
              }
            },
          ),
      ],
    );
  }
}
