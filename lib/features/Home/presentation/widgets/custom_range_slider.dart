import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/filter_bloc/filter_bloc.dart';
import '../bloc/filter_bloc/filter_event.dart';
import '../bloc/filter_bloc/filter_state.dart';

class CustomRangeSlider extends StatelessWidget {
  const CustomRangeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final currentRange = state.distanceRange;
        return Column(
          children: [
            RangeSlider(
              values: currentRange,
              min: 0,
              max: 1,
              divisions: 3,
              labels: RangeLabels(
                '${_convertSliderToDistance(currentRange.start)} km',
                '${_convertSliderToDistance(currentRange.end) == double.infinity ? '∞' : _convertSliderToDistance(currentRange.end).toStringAsFixed(0)} km',
              ),
              onChanged: (values) {
                context.read<FilterBloc>().add(UpdateDistanceRange(values));
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0 km', style: TextStyle(fontSize: 12)),
                  Text('10 km', style: TextStyle(fontSize: 12)),
                  Text('100 km', style: TextStyle(fontSize: 12)),
                  Text('∞ km', style: TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  double _convertSliderToDistance(double sliderValue) {
    if (sliderValue <= 0.25) return 0;
    if (sliderValue <= 0.5) return 10;
    if (sliderValue <= 0.75) return 100;
    return double.infinity;
  }
}
