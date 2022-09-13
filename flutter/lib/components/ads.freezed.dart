// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ads.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppOpenAdState {
  bool get isShowingAd => throw _privateConstructorUsedError;
  Duration get maxCacheDuration => throw _privateConstructorUsedError;
  DateTime? get appOpenLoadTime => throw _privateConstructorUsedError;
  AppOpenAd? get appOpenAd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppOpenAdStateCopyWith<AppOpenAdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppOpenAdStateCopyWith<$Res> {
  factory $AppOpenAdStateCopyWith(
          AppOpenAdState value, $Res Function(AppOpenAdState) then) =
      _$AppOpenAdStateCopyWithImpl<$Res>;
  $Res call(
      {bool isShowingAd,
      Duration maxCacheDuration,
      DateTime? appOpenLoadTime,
      AppOpenAd? appOpenAd});
}

/// @nodoc
class _$AppOpenAdStateCopyWithImpl<$Res>
    implements $AppOpenAdStateCopyWith<$Res> {
  _$AppOpenAdStateCopyWithImpl(this._value, this._then);

  final AppOpenAdState _value;
  // ignore: unused_field
  final $Res Function(AppOpenAdState) _then;

  @override
  $Res call({
    Object? isShowingAd = freezed,
    Object? maxCacheDuration = freezed,
    Object? appOpenLoadTime = freezed,
    Object? appOpenAd = freezed,
  }) {
    return _then(_value.copyWith(
      isShowingAd: isShowingAd == freezed
          ? _value.isShowingAd
          : isShowingAd // ignore: cast_nullable_to_non_nullable
              as bool,
      maxCacheDuration: maxCacheDuration == freezed
          ? _value.maxCacheDuration
          : maxCacheDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      appOpenLoadTime: appOpenLoadTime == freezed
          ? _value.appOpenLoadTime
          : appOpenLoadTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appOpenAd: appOpenAd == freezed
          ? _value.appOpenAd
          : appOpenAd // ignore: cast_nullable_to_non_nullable
              as AppOpenAd?,
    ));
  }
}

/// @nodoc
abstract class _$$_AppOpenAdStateCopyWith<$Res>
    implements $AppOpenAdStateCopyWith<$Res> {
  factory _$$_AppOpenAdStateCopyWith(
          _$_AppOpenAdState value, $Res Function(_$_AppOpenAdState) then) =
      __$$_AppOpenAdStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isShowingAd,
      Duration maxCacheDuration,
      DateTime? appOpenLoadTime,
      AppOpenAd? appOpenAd});
}

/// @nodoc
class __$$_AppOpenAdStateCopyWithImpl<$Res>
    extends _$AppOpenAdStateCopyWithImpl<$Res>
    implements _$$_AppOpenAdStateCopyWith<$Res> {
  __$$_AppOpenAdStateCopyWithImpl(
      _$_AppOpenAdState _value, $Res Function(_$_AppOpenAdState) _then)
      : super(_value, (v) => _then(v as _$_AppOpenAdState));

  @override
  _$_AppOpenAdState get _value => super._value as _$_AppOpenAdState;

  @override
  $Res call({
    Object? isShowingAd = freezed,
    Object? maxCacheDuration = freezed,
    Object? appOpenLoadTime = freezed,
    Object? appOpenAd = freezed,
  }) {
    return _then(_$_AppOpenAdState(
      isShowingAd: isShowingAd == freezed
          ? _value.isShowingAd
          : isShowingAd // ignore: cast_nullable_to_non_nullable
              as bool,
      maxCacheDuration: maxCacheDuration == freezed
          ? _value.maxCacheDuration
          : maxCacheDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      appOpenLoadTime: appOpenLoadTime == freezed
          ? _value.appOpenLoadTime
          : appOpenLoadTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      appOpenAd: appOpenAd == freezed
          ? _value.appOpenAd
          : appOpenAd // ignore: cast_nullable_to_non_nullable
              as AppOpenAd?,
    ));
  }
}

/// @nodoc

class _$_AppOpenAdState
    with DiagnosticableTreeMixin
    implements _AppOpenAdState {
  const _$_AppOpenAdState(
      {this.isShowingAd = false,
      this.maxCacheDuration = const Duration(hours: 4),
      this.appOpenLoadTime,
      this.appOpenAd});

  @override
  @JsonKey()
  final bool isShowingAd;
  @override
  @JsonKey()
  final Duration maxCacheDuration;
  @override
  final DateTime? appOpenLoadTime;
  @override
  final AppOpenAd? appOpenAd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppOpenAdState(isShowingAd: $isShowingAd, maxCacheDuration: $maxCacheDuration, appOpenLoadTime: $appOpenLoadTime, appOpenAd: $appOpenAd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppOpenAdState'))
      ..add(DiagnosticsProperty('isShowingAd', isShowingAd))
      ..add(DiagnosticsProperty('maxCacheDuration', maxCacheDuration))
      ..add(DiagnosticsProperty('appOpenLoadTime', appOpenLoadTime))
      ..add(DiagnosticsProperty('appOpenAd', appOpenAd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppOpenAdState &&
            const DeepCollectionEquality()
                .equals(other.isShowingAd, isShowingAd) &&
            const DeepCollectionEquality()
                .equals(other.maxCacheDuration, maxCacheDuration) &&
            const DeepCollectionEquality()
                .equals(other.appOpenLoadTime, appOpenLoadTime) &&
            const DeepCollectionEquality().equals(other.appOpenAd, appOpenAd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isShowingAd),
      const DeepCollectionEquality().hash(maxCacheDuration),
      const DeepCollectionEquality().hash(appOpenLoadTime),
      const DeepCollectionEquality().hash(appOpenAd));

  @JsonKey(ignore: true)
  @override
  _$$_AppOpenAdStateCopyWith<_$_AppOpenAdState> get copyWith =>
      __$$_AppOpenAdStateCopyWithImpl<_$_AppOpenAdState>(this, _$identity);
}

abstract class _AppOpenAdState implements AppOpenAdState {
  const factory _AppOpenAdState(
      {final bool isShowingAd,
      final Duration maxCacheDuration,
      final DateTime? appOpenLoadTime,
      final AppOpenAd? appOpenAd}) = _$_AppOpenAdState;

  @override
  bool get isShowingAd;
  @override
  Duration get maxCacheDuration;
  @override
  DateTime? get appOpenLoadTime;
  @override
  AppOpenAd? get appOpenAd;
  @override
  @JsonKey(ignore: true)
  _$$_AppOpenAdStateCopyWith<_$_AppOpenAdState> get copyWith =>
      throw _privateConstructorUsedError;
}
