// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppModelState {
  GoRouter? get router => throw _privateConstructorUsedError;
  ThemeMode? get themeMode => throw _privateConstructorUsedError;
  SharedPreferences? get sharedPreferences =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppModelStateCopyWith<AppModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppModelStateCopyWith<$Res> {
  factory $AppModelStateCopyWith(
          AppModelState value, $Res Function(AppModelState) then) =
      _$AppModelStateCopyWithImpl<$Res>;
  $Res call(
      {GoRouter? router,
      ThemeMode? themeMode,
      SharedPreferences? sharedPreferences});
}

/// @nodoc
class _$AppModelStateCopyWithImpl<$Res>
    implements $AppModelStateCopyWith<$Res> {
  _$AppModelStateCopyWithImpl(this._value, this._then);

  final AppModelState _value;
  // ignore: unused_field
  final $Res Function(AppModelState) _then;

  @override
  $Res call({
    Object? router = freezed,
    Object? themeMode = freezed,
    Object? sharedPreferences = freezed,
  }) {
    return _then(_value.copyWith(
      router: router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as GoRouter?,
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      sharedPreferences: sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppModelStateCopyWith<$Res>
    implements $AppModelStateCopyWith<$Res> {
  factory _$$_AppModelStateCopyWith(
          _$_AppModelState value, $Res Function(_$_AppModelState) then) =
      __$$_AppModelStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {GoRouter? router,
      ThemeMode? themeMode,
      SharedPreferences? sharedPreferences});
}

/// @nodoc
class __$$_AppModelStateCopyWithImpl<$Res>
    extends _$AppModelStateCopyWithImpl<$Res>
    implements _$$_AppModelStateCopyWith<$Res> {
  __$$_AppModelStateCopyWithImpl(
      _$_AppModelState _value, $Res Function(_$_AppModelState) _then)
      : super(_value, (v) => _then(v as _$_AppModelState));

  @override
  _$_AppModelState get _value => super._value as _$_AppModelState;

  @override
  $Res call({
    Object? router = freezed,
    Object? themeMode = freezed,
    Object? sharedPreferences = freezed,
  }) {
    return _then(_$_AppModelState(
      router == freezed
          ? _value.router
          : router // ignore: cast_nullable_to_non_nullable
              as GoRouter?,
      themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode?,
      sharedPreferences == freezed
          ? _value.sharedPreferences
          : sharedPreferences // ignore: cast_nullable_to_non_nullable
              as SharedPreferences?,
    ));
  }
}

/// @nodoc

class _$_AppModelState with DiagnosticableTreeMixin implements _AppModelState {
  const _$_AppModelState(this.router, this.themeMode, this.sharedPreferences);

  @override
  final GoRouter? router;
  @override
  final ThemeMode? themeMode;
  @override
  final SharedPreferences? sharedPreferences;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppModelState(router: $router, themeMode: $themeMode, sharedPreferences: $sharedPreferences)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppModelState'))
      ..add(DiagnosticsProperty('router', router))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(DiagnosticsProperty('sharedPreferences', sharedPreferences));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppModelState &&
            const DeepCollectionEquality().equals(other.router, router) &&
            const DeepCollectionEquality().equals(other.themeMode, themeMode) &&
            const DeepCollectionEquality()
                .equals(other.sharedPreferences, sharedPreferences));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(router),
      const DeepCollectionEquality().hash(themeMode),
      const DeepCollectionEquality().hash(sharedPreferences));

  @JsonKey(ignore: true)
  @override
  _$$_AppModelStateCopyWith<_$_AppModelState> get copyWith =>
      __$$_AppModelStateCopyWithImpl<_$_AppModelState>(this, _$identity);
}

abstract class _AppModelState implements AppModelState {
  const factory _AppModelState(
      final GoRouter? router,
      final ThemeMode? themeMode,
      final SharedPreferences? sharedPreferences) = _$_AppModelState;

  @override
  GoRouter? get router;
  @override
  ThemeMode? get themeMode;
  @override
  SharedPreferences? get sharedPreferences;
  @override
  @JsonKey(ignore: true)
  _$$_AppModelStateCopyWith<_$_AppModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
