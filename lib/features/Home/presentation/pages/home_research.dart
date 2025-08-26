import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/data/models/historical_information.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/main_bloc/main_state.dart';
import 'package:archtech/features/Home/presentation/widgets/custom_search.dart';
import 'package:archtech/features/Home/presentation/widgets/grid_image.dart';
import 'package:archtech/features/Home/presentation/widgets/header.dart';
import 'package:archtech/features/Home/presentation/widgets/library_container.dart';
import 'package:archtech/features/Home/presentation/widgets/tool_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'archaeological_info.dart';
import 'archaeological_library.dart';

class HomeResearcher extends StatelessWidget {
  static const routeName = 'resercher_screen/';
  const HomeResearcher({super.key});

  // Mock data for LibraryOfNearbyInscription loading state
  List<Ruin> get mockRuins => List.generate(
        4,
        (index) => Ruin(
          id: index,
          rate: '0',
          name: 'Loading...',
          description: 'Fetching details...',
          image: '',
          type: 'Loading...',
          governorateId: 0,
          regionId: 0,
          workDate: '',
          createdAt: '',
          updatedAt: '',
          lat: 0.0,
          lang: 0.0,
          governorateName: 'Loading...',
          regionName: 'Loading...',
          isFav: false,
        ),
      );
      
  // Mock data for archaeologicalInfo loading state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Header(),
              const SizedBox(height: 30),
              const CustomSearchtechBar(isResearchtecher: true),
              const TextManger(
                'researchtech_tools_guide',
                style: TextStyleManager.bodyLargeBold,
              ),
              SizedBox(
                height: 80,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CustomIconRow(
                      path: SvgConstantsAssets.assetsSvgResearch,
                      label: 'documentation_tools',
                      onTap: () {
                        openLink('https://archtech-app.com/tool-auth/');
                      },
                    ),
                    const SizedBox(width: 10),
                    CustomIconRow(
                      path: SvgConstantsAssets.assetsSvgDigital,
                      label: 'digital_processing',
                      onTap: () {
                        openLink('https://archtech-app.com/digi-process/');
                      },
                    ),
                    const SizedBox(width: 10),
                    CustomIconRow(
                      path: SvgConstantsAssets.assetsSvgResearch,
                      label: 'language_analysis',
                      onTap: () {
                        openLink('https://archtech-app.com/tools/');
                      },
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const TextManger(
                    'LibraryOfNearbyInscription',
                    style: TextStyleManager.headlineLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ArchaeologicalLibrary()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const TextManger(
                      'ShowMore',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  List<Ruin> ruins = [];
                  if (state is MainLoading) {
                    ruins = mockRuins;
                  } else if (state is MainLoaded) {
                    ruins = state.ruins;
                  } else if (state is MainError) {
                    return Center(child: Text(state.message));
                  }
                  return Skeletonizer(
                    enabled: state is MainLoading,
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: ruins.length,
                        itemBuilder: (context, index) {
                          final ruin = ruins[index];
                          debugPrint('ruin: ${ruin.description}');
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: LibraryContainer(ruin: ruin),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const TextManger(
                    'archtechaeologicalInfo',
                    style: TextStyleManager.headlineLarge,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ArchaeologicalInfo()),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: const TextManger(
                      'ShowMore',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              BlocBuilder<MainBloc, MainState>(
                builder: (context, state) {
                  final List<HistoricalInformation> historicalInfo =
                      context.read<MainBloc>().historicalInformation;
                  if (state is MainError) {
                    return const Center(
                        child: Text('تحقق من الاتصال بالانترنت'));
                  }

                  return Skeletonizer(
                    enabled: state is MainLoading,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: historicalInfo.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final info = historicalInfo[index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 8,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextManger(
                                        info.title,
                                        style:
                                            TextStyleManager.bodyLarge.copyWith(
                                          color: ColorManger.primary,
                                        ),
                                      ),
                                      TextManger(
                                        info.description,
                                        style: TextStyleManager.bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: GridImage(
                                    aspectRatio: 1.2,
                                    imagePath: info.imageUrl,
                                    id: info.id,
                                    type: '',
                                    isFavorite: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
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
