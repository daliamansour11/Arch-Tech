// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationCodeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeEventCopyWith<$Res> {
  factory $VerificationCodeEventCopyWith(VerificationCodeEvent value,
          $Res Function(VerificationCodeEvent) then) =
      _$VerificationCodeEventCopyWithImpl<$Res, VerificationCodeEvent>;
}

/// @nodoc
class _$VerificationCodeEventCopyWithImpl<$Res,
        $Val extends VerificationCodeEvent>
    implements $VerificationCodeEventCopyWith<$Res> {
  _$VerificationCodeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetCodeImplCopyWith<$Res> {
  factory _$$GetCodeImplCopyWith(
          _$GetCodeImpl value, $Res Function(_$GetCodeImpl) then) =
      __$$GetCodeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCodeImplCopyWithImpl<$Res>
    extends _$VerificationCodeEventCopyWithImpl<$Res, _$GetCodeImpl>
    implements _$$GetCodeImplCopyWith<$Res> {
  __$$GetCodeImplCopyWithImpl(
      _$GetCodeImpl _value, $Res Function(_$GetCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetCodeImpl with DiagnosticableTreeMixin implements _GetCode {
  const _$GetCodeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeEvent.getCode()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeEvent.getCode'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCodeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) {
    return getCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) {
    return getCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) {
    if (getCode != null) {
      return getCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) {
    return getCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) {
    return getCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) {
    if (getCode != null) {
      return getCode(this);
    }
    return orElse();
  }
}

abstract class _GetCode implements VerificationCodeEvent {
  const factory _GetCode() = _$GetCodeImpl;
}

/// @nodoc
abstract class _$$VerifyCodeImplCopyWith<$Res> {
  factory _$$VerifyCodeImplCopyWith(
          _$VerifyCodeImpl value, $Res Function(_$VerifyCodeImpl) then) =
      __$$VerifyCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String code});
}

/// @nodoc
class __$$VerifyCodeImplCopyWithImpl<$Res>
    extends _$VerificationCodeEventCopyWithImpl<$Res, _$VerifyCodeImpl>
    implements _$$VerifyCodeImplCopyWith<$Res> {
  __$$VerifyCodeImplCopyWithImpl(
      _$VerifyCodeImpl _value, $Res Function(_$VerifyCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
  }) {
    return _then(_$VerifyCodeImpl(
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyCodeImpl with DiagnosticableTreeMixin implements _VerifyCode {
  const _$VerifyCodeImpl(this.code);

  @override
  final String code;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeEvent.verifyCode(code: $code)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeEvent.verifyCode'))
      ..add(DiagnosticsProperty('code', code));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyCodeImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyCodeImplCopyWith<_$VerifyCodeImpl> get copyWith =>
      __$$VerifyCodeImplCopyWithImpl<_$VerifyCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) {
    return verifyCode(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) {
    return verifyCode?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) {
    return verifyCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) {
    return verifyCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) {
    if (verifyCode != null) {
      return verifyCode(this);
    }
    return orElse();
  }
}

abstract class _VerifyCode implements VerificationCodeEvent {
  const factory _VerifyCode(final String code) = _$VerifyCodeImpl;

  String get code;

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyCodeImplCopyWith<_$VerifyCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartTimerImplCopyWith<$Res> {
  factory _$$StartTimerImplCopyWith(
          _$StartTimerImpl value, $Res Function(_$StartTimerImpl) then) =
      __$$StartTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartTimerImplCopyWithImpl<$Res>
    extends _$VerificationCodeEventCopyWithImpl<$Res, _$StartTimerImpl>
    implements _$$StartTimerImplCopyWith<$Res> {
  __$$StartTimerImplCopyWithImpl(
      _$StartTimerImpl _value, $Res Function(_$StartTimerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartTimerImpl with DiagnosticableTreeMixin implements _StartTimer {
  const _$StartTimerImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeEvent.startTimer()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeEvent.startTimer'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) {
    return startTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) {
    return startTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) {
    return startTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) {
    return startTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) {
    if (startTimer != null) {
      return startTimer(this);
    }
    return orElse();
  }
}

abstract class _StartTimer implements VerificationCodeEvent {
  const factory _StartTimer() = _$StartTimerImpl;
}

/// @nodoc
abstract class _$$TickTimerImplCopyWith<$Res> {
  factory _$$TickTimerImplCopyWith(
          _$TickTimerImpl value, $Res Function(_$TickTimerImpl) then) =
      __$$TickTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TickTimerImplCopyWithImpl<$Res>
    extends _$VerificationCodeEventCopyWithImpl<$Res, _$TickTimerImpl>
    implements _$$TickTimerImplCopyWith<$Res> {
  __$$TickTimerImplCopyWithImpl(
      _$TickTimerImpl _value, $Res Function(_$TickTimerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TickTimerImpl with DiagnosticableTreeMixin implements _TickTimer {
  const _$TickTimerImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeEvent.tickTimer()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeEvent.tickTimer'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TickTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) {
    return tickTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) {
    return tickTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) {
    if (tickTimer != null) {
      return tickTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) {
    return tickTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) {
    return tickTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) {
    if (tickTimer != null) {
      return tickTimer(this);
    }
    return orElse();
  }
}

abstract class _TickTimer implements VerificationCodeEvent {
  const factory _TickTimer() = _$TickTimerImpl;
}

/// @nodoc
abstract class _$$ResetTimerImplCopyWith<$Res> {
  factory _$$ResetTimerImplCopyWith(
          _$ResetTimerImpl value, $Res Function(_$ResetTimerImpl) then) =
      __$$ResetTimerImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetTimerImplCopyWithImpl<$Res>
    extends _$VerificationCodeEventCopyWithImpl<$Res, _$ResetTimerImpl>
    implements _$$ResetTimerImplCopyWith<$Res> {
  __$$ResetTimerImplCopyWithImpl(
      _$ResetTimerImpl _value, $Res Function(_$ResetTimerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetTimerImpl with DiagnosticableTreeMixin implements _ResetTimer {
  const _$ResetTimerImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeEvent.resetTimer()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeEvent.resetTimer'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetTimerImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCode,
    required TResult Function(String code) verifyCode,
    required TResult Function() startTimer,
    required TResult Function() tickTimer,
    required TResult Function() resetTimer,
  }) {
    return resetTimer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getCode,
    TResult? Function(String code)? verifyCode,
    TResult? Function()? startTimer,
    TResult? Function()? tickTimer,
    TResult? Function()? resetTimer,
  }) {
    return resetTimer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCode,
    TResult Function(String code)? verifyCode,
    TResult Function()? startTimer,
    TResult Function()? tickTimer,
    TResult Function()? resetTimer,
    required TResult orElse(),
  }) {
    if (resetTimer != null) {
      return resetTimer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCode value) getCode,
    required TResult Function(_VerifyCode value) verifyCode,
    required TResult Function(_StartTimer value) startTimer,
    required TResult Function(_TickTimer value) tickTimer,
    required TResult Function(_ResetTimer value) resetTimer,
  }) {
    return resetTimer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetCode value)? getCode,
    TResult? Function(_VerifyCode value)? verifyCode,
    TResult? Function(_StartTimer value)? startTimer,
    TResult? Function(_TickTimer value)? tickTimer,
    TResult? Function(_ResetTimer value)? resetTimer,
  }) {
    return resetTimer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCode value)? getCode,
    TResult Function(_VerifyCode value)? verifyCode,
    TResult Function(_StartTimer value)? startTimer,
    TResult Function(_TickTimer value)? tickTimer,
    TResult Function(_ResetTimer value)? resetTimer,
    required TResult orElse(),
  }) {
    if (resetTimer != null) {
      return resetTimer(this);
    }
    return orElse();
  }
}

abstract class _ResetTimer implements VerificationCodeEvent {
  const factory _ResetTimer() = _$ResetTimerImpl;
}

/// @nodoc
mixin _$VerificationCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationCodeStateCopyWith<$Res> {
  factory $VerificationCodeStateCopyWith(VerificationCodeState value,
          $Res Function(VerificationCodeState) then) =
      _$VerificationCodeStateCopyWithImpl<$Res, VerificationCodeState>;
}

/// @nodoc
class _$VerificationCodeStateCopyWithImpl<$Res,
        $Val extends VerificationCodeState>
    implements $VerificationCodeStateCopyWith<$Res> {
  _$VerificationCodeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl with DiagnosticableTreeMixin implements _Initial {
  const _$InitialImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.initial'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VerificationCodeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl with DiagnosticableTreeMixin implements _Loading {
  const _$LoadingImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VerificationCodeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ResendSuccessImplCopyWith<$Res> {
  factory _$$ResendSuccessImplCopyWith(
          _$ResendSuccessImpl value, $Res Function(_$ResendSuccessImpl) then) =
      __$$ResendSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResendSuccessImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$ResendSuccessImpl>
    implements _$$ResendSuccessImplCopyWith<$Res> {
  __$$ResendSuccessImplCopyWithImpl(
      _$ResendSuccessImpl _value, $Res Function(_$ResendSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResendSuccessImpl
    with DiagnosticableTreeMixin
    implements _ResendSuccess {
  const _$ResendSuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.resendSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.resendSuccess'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResendSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return resendSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return resendSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (resendSuccess != null) {
      return resendSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return resendSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return resendSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (resendSuccess != null) {
      return resendSuccess(this);
    }
    return orElse();
  }
}

abstract class _ResendSuccess implements VerificationCodeState {
  const factory _ResendSuccess() = _$ResendSuccessImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl with DiagnosticableTreeMixin implements _Success {
  const _$SuccessImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.success()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.success'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements VerificationCodeState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl with DiagnosticableTreeMixin implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.error(message: $message)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.error'))
      ..add(DiagnosticsProperty('message', message));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VerificationCodeState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerTickImplCopyWith<$Res> {
  factory _$$TimerTickImplCopyWith(
          _$TimerTickImpl value, $Res Function(_$TimerTickImpl) then) =
      __$$TimerTickImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int secondsRemaining});
}

/// @nodoc
class __$$TimerTickImplCopyWithImpl<$Res>
    extends _$VerificationCodeStateCopyWithImpl<$Res, _$TimerTickImpl>
    implements _$$TimerTickImplCopyWith<$Res> {
  __$$TimerTickImplCopyWithImpl(
      _$TimerTickImpl _value, $Res Function(_$TimerTickImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? secondsRemaining = null,
  }) {
    return _then(_$TimerTickImpl(
      null == secondsRemaining
          ? _value.secondsRemaining
          : secondsRemaining // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerTickImpl with DiagnosticableTreeMixin implements _TimerTick {
  const _$TimerTickImpl(this.secondsRemaining);

  @override
  final int secondsRemaining;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'VerificationCodeState.timerTick(secondsRemaining: $secondsRemaining)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'VerificationCodeState.timerTick'))
      ..add(DiagnosticsProperty('secondsRemaining', secondsRemaining));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerTickImpl &&
            (identical(other.secondsRemaining, secondsRemaining) ||
                other.secondsRemaining == secondsRemaining));
  }

  @override
  int get hashCode => Object.hash(runtimeType, secondsRemaining);

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerTickImplCopyWith<_$TimerTickImpl> get copyWith =>
      __$$TimerTickImplCopyWithImpl<_$TimerTickImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() resendSuccess,
    required TResult Function() success,
    required TResult Function(String message) error,
    required TResult Function(int secondsRemaining) timerTick,
  }) {
    return timerTick(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? resendSuccess,
    TResult? Function()? success,
    TResult? Function(String message)? error,
    TResult? Function(int secondsRemaining)? timerTick,
  }) {
    return timerTick?.call(secondsRemaining);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? resendSuccess,
    TResult Function()? success,
    TResult Function(String message)? error,
    TResult Function(int secondsRemaining)? timerTick,
    required TResult orElse(),
  }) {
    if (timerTick != null) {
      return timerTick(secondsRemaining);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ResendSuccess value) resendSuccess,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_TimerTick value) timerTick,
  }) {
    return timerTick(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_ResendSuccess value)? resendSuccess,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_TimerTick value)? timerTick,
  }) {
    return timerTick?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ResendSuccess value)? resendSuccess,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_TimerTick value)? timerTick,
    required TResult orElse(),
  }) {
    if (timerTick != null) {
      return timerTick(this);
    }
    return orElse();
  }
}

abstract class _TimerTick implements VerificationCodeState {
  const factory _TimerTick(final int secondsRemaining) = _$TimerTickImpl;

  int get secondsRemaining;

  /// Create a copy of VerificationCodeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerTickImplCopyWith<_$TimerTickImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
