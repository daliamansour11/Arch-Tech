import 'dart:developer';

import 'package:archtech/config/routes/names.dart';
import 'package:archtech/core/extension/navigate_on_context.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/injection.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../../core/_constants/svg_constants.dart';
import '../../../_on_boarding/widget/donts.dart';
import '../../data/models/runin_details_model.dart';
import '../bloc/main_bloc/main_bloc.dart';
import '../bloc/main_bloc/main_event.dart';
import '../bloc/main_bloc/main_state.dart';
import '../widgets/custom_icon.dart';
import '../widgets/places_card.dart';
import '../widgets/rate_daialog.dart';
import 'comments.dart';
import 'package:url_launcher/url_launcher.dart';

class Pic extends StatelessWidget {
  static const routeName = 'pic';

  final Ruin ruin;

  const Pic({super.key, required this.ruin});
  int get ruinId => ruin.id;
  // Mock data for loading state
  RuinDetails get mockRuinDetails => RuinDetails(
        id: ruinId,
        name: 'Loading...',
        description: 'Fetching details...',
        image: '',
        rate: '0',
        is_fav: false,
        totalComments: 0,
        distance: 0,
        type: 'Loading...',
        nearbyPlaces: List.generate(
          3,
          (index) => NearbyPlace(
            id: index,
            name: 'Loading...',
            description: 'Fetching details...',
            image: '',
            type: 'Loading...',
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);

    return BlocProvider(
      create: (context) => MainBloc(
          Injection.instance.cacheHelper, Injection.instance.sessionRepository)
        ..add(FetchRuinDetails(ruinId)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: BlocBuilder<MainBloc, MainState>(
              builder: (context, state) {
                RuinDetails ruinDetails =
                    mockRuinDetails; // Default to mock data
                if (state is MainLoading) {
                  ruinDetails = mockRuinDetails;
                } else if (state is MainRuinDetailsLoaded) {
                  ruinDetails = state.ruinDetails;
                } else if (state is MainError) {
                  return Center(child: Text(state.message));
                }

                return Skeletonizer(
                  enabled: state is MainLoading,
                  child: _buildLoadedContent(
                    screenHeight,
                    currentPageNotifier,
                    ruinDetails,
                    ruin,
                    context,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadedContent(
      double screenHeight,
      ValueNotifier<int> currentPageNotifier,
      RuinDetails ruinDetails,
      Ruin ruin,
      BuildContext context) {
    debugPrint('Ruin: ${ruin.description}');
    return Column(
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: SizedBox(
                height: screenHeight * 0.45,
                width: double.infinity,
                child: ValueListenableBuilder<int>(
                  valueListenable: currentPageNotifier,
                  builder: (context, currentPage, child) {
                    return PageView.builder(
                      onPageChanged: (int page) {
                        currentPageNotifier.value = page;
                      },
                      itemCount: ruinDetails.image.length,
                      itemBuilder: (context, index) {
                        return Image.network(
                          ruinDetails.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/temple.png',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 120,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  'assets/images/temple.png',
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                );
                              },
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: ValueListenableBuilder<int>(
                valueListenable: currentPageNotifier,
                builder: (context, currentPage, child) {
                  return DotsIndicator(
                    currentPage: currentPage,
                    color: ColorManger.primary,
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextManger(
                ruinDetails.name,
                style: TextStyleManager.bodyLargeBold,
              ),
              TextManger(
                ruinDetails.type,
                style: TextStyleManager.bodyMediumGrey,
              ),
              const SizedBox(height: 10),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                spacing: context.width * 0.04,
                runAlignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 32,
                children: [
                  CustomIcon(
                    path: SvgConstantsAssets.assetsSvgSound,
                    label: 'VO',
                    onTap: () {
                      openLink('https://archtech-app.com/vo/');
                    },
                  ),
                  CustomIcon(
                    onTap: () {
                      openLink('https://archtech-app.com/vr/');
                    },
                    path: SvgConstantsAssets.assetsSvgVR,
                    label: 'VR',
                  ),
                  CustomIcon(
                    onTap: () {
                      showRatingDialog(
                        context,
                        initialRating: double.parse(ruinDetails.rate),
                        totalReviews: 200,
                        id: ruinDetails.id,
                      );
                    },
                    path: SvgConstantsAssets.assetsSvgStar,
                    label: ruinDetails.rate,
                  ),
                  CustomIcon(
                    onTap: () {
                      context.pushNamed(RouteNames.showRuinOnMap,
                          arguments: ruin);
                    },
                    path: SvgConstantsAssets.assetsDistance,
                    label: (ruinDetails.distance / 100).toString(),
                  ),
                  CustomIcon(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              Comments(ruinId: ruinDetails.id),
                        ),
                      );
                    },
                    path: SvgConstantsAssets.assetsComment,
                    label: ruinDetails.totalComments.toString(),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              const TextManger(
                'description',
                style: TextStyleManager.bodyLargeBold,
              ),
              const SizedBox(height: 10),
              TextManger(
                ruin.description,
                style: TextStyleManager.bodyMediumGrey,
              ),
              const SizedBox(height: 40),
              const TextManger(
                'similar_places_nearby',
                style: TextStyleManager.bodyLargeBold,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ruinDetails.nearbyPlaces.length,
                  itemBuilder: (context, index) {
                    final place = ruinDetails.nearbyPlaces[index];
                    log(ruinDetails.nearbyPlaces[index].name.toString());
                    log(ruinDetails.nearbyPlaces.length.toString());
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        width: 150,
                        child: PlaceCard(
                          id: place.id,
                          textKey: place.name,
                          imagePath: place.image,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void showRatingDialog(BuildContext context,
    {required double initialRating,
    required int totalReviews,
    required int id}) {
  showDialog(
    context: context,
    builder: (context) => RatingDialog(
      initialRating: initialRating,
      id: id,
    ),
  );
}

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  } else {
    throw 'Could not launch $url';
  }
}
