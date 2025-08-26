
abstract class FavoriteEvent {}

class FetchFavorites extends FavoriteEvent {}

class ToggleFavorite extends FavoriteEvent {
  final String type;
  final int ruinId;

  ToggleFavorite({required this.type, required this.ruinId});
}