import 'package:archtech/core/_constants/string_manager.dart';
import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/core/utils/text_manager.dart';
import 'package:archtech/core/utils/text_style_manager.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/filter_bloc/filter_bloc.dart';
import '../bloc/filter_bloc/filter_event.dart';

class SearchCategory extends StatelessWidget {
  final String hedLine;
  const SearchCategory({super.key, required this.hedLine});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final selectedTypes = state.selectedTypes;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 12),
                child: TextManger(
                  hedLine,
                  style: TextStyleManager.bodyLarge,
                ),
              ),
              const SizedBox(height: 16),
              FractionallySizedBox(
                widthFactor: 1.1,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: ListView.builder(
                    itemCount: StringManager.types.length,
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsetsDirectional.only(start: 16, bottom: 8),
                    itemBuilder: (context, index) {
                      final type = StringManager.types[index];
                      final isSelected = selectedTypes.contains(type);
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<FilterBloc>()
                              .add(ToggleTypeSelection(type));
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
                            color:
                                isSelected ? ColorManger.primary : Colors.white,
                          ),
                          child: Center(
                            child: TextManger(
                              type,
                              style: TextStyleManager.bodyMedium.copyWith(
                                fontSize: 15,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
