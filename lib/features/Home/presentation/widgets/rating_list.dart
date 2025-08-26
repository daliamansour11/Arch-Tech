import 'package:archtech/core/theme/color_manger.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_bloc.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RateStarsList extends StatelessWidget {
  const RateStarsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        int stars = state.rating;
        return Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onDoubleTap: () {
                    context.read<FilterBloc>().add(UpdateRating(0));
                  },
                  onTap: () {
                    context.read<FilterBloc>().add(UpdateRating(index + 1));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 550),
                      crossFadeState: stars > index
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: const Icon(
                        Icons.star_outline_sharp,
                        size: 40,
                        color: ColorManger.grey,
                      ),
                      secondChild: const Icon(
                        Icons.star,
                        size: 40,
                        color: ColorManger.yellow,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
