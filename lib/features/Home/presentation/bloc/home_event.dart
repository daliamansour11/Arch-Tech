part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getRuins() = _GetRuins;
  const factory HomeEvent.getUserData() = _GetUserData;
}