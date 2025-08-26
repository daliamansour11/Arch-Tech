import 'package:archtech/features/Home/data/models/ruins_model.dart';

import '../../../data/models/historical_information.dart';
import '../../../data/models/runin_details_model.dart';

abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {}

class MainLoaded extends MainState {
  final List<Ruin> ruins;

  MainLoaded(this.ruins);
}

class MainResearchtecherLoaded extends MainState {
  final List<Ruin> ruins;
  final List<HistoricalInformation> historicalInformation;

  MainResearchtecherLoaded({
    required this.ruins,
    required this.historicalInformation,
  });
}

class MainError extends MainState {
  final String message;

  MainError(this.message);
}

class MainRuinDetailsLoaded extends MainState {
  final RuinDetails ruinDetails;

  MainRuinDetailsLoaded(this.ruinDetails);
}
class ReviewStoredSuccessfully extends MainState {
  ReviewStoredSuccessfully();
}
class ArchLoaded extends MainState {
  
  final List<HistoricalInformation> arch;

  ArchLoaded(this.arch);
}

