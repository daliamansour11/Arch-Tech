import 'package:archtech/core/_constants/svg_constants.dart';
import 'package:archtech/core/extension/locale_on_context.dart';
import 'package:archtech/core/extension/size_on_context.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/my_network_image.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/bloc/google_map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vector_graphics/vector_graphics.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleMapBloc, GoogleMapState>(
      builder: (context, state) {
        return state.maybeWhen(
          pickLocation: (ruins) => PositionedDirectional(
            bottom: context.height * 0.03,
            end: 8,
            start: 8,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 8, bottom: 8, start: 12, end: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextManger(
                            ruins.name.toString(),
                            style: TextStyleManager.titleMedium.copyWith(
                              color: ColorManger.primary,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            spacing: 8,
                            children: [
                              const VectorGraphic(
                                height: 16,
                                loader: AssetBytesLoader(
                                    SvgConstantsAssets.assetsSvgLocation),
                              ),
                              TextManger(
                                ruins.governorateName.toString(),
                                style: TextStyleManager.bodyMediumGrey,
                              ),
                            ],
                          ),
                          TextManger(
                            '${context.translate('Distance')}: ${ruins.distance?.toStringAsFixed(1)} Km',
                            style: TextStyleManager.bodyMediumGrey,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: context.height * 0.03,
                                child: ListView.builder(
                                  itemCount: 5,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return AnimatedCrossFade(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        crossFadeState:
                                            _getRate(ruins.rate) > index
                                                ? CrossFadeState.showSecond
                                                : CrossFadeState.showFirst,
                                        firstChild: const Icon(
                                          Icons.star_outline_sharp,
                                          color: ColorManger.grey,
                                        ),
                                        secondChild: const Icon(
                                          Icons.star,
                                          color: ColorManger.yellow,
                                        ));
                                  },
                                ),
                              ),
                              TextManger(
                                (double.tryParse(ruins.rate) ?? 0)
                                    .toStringAsFixed(1),
                                style: TextStyleManager.bodyMediumGrey,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: MyNetworkImage(url: ruins.image))),
                  ],
                ),
              ),
            ),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  int _getRate(String? rate) {
    if (rate == null || rate.isEmpty) return 0;
    final parsedRate = double.tryParse(rate);
    if (parsedRate == null) return 0;
    return parsedRate.clamp(0, 5).round();
  }
}
