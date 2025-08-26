import 'package:archtech/core/_constants/images_constants.dart';
import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/features/_on_boarding/bloc/on_boarding_bloc.dart';
import 'package:archtech/features/_on_boarding/widget/bottom_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = 'onBoarding/';

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingBloc, int>(
        builder: (context, state) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  ImagesConstantsAsset.assetsImagesBackground,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: context.height * 0.01,
                left: context.width * 0.1,
                right: context.width * 0.1,
                child: Image.asset(
                  StringManager.onBoardingImages[state],
                  fit: BoxFit.contain,
                  height: context.height,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: BottomSection(
                  currentPage: state,
                  texts: StringManager.onBoardingTexts,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
