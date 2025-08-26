import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/app_bar.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/bloc/cubit/fliter_by_type_cubit.dart';
import 'package:archtech/features/Home/presentation/widgets/grid_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Runintype extends StatelessWidget {
  static const String routeName = 'runinType/';
  const Runintype({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FliterByTypeCubit(),
        child: Scaffold(
          appBar: myAppBar(context, 'MostFamousPlaces'),
          body: BlocBuilder<FliterByTypeCubit, FilterByTypeState>(
            builder: (context, state) {
              final ruins = state.filteredRuins;

              return Column(
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: ListView.builder(
                      itemCount: StringManager.types.length,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsetsDirectional.all(8),
                      itemBuilder: (context, index) {
                        final type = StringManager.types[index];
                        final isSelected = state.type == type;
                        return GestureDetector(
                          onTap: () {
                            context
                                .read<FliterByTypeCubit>()
                                .filterByType(type);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            margin: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected
                                    ? ColorManger.primary
                                    : Colors.black,
                              ),
                              color: isSelected
                                  ? ColorManger.primary
                                  : Colors.white,
                            ),
                            child: Center(
                              child: TextManger(
                                type,
                                style: TextStyleManager.bodyMedium.copyWith(
                                  fontSize: 15,
                                  color:
                                      isSelected ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (ruins.isEmpty)
                    const Expanded(
                      child: Center(
                        child: TextManger(
                          'EmptyData',
                          style: TextStyleManager.errorStyle,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.all(12),
                        itemCount: ruins.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 8,
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) => GridItem(
                          title: ruins[index].name,
                          location: ruins[index].regionName,
                          status: 'open',
                          rating: double.parse(ruins[index].rate),
                          imagePath: ruins[index].image,
                          id: ruins[index].id,
                          isFavorite: ruins[index].isFav,
                        ),
                      ),
                    )
                ],
              );
            },
          ),
        ));
  }
}
