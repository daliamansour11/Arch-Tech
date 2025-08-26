import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_event.dart';
import 'package:archtech/features/Home/presentation/bloc/filter_bloc/filter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<UpdateRating>((event, emit) {
      emit(state.copyWith(rating: event.rating));
    });
    on<UpdateDistanceRange>((event, emit) {
      emit(state.copyWith(distanceRange: event.range));
    });
    on<ToggleTypeSelection>((event, emit) {
      if (state.selectedTypes.contains(event.type)) {
        // If already selected, remove it
        final newTypes = state.selectedTypes.toSet()..remove(event.type);
        emit(state.copyWith(selectedTypes: newTypes));
      } else {
        // If not selected, add it
        final newTypes = state.selectedTypes.toSet()..add(event.type);
        emit(state.copyWith(selectedTypes: newTypes));
      }
    });
    on<ApplyFilters>((event, emit) {
      final filtered = _applyFilters(SessionData.ruins);
      emit(state.copyWith(filteredRuins: filtered));
    });
  }

  List<Ruin> _applyFilters(List<Ruin> ruins) {
    return ruins.where((ruin) {
      // Type filter
      if (state.selectedTypes.isNotEmpty &&
          !state.selectedTypes.contains(ruin.type)) {
        return false;
      }

      // Rating filter
      if (state.rating > 0) {
        final ruinRating = double.tryParse(ruin.rate) ?? 0;
        if (ruinRating < state.rating) {
          return false;
        }
      }

      // Distance filter
      if (ruin.distance != null) {
        final minDistance = _convertSliderToDistance(state.distanceRange.start);
        final maxDistance = _convertSliderToDistance(state.distanceRange.end);

        if (ruin.distance! < minDistance || ruin.distance! > maxDistance) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  double _convertSliderToDistance(double sliderValue) {
    // Convert 0-1 slider values to actual distances
    if (sliderValue <= 0.25) return 0;
    if (sliderValue <= 0.5) return 10;
    if (sliderValue <= 0.75) return 100;
    return double.infinity; // No upper limit
  }
}
