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
mixin _$AdState {
  BannerAd? get bannerAd => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdStateCopyWith<AdState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdStateCopyWith<$Res> {
  factory $AdStateCopyWith(AdState value, $Res Function(AdState) then) =
      _$AdStateCopyWithImpl<$Res>;
  $Res call({BannerAd? bannerAd});
}

/// @nodoc
class _$AdStateCopyWithImpl<$Res> implements $AdStateCopyWith<$Res> {
  _$AdStateCopyWithImpl(this._value, this._then);

  final AdState _value;
  // ignore: unused_field
  final $Res Function(AdState) _then;

  @override
  $Res call({
    Object? bannerAd = freezed,
  }) {
    return _then(_value.copyWith(
      bannerAd: bannerAd == freezed
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
    ));
  }
}

/// @nodoc
abstract class _$$_AdStateCopyWith<$Res> implements $AdStateCopyWith<$Res> {
  factory _$$_AdStateCopyWith(
          _$_AdState value, $Res Function(_$_AdState) then) =
      __$$_AdStateCopyWithImpl<$Res>;
  @override
  $Res call({BannerAd? bannerAd});
}

/// @nodoc
class __$$_AdStateCopyWithImpl<$Res> extends _$AdStateCopyWithImpl<$Res>
    implements _$$_AdStateCopyWith<$Res> {
  __$$_AdStateCopyWithImpl(_$_AdState _value, $Res Function(_$_AdState) _then)
      : super(_value, (v) => _then(v as _$_AdState));

  @override
  _$_AdState get _value => super._value as _$_AdState;

  @override
  $Res call({
    Object? bannerAd = freezed,
  }) {
    return _then(_$_AdState(
      bannerAd == freezed
          ? _value.bannerAd
          : bannerAd // ignore: cast_nullable_to_non_nullable
              as BannerAd?,
    ));
  }
}

/// @nodoc

class _$_AdState with DiagnosticableTreeMixin implements _AdState {
  const _$_AdState(this.bannerAd);

  @override
  final BannerAd? bannerAd;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AdState(bannerAd: $bannerAd)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AdState'))
      ..add(DiagnosticsProperty('bannerAd', bannerAd));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdState &&
            const DeepCollectionEquality().equals(other.bannerAd, bannerAd));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(bannerAd));

  @JsonKey(ignore: true)
  @override
  _$$_AdStateCopyWith<_$_AdState> get copyWith =>
      __$$_AdStateCopyWithImpl<_$_AdState>(this, _$identity);
}

abstract class _AdState implements AdState {
  const factory _AdState(final BannerAd? bannerAd) = _$_AdState;

  @override
  BannerAd? get bannerAd;
  @override
  @JsonKey(ignore: true)
  _$$_AdStateCopyWith<_$_AdState> get copyWith =>
      throw _privateConstructorUsedError;
}
