part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.singOut() = _SingOut;

  const factory AuthState.registerByGoogle() = _RegisterByGoogle;

  const factory AuthState.loaded(UserModel user) = _Loaded;
  const factory AuthState.error(String message) = _Error;
}
