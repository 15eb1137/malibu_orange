// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brightness.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BrightnessModelState {
  double? get brightness => throw _privateConstructorUsedError;
  bool? get isBrightnessSensorAvailable => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrightnessModelStateCopyWith<BrightnessModelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrightnessModelStateCopyWith<$Res> {
  factory $BrightnessModelStateCopyWith(BrightnessModelState value,
          $Res Function(BrightnessModelState) then) =
      _$BrightnessModelStateCopyWithImpl<$Res>;
  $Res call({double? brightness, bool? isBrightnessSensorAvailable});
}

/// @nodoc
class _$BrightnessModelStateCopyWithImpl<$Res>
    implements $BrightnessModelStateCopyWith<$Res> {
  _$BrightnessModelStateCopyWithImpl(this._value, this._then);

  final BrightnessModelState _value;
  // ignore: unused_field
  final $Res Function(BrightnessModelState) _then;

  @override
  $Res call({
    Object? brightness = freezed,
    Object? isBrightnessSensorAvailable = freezed,
  }) {
    return _then(_value.copyWith(
      brightness: brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double?,
      isBrightnessSensorAvailable: isBrightnessSensorAvailable == freezed
          ? _value.isBrightnessSensorAvailable
          : isBrightnessSensorAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_BrightnessModelStateCopyWith<$Res>
    implements $BrightnessModelStateCopyWith<$Res> {
  factory _$$_BrightnessModelStateCopyWith(_$_BrightnessModelState value,
          $Res Function(_$_BrightnessModelState) then) =
      __$$_BrightnessModelStateCopyWithImpl<$Res>;
  @override
  $Res call({double? brightness, bool? isBrightnessSensorAvailable});
}

/// @nodoc
class __$$_BrightnessModelStateCopyWithImpl<$Res>
    extends _$BrightnessModelStateCopyWithImpl<$Res>
    implements _$$_BrightnessModelStateCopyWith<$Res> {
  __$$_BrightnessModelStateCopyWithImpl(_$_BrightnessModelState _value,
      $Res Function(_$_BrightnessModelState) _then)
      : super(_value, (v) => _then(v as _$_BrightnessModelState));

  @override
  _$_BrightnessModelState get _value => super._value as _$_BrightnessModelState;

  @override
  $Res call({
    Object? brightness = freezed,
    Object? isBrightnessSensorAvailable = freezed,
  }) {
    return _then(_$_BrightnessModelState(
      brightness == freezed
          ? _value.brightness
          : brightness // ignore: cast_nullable_to_non_nullable
              as double?,
      isBrightnessSensorAvailable == freezed
          ? _value.isBrightnessSensorAvailable
          : isBrightnessSensorAvailable // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_BrightnessModelState implements _BrightnessModelState {
  const _$_BrightnessModelState(
      this.brightness, this.isBrightnessSensorAvailable);

  @override
  final double? brightness;
  @override
  final bool? isBrightnessSensorAvailable;

  @override
  String toString() {
    return 'BrightnessModelState(brightness: $brightness, isBrightnessSensorAvailable: $isBrightnessSensorAvailable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrightnessModelState &&
            const DeepCollectionEquality()
                .equals(other.brightness, brightness) &&
            const DeepCollectionEquality().equals(
                other.isBrightnessSensorAvailable,
                isBrightnessSensorAvailable));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brightness),
      const DeepCollectionEquality().hash(isBrightnessSensorAvailable));

  @JsonKey(ignore: true)
  @override
  _$$_BrightnessModelStateCopyWith<_$_BrightnessModelState> get copyWith =>
      __$$_BrightnessModelStateCopyWithImpl<_$_BrightnessModelState>(
          this, _$identity);
}

abstract class _BrightnessModelState implements BrightnessModelState {
  const factory _BrightnessModelState(
          final double? brightness, final bool? isBrightnessSensorAvailable) =
      _$_BrightnessModelState;

  @override
  double? get brightness;
  @override
  bool? get isBrightnessSensorAvailable;
  @override
  @JsonKey(ignore: true)
  _$$_BrightnessModelStateCopyWith<_$_BrightnessModelState> get copyWith =>
      throw _privateConstructorUsedError;
}
