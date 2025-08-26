part of 'verification_code_bloc.dart';

@freezed
class VerificationCodeEvent with _$VerificationCodeEvent {
  const factory VerificationCodeEvent.getCode() = _GetCode;
  const factory VerificationCodeEvent.verifyCode(String code) = _VerifyCode;
  const factory VerificationCodeEvent.startTimer() = _StartTimer;
  const factory VerificationCodeEvent.tickTimer() = _TickTimer;
  const factory VerificationCodeEvent.resetTimer() = _ResetTimer;
}