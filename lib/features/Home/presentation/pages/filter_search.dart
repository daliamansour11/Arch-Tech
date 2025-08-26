import 'package:archtech/core/utils/custom_button.dart';
import 'package:archtech/core/utils/my_network_image.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:archtech/features/Home/presentation/pages/pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_bar.dart';
import '../../../../core/utils/text_manager.dart';
import '../../../../core/utils/text_style_manager.dart';
import '../bloc/filter_bloc/filter_bloc.dart';
import '../widgets/custom_range_slider.dart';
import '../widgets/rating_list.dart';
import '../widgets/search_category.dart';

class FilterSearch extends StatelessWidget {
  static const routeName = 'filter_search/';
  const FilterSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterBloc(),
      child: Scaffold(
        appBar: myAppBar(context, 'FilterSearch'),
        body: ListView(
          padding: const EdgeInsetsDirectional.all(16),
          children: [
            const SearchCategory(hedLine: 'Type'),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 12),
              child: TextManger(
                'Distance',
                style: TextStyleManager.bodyLarge,
              ),
            ),
            const CustomRangeSlider(),
            const Padding(
              padding:
                  EdgeInsetsDirectional.only(start: 12, bottom: 32, top: 50),
              child: TextManger(
                'Ratings',
                style: TextStyleManager.bodyLarge,
              ),
            ),
            const RateStarsList(),
            const SizedBox(height: 32),
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state.filteredRuins.isEmpty) {
                  return const Center(
                    child: TextManger('NoResults'),
                  );
                }

                final ruins = state.filteredRuins;

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  itemCount: ruins.length,
                  itemBuilder: (context, index) {
                    final ruin = ruins[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => Pic(
                                      ruin: ruin,
                                    )),
                          );
                        },
                        leading: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: MyNetworkImage(url: ruin.image)),
                        title: Text(ruin.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(ruin.type),
                            if (ruin.distance != null)
                              Text('${ruin.distance!.toStringAsFixed(1)} km'),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: double.parse(ruin.rate) >= 1.5
                                        ? Colors.amber
                                        : Colors.grey,
                                    size: 16),
                                Text(ruin.rate),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                return CustomButton(
                    onPressed: () {
                      context.read<FilterBloc>().add(ApplyFilters());
                    },
                    text: 'Apply');
              },
            )
          ],
        ),
      ),
    );
  }
}
