import 'package:archtech/core/api/session_repository.dart';
import 'package:archtech/core/cache/cash_helper.dart';
import 'package:archtech/features/Home/data/models/ruins_model.dart';
import 'package:archtech/features/Home/data/repo/main_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/historical_information.dart';
import 'main_event.dart';
import 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final CacheHelper cacheHelper;
  final SessionRepository sessionRepository;
  final RuinRepository ruinRepository;

  MainBloc(this.cacheHelper, this.sessionRepository)
      : ruinRepository = RuinRepository(cacheHelper),
        super(MainInitial()) {
    on<FetchRuins>(_onFetchRuins);
    on<FetchHomeResearchtecher>(_onFetchHomeResearchtecher);
    on<FetchRuinDetails>(_onFetchRuinsDetails);
    on<StoreReview>(_onStoreReview);
    on<FetchArch>(_onFetchArch);
    on<fetchRuinsByType>(_onFetchRuinsType);
  }

  Future<void> _onFetchRuins(FetchRuins event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final ruins = await ruinRepository.fetchRuins();

      emit(MainLoaded(ruins));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  Future<void> _onFetchRuinsType(
      fetchRuinsByType event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final ruins = await ruinRepository.fetchRuinsByType(event.type);
      emit(MainLoaded(ruins));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  Future<void> _onFetchHomeResearchtecher(
      FetchHomeResearchtecher event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final results = await Future.wait([
        ruinRepository.fetchRuins(),
        ruinRepository.fetchHistoricalInformation(),
      ]);

      final ruins = results[0] as List<Ruin>;
      final historicalInformation = results[1] as List<HistoricalInformation>;

      emit(MainResearchtecherLoaded(
        ruins: ruins,
        historicalInformation: historicalInformation,
      ));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  Future<void> _onFetchRuinsDetails(
      FetchRuinDetails event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final ruinDetails = await ruinRepository.fetchDetails(event.ruinId);
      emit(MainRuinDetailsLoaded(ruinDetails));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }

  Future<void> _onStoreReview(
      StoreReview event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      await ruinRepository.storeReview(
          review: event.review, ruinId: event.ruinId);
      emit(ReviewStoredSuccessfully());
    } catch (e) {
      emit(ReviewStoredSuccessfully());
    }
  }

  final List<HistoricalInformation> historicalInformation = [];
  Future<void> _onFetchArch(FetchArch event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final arch = await ruinRepository.fetchHistoricalInformation();
      debugPrint('arch: ${arch.length}');
      historicalInformation.addAll(arch);
      emit(ArchLoaded(historicalInformation));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }
}
