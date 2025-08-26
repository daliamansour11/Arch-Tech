import 'package:flutter/material.dart';

abstract class FilterEvent {}

class UpdateRating extends FilterEvent {
  final int rating;
  UpdateRating(this.rating);
}

class UpdateDistanceRange extends FilterEvent {
  final RangeValues range;
  UpdateDistanceRange(this.range);
}

class ToggleTypeSelection extends FilterEvent {
  final String type;
  ToggleTypeSelection(this.type);
}
class ApplyFilters extends FilterEvent {}