abstract class MainEvent {}

class FetchRuins extends MainEvent {}

class FetchHomeResearchtecher extends MainEvent {}
class FetchArch extends MainEvent {}

class FetchRuinDetails extends MainEvent {
  final int ruinId;

  FetchRuinDetails(this.ruinId);
}
class StoreReview extends MainEvent {
  final int review;
  final int ruinId;

  StoreReview({required this.review, required this.ruinId});
}
class fetchRuinsByType extends MainEvent {
  final String type;
  fetchRuinsByType(this.type);
}
