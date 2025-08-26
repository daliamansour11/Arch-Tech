import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/features/Home/presentation/widgets/banner_image_widget.dart';
import 'package:archtech/features/Home/presentation/widgets/library_ruins_section_widget.dart';
import 'package:archtech/features/Home/presentation/widgets/place_cards_section_widget.dart';
import 'package:archtech/features/_auth/model/user_model.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';
import '../widgets/custom_search.dart';
import '../widgets/header.dart';

// Custom widget for the background image
class BackgroundImageWidget extends StatelessWidget {
  final double height;
  final double width;

  const BackgroundImageWidget({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height: height,
          width: width,
          child: Image.asset(
            'assets/images/homebackgroud.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

// Custom widget for the header and search bar section
class HeaderSectionWidget extends StatelessWidget {
  final double height;

  const HeaderSectionWidget({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Header(),
          ),
          SizedBox(height: context.height / 10),
          const CustomSearchtechBar(isResearchtecher: false),
        ],
      ),
    );
  }
}

// Custom widget for the "Most Famous Places" title
class MostFamousPlacesTitleWidget extends StatelessWidget {
  const MostFamousPlacesTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextManger(
          'MostFamousPlaces',
          style: TextStyleManager.headlineLarge,
        ),
      ),
    );
  }
}

// Custom widget for individual place cards

// Main screen class using CustomScrollView
class MainScreen extends StatelessWidget {
  static const routeName = 'home_screen/';
  final UserModel? user;

  const MainScreen({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageWidget(
              height: context.height * 0.6,
              width: context.width,
            ),
            HeaderSectionWidget(height: context.height),
            Positioned(
              top: context.height / 3,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: const CustomScrollView(
                  slivers: [
                    BannerImageWidget(),
                    SliverToBoxAdapter(child: SizedBox(height: 10)),
                    MostFamousPlacesTitleWidget(),
                    PlaceCardsSectionWidget(),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    LibraryRuinsSectionWidget(),
                    SliverToBoxAdapter(child: SizedBox(height: 100)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
