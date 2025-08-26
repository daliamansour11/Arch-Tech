import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/_on_boarding/bloc/on_boarding_bloc.dart';
import 'package:archtech/features/_on_boarding/bloc/on_boarding_event.dart';
import 'package:archtech/features/_on_boarding/widget/donts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSection extends StatelessWidget {
  final int currentPage;
  final List<String> texts;

  const BottomSection({
    super.key,
    required this.currentPage,
    required this.texts,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.3,
      decoration: const BoxDecoration(
        color: ColorManger.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextManger(
              texts[currentPage],
              style: TextStyleManager.bodyLargeBoldDarkOliveGreen,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            DotsIndicator(currentPage: currentPage),
            const Spacer(),
            if (currentPage < 2)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<OnboardingBloc>().add(ChangePageEvent(2));
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: Size(
                        context.width * 0.25,
                        40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side:
                            const BorderSide(color: ColorManger.darkOliveGreen),
                      ),
                    ),
                    child: const TextManger(
                      'skip',
                      style: TextStyle(
                        color: ColorManger.darkOliveGreen,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<OnboardingBloc>()
                          .add(ChangePageEvent(currentPage + 1));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManger.darkOliveGreen,
                      minimumSize: Size(
                        context.width * 0.4,
                        50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const TextManger(
                      'next',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: () async {
                  Injection.instance.cacheHelper.saveData(
                      key: StringManager.onBoardingCacheKey, value: true);
                  context.pushReplacementNamed(RouteNames.localeScreen,
                      arguments: true);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManger.darkOliveGreen,
                  minimumSize: Size(
                    context.width * 0.8,
                    48,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const TextManger(
                  'StartNow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
