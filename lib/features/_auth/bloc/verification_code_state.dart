part of 'verification_code_bloc.dart';

@freezed
class VerificationCodeState with _$VerificationCodeState {
  const factory VerificationCodeState.initial() = _Initial;
  const factory VerificationCodeState.loading() = _Loading;
  const factory VerificationCodeState.resendSuccess() = _ResendSuccess;
  const factory VerificationCodeState.success() = _Success;
  const factory VerificationCodeState.error(String message) = _Error;
  const factory VerificationCodeState.timerTick(int secondsRemaining) = _TimerTick;
}