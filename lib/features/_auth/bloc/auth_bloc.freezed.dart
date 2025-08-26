// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AuthEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AuthEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$LoginImplCopyWith<$Res> {
  factory _$$LoginImplCopyWith(
          _$LoginImpl value, $Res Function(_$LoginImpl) then) =
      __$$LoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginImpl>
    implements _$$LoginImplCopyWith<$Res> {
  __$$LoginImplCopyWithImpl(
      _$LoginImpl _value, $Res Function(_$LoginImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginImpl implements _Login {
  const _$LoginImpl();

  @override
  String toString() {
    return 'AuthEvent.login()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return login();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return login?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class _Login implements AuthEvent {
  const factory _Login() = _$LoginImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'AuthEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements AuthEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$RegisterImplCopyWith<$Res> {
  factory _$$RegisterImplCopyWith(
          _$RegisterImpl value, $Res Function(_$RegisterImpl) then) =
      __$$RegisterImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$RegisterImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterImpl>
    implements _$$RegisterImplCopyWith<$Res> {
  __$$RegisterImplCopyWithImpl(
      _$RegisterImpl _value, $Res Function(_$RegisterImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
  }) {
    return _then(_$RegisterImpl(
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterImpl implements _Register {
  const _$RegisterImpl(this.role);

  @override
  final String role;

  @override
  String toString() {
    return 'AuthEvent.register(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      __$$RegisterImplCopyWithImpl<_$RegisterImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return register(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return register?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return register(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return register?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (register != null) {
      return register(this);
    }
    return orElse();
  }
}

abstract class _Register implements AuthEvent {
  const factory _Register(final String role) = _$RegisterImpl;

  String get role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterImplCopyWith<_$RegisterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithGoogleImplCopyWith<$Res> {
  factory _$$LoginWithGoogleImplCopyWith(_$LoginWithGoogleImpl value,
          $Res Function(_$LoginWithGoogleImpl) then) =
      __$$LoginWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithGoogleImpl>
    implements _$$LoginWithGoogleImplCopyWith<$Res> {
  __$$LoginWithGoogleImplCopyWithImpl(
      _$LoginWithGoogleImpl _value, $Res Function(_$LoginWithGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginWithGoogleImpl implements _LoginWithGoogle {
  const _$LoginWithGoogleImpl();

  @override
  String toString() {
    return 'AuthEvent.loginWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return loginWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return loginWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return loginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return loginWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (loginWithGoogle != null) {
      return loginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _LoginWithGoogle implements AuthEvent {
  const factory _LoginWithGoogle() = _$LoginWithGoogleImpl;
}

/// @nodoc
abstract class _$$RegisterWithGoogleImplCopyWith<$Res> {
  factory _$$RegisterWithGoogleImplCopyWith(_$RegisterWithGoogleImpl value,
          $Res Function(_$RegisterWithGoogleImpl) then) =
      __$$RegisterWithGoogleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$RegisterWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterWithGoogleImpl>
    implements _$$RegisterWithGoogleImplCopyWith<$Res> {
  __$$RegisterWithGoogleImplCopyWithImpl(_$RegisterWithGoogleImpl _value,
      $Res Function(_$RegisterWithGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
  }) {
    return _then(_$RegisterWithGoogleImpl(
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterWithGoogleImpl implements _RegisterWithGoogle {
  const _$RegisterWithGoogleImpl(this.role);

  @override
  final String role;

  @override
  String toString() {
    return 'AuthEvent.registerWithGoogle(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithGoogleImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithGoogleImplCopyWith<_$RegisterWithGoogleImpl> get copyWith =>
      __$$RegisterWithGoogleImplCopyWithImpl<_$RegisterWithGoogleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return registerWithGoogle(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return registerWithGoogle?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (registerWithGoogle != null) {
      return registerWithGoogle(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return registerWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return registerWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (registerWithGoogle != null) {
      return registerWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithGoogle implements AuthEvent {
  const factory _RegisterWithGoogle(final String role) =
      _$RegisterWithGoogleImpl;

  String get role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterWithGoogleImplCopyWith<_$RegisterWithGoogleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAccountImplCopyWith<$Res> {
  factory _$$DeleteAccountImplCopyWith(
          _$DeleteAccountImpl value, $Res Function(_$DeleteAccountImpl) then) =
      __$$DeleteAccountImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteAccountImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$DeleteAccountImpl>
    implements _$$DeleteAccountImplCopyWith<$Res> {
  __$$DeleteAccountImplCopyWithImpl(
      _$DeleteAccountImpl _value, $Res Function(_$DeleteAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteAccountImpl implements _DeleteAccount {
  const _$DeleteAccountImpl();

  @override
  String toString() {
    return 'AuthEvent.deleteAccount()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteAccountImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return deleteAccount();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return deleteAccount?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return deleteAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return deleteAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(this);
    }
    return orElse();
  }
}

abstract class _DeleteAccount implements AuthEvent {
  const factory _DeleteAccount() = _$DeleteAccountImpl;
}

/// @nodoc
abstract class _$$LoginWithAppleImplCopyWith<$Res> {
  factory _$$LoginWithAppleImplCopyWith(_$LoginWithAppleImpl value,
          $Res Function(_$LoginWithAppleImpl) then) =
      __$$LoginWithAppleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithAppleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$LoginWithAppleImpl>
    implements _$$LoginWithAppleImplCopyWith<$Res> {
  __$$LoginWithAppleImplCopyWithImpl(
      _$LoginWithAppleImpl _value, $Res Function(_$LoginWithAppleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginWithAppleImpl implements _LoginWithApple {
  const _$LoginWithAppleImpl();

  @override
  String toString() {
    return 'AuthEvent.loginWithApple()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginWithAppleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return loginWithApple();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return loginWithApple?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (loginWithApple != null) {
      return loginWithApple();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return loginWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return loginWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (loginWithApple != null) {
      return loginWithApple(this);
    }
    return orElse();
  }
}

abstract class _LoginWithApple implements AuthEvent {
  const factory _LoginWithApple() = _$LoginWithAppleImpl;
}

/// @nodoc
abstract class _$$RegisterWithAppleImplCopyWith<$Res> {
  factory _$$RegisterWithAppleImplCopyWith(_$RegisterWithAppleImpl value,
          $Res Function(_$RegisterWithAppleImpl) then) =
      __$$RegisterWithAppleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String role});
}

/// @nodoc
class __$$RegisterWithAppleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$RegisterWithAppleImpl>
    implements _$$RegisterWithAppleImplCopyWith<$Res> {
  __$$RegisterWithAppleImplCopyWithImpl(_$RegisterWithAppleImpl _value,
      $Res Function(_$RegisterWithAppleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? role = null,
  }) {
    return _then(_$RegisterWithAppleImpl(
      null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterWithAppleImpl implements _RegisterWithApple {
  const _$RegisterWithAppleImpl(this.role);

  @override
  final String role;

  @override
  String toString() {
    return 'AuthEvent.registerWithApple(role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithAppleImpl &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, role);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithAppleImplCopyWith<_$RegisterWithAppleImpl> get copyWith =>
      __$$RegisterWithAppleImplCopyWithImpl<_$RegisterWithAppleImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() login,
    required TResult Function() logout,
    required TResult Function(String role) register,
    required TResult Function() loginWithGoogle,
    required TResult Function(String role) registerWithGoogle,
    required TResult Function() deleteAccount,
    required TResult Function() loginWithApple,
    required TResult Function(String role) registerWithApple,
  }) {
    return registerWithApple(role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? login,
    TResult? Function()? logout,
    TResult? Function(String role)? register,
    TResult? Function()? loginWithGoogle,
    TResult? Function(String role)? registerWithGoogle,
    TResult? Function()? deleteAccount,
    TResult? Function()? loginWithApple,
    TResult? Function(String role)? registerWithApple,
  }) {
    return registerWithApple?.call(role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? login,
    TResult Function()? logout,
    TResult Function(String role)? register,
    TResult Function()? loginWithGoogle,
    TResult Function(String role)? registerWithGoogle,
    TResult Function()? deleteAccount,
    TResult Function()? loginWithApple,
    TResult Function(String role)? registerWithApple,
    required TResult orElse(),
  }) {
    if (registerWithApple != null) {
      return registerWithApple(role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Login value) login,
    required TResult Function(_Logout value) logout,
    required TResult Function(_Register value) register,
    required TResult Function(_LoginWithGoogle value) loginWithGoogle,
    required TResult Function(_RegisterWithGoogle value) registerWithGoogle,
    required TResult Function(_DeleteAccount value) deleteAccount,
    required TResult Function(_LoginWithApple value) loginWithApple,
    required TResult Function(_RegisterWithApple value) registerWithApple,
  }) {
    return registerWithApple(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Login value)? login,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_Register value)? register,
    TResult? Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult? Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult? Function(_DeleteAccount value)? deleteAccount,
    TResult? Function(_LoginWithApple value)? loginWithApple,
    TResult? Function(_RegisterWithApple value)? registerWithApple,
  }) {
    return registerWithApple?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Login value)? login,
    TResult Function(_Logout value)? logout,
    TResult Function(_Register value)? register,
    TResult Function(_LoginWithGoogle value)? loginWithGoogle,
    TResult Function(_RegisterWithGoogle value)? registerWithGoogle,
    TResult Function(_DeleteAccount value)? deleteAccount,
    TResult Function(_LoginWithApple value)? loginWithApple,
    TResult Function(_RegisterWithApple value)? registerWithApple,
    required TResult orElse(),
  }) {
    if (registerWithApple != null) {
      return registerWithApple(this);
    }
    return orElse();
  }
}

abstract class _RegisterWithApple implements AuthEvent {
  const factory _RegisterWithApple(final String role) = _$RegisterWithAppleImpl;

  String get role;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterWithAppleImplCopyWith<_$RegisterWithAppleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthState
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
    extends _$AuthStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AuthState.initial()';
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
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AuthState {
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
    extends _$AuthStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AuthState.loading()';
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
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SingOutImplCopyWith<$Res> {
  factory _$$SingOutImplCopyWith(
          _$SingOutImpl value, $Res Function(_$SingOutImpl) then) =
      __$$SingOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SingOutImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$SingOutImpl>
    implements _$$SingOutImplCopyWith<$Res> {
  __$$SingOutImplCopyWithImpl(
      _$SingOutImpl _value, $Res Function(_$SingOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SingOutImpl implements _SingOut {
  const _$SingOutImpl();

  @override
  String toString() {
    return 'AuthState.singOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SingOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return singOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return singOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (singOut != null) {
      return singOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return singOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return singOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (singOut != null) {
      return singOut(this);
    }
    return orElse();
  }
}

abstract class _SingOut implements AuthState {
  const factory _SingOut() = _$SingOutImpl;
}

/// @nodoc
abstract class _$$RegisterByGoogleImplCopyWith<$Res> {
  factory _$$RegisterByGoogleImplCopyWith(_$RegisterByGoogleImpl value,
          $Res Function(_$RegisterByGoogleImpl) then) =
      __$$RegisterByGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterByGoogleImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$RegisterByGoogleImpl>
    implements _$$RegisterByGoogleImplCopyWith<$Res> {
  __$$RegisterByGoogleImplCopyWithImpl(_$RegisterByGoogleImpl _value,
      $Res Function(_$RegisterByGoogleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RegisterByGoogleImpl implements _RegisterByGoogle {
  const _$RegisterByGoogleImpl();

  @override
  String toString() {
    return 'AuthState.registerByGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterByGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return registerByGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return registerByGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (registerByGoogle != null) {
      return registerByGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return registerByGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return registerByGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (registerByGoogle != null) {
      return registerByGoogle(this);
    }
    return orElse();
  }
}

abstract class _RegisterByGoogle implements AuthState {
  const factory _RegisterByGoogle() = _$RegisterByGoogleImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserModel user});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoadedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.user);

  @override
  final UserModel user;

  @override
  String toString() {
    return 'AuthState.loaded(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded(final UserModel user) = _$LoadedImpl;

  UserModel get user;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$AuthStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthState
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

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
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

  /// Create a copy of AuthState
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
    required TResult Function() singOut,
    required TResult Function() registerByGoogle,
    required TResult Function(UserModel user) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? singOut,
    TResult? Function()? registerByGoogle,
    TResult? Function(UserModel user)? loaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? singOut,
    TResult Function()? registerByGoogle,
    TResult Function(UserModel user)? loaded,
    TResult Function(String message)? error,
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
    required TResult Function(_SingOut value) singOut,
    required TResult Function(_RegisterByGoogle value) registerByGoogle,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SingOut value)? singOut,
    TResult? Function(_RegisterByGoogle value)? registerByGoogle,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SingOut value)? singOut,
    TResult Function(_RegisterByGoogle value)? registerByGoogle,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of AuthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
