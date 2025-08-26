part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.login() = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.register(String role) = _Register;
  const factory AuthEvent.loginWithGoogle() = _LoginWithGoogle;
  const factory AuthEvent.registerWithGoogle(String role) = _RegisterWithGoogle;
  const factory AuthEvent.deleteAccount() = _DeleteAccount;
  const factory AuthEvent.loginWithApple() = _LoginWithApple;
  const factory AuthEvent.registerWithApple(String role) = _RegisterWithApple;
}
