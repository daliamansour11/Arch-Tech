import 'package:archtech/core/api/session_data.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FliterByTypeCubit extends Cubit<FilterByTypeState> {
  FliterByTypeCubit()
      : super(FilterByTypeState(type: null, filteredRuins: SessionData.ruins));
  void filterByType(String type) {
    final filteredRuins = SessionData.ruins.where((ruin) => ruin.type == type).toList();
    emit(FilterByTypeState(type: type, filteredRuins: filteredRuins));
  }
}

class FilterByTypeState {
  final String? type;
  final List<Ruin> filteredRuins;

  FilterByTypeState({required this.type, required this.filteredRuins});
}
