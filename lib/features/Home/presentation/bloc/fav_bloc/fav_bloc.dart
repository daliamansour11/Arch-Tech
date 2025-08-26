



import 'package:archtech/features/Home/data/Repo/fav_repo.dart';
import 'package:archtech/features/Home/presentation/bloc/fav_bloc/fav_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'fav_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository repository;

  FavoriteBloc(this.repository) : super(FavoriteInitial()) {
    on<FetchFavorites>(_onFetchFavorites);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  void _onFetchFavorites(FetchFavorites event, Emitter<FavoriteState> emit) async {
    emit(FavoriteLoading());
    try {
      final favorites = await repository.getFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<FavoriteState> emit) async {
    try {
      await repository.toggleFavorite(event.type, event.ruinId);
      final favorites = await repository.getFavorites();
      emit(FavoriteLoaded(favorites));
    } catch (e) {
      emit(FavoriteError(e.toString()));
    }
  }
}