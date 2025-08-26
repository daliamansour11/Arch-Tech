// ignore_for_file: must_be_immutable
import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/bloc/home_bloc.dart';
import 'package:archtech/features/Home/presentation/widgets/user_circlemage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_graphics/vector_graphics.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });
  bool get isTourist => !(SessionData.isTourist ?? false);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const UserCirclemage(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        TextManger(
                          'Welcome',
                          style: TextStyle(
                            color: isTourist ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          SessionData.userModel?.name ?? '',
                          style: TextStyle(
                            color: isTourist ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
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
            Expanded(
              child: Row(children: [
                isTourist
                    ? Expanded(
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(RouteNames.notesScreen);
                          },
                          child: const VectorGraphic(
                            width: 30,
                            height: 30,
                            colorFilter: ColorFilter.mode(
                              ColorManger.darkOliveGreen,
                              BlendMode.srcIn,
                            ),
                            loader: AssetBytesLoader(
                                SvgConstantsAssets.assetsSvgNots),
                          ),
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(RouteNames.notification);
                    },
                    child: Icon(
                      Icons.notifications,
                      color: isTourist
                          ? ColorManger.blackStroke
                          : ColorManger.backGround,
                      size: 28,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        );
      },
    );
  }
}
