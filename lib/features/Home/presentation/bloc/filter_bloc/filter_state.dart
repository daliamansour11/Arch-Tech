import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter/material.dart';

class FilterState {
  final int rating;
  final RangeValues distanceRange;
  final Set<String> selectedTypes;
  final List<Ruin> filteredRuins;

  const FilterState({
    this.rating = 0,
    this.distanceRange = const RangeValues(0.25, 0.75),
    this.selectedTypes = const {},
    this.filteredRuins = const [],
  });

  FilterState copyWith({
    int? rating,
    RangeValues? distanceRange,
    Set<String>? selectedTypes,
    List<Ruin>? filteredRuins,
  }) {
    return FilterState(
      rating: rating ?? this.rating,
      distanceRange: distanceRange ?? this.distanceRange,
      selectedTypes: selectedTypes ?? this.selectedTypes,
      filteredRuins: filteredRuins ?? this.filteredRuins,
    );
  }
}