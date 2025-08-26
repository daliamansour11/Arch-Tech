// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppLocale {
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppLocaleCopyWith<AppLocale> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppLocaleCopyWith<$Res> {
  factory $AppLocaleCopyWith(AppLocale value, $Res Function(AppLocale) then) =
      _$AppLocaleCopyWithImpl<$Res, AppLocale>;
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class _$AppLocaleCopyWithImpl<$Res, $Val extends AppLocale>
    implements $AppLocaleCopyWith<$Res> {
  _$AppLocaleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppLocaleImplCopyWith<$Res>
    implements $AppLocaleCopyWith<$Res> {
  factory _$$AppLocaleImplCopyWith(
          _$AppLocaleImpl value, $Res Function(_$AppLocaleImpl) then) =
      __$$AppLocaleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String code});
}

/// @nodoc
class __$$AppLocaleImplCopyWithImpl<$Res>
    extends _$AppLocaleCopyWithImpl<$Res, _$AppLocaleImpl>
    implements _$$AppLocaleImplCopyWith<$Res> {
  __$$AppLocaleImplCopyWithImpl(
      _$AppLocaleImpl _value, $Res Function(_$AppLocaleImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$AppLocaleImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppLocaleImpl implements _AppLocale {
  const _$AppLocaleImpl({required this.name, required this.code});

  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'AppLocale(name: $name, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppLocaleImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppLocaleImplCopyWith<_$AppLocaleImpl> get copyWith =>
      __$$AppLocaleImplCopyWithImpl<_$AppLocaleImpl>(this, _$identity);
}

abstract class _AppLocale implements AppLocale {
  const factory _AppLocale(
      {required final String name,
      required final String code}) = _$AppLocaleImpl;

  @override
  String get name;
  @override
  String get code;

  /// Create a copy of AppLocale
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppLocaleImplCopyWith<_$AppLocaleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
