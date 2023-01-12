// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'looks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LooksState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BannerData> get looks => throw _privateConstructorUsedError;
  List<LookLikeData> get lookLikes => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LooksStateCopyWith<LooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LooksStateCopyWith<$Res> {
  factory $LooksStateCopyWith(
          LooksState value, $Res Function(LooksState) then) =
      _$LooksStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<BannerData> looks,
      List<LookLikeData> lookLikes});
}

/// @nodoc
class _$LooksStateCopyWithImpl<$Res> implements $LooksStateCopyWith<$Res> {
  _$LooksStateCopyWithImpl(this._value, this._then);

  final LooksState _value;
  // ignore: unused_field
  final $Res Function(LooksState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? looks = freezed,
    Object? lookLikes = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looks: looks == freezed
          ? _value.looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      lookLikes: lookLikes == freezed
          ? _value.lookLikes
          : lookLikes // ignore: cast_nullable_to_non_nullable
              as List<LookLikeData>,
    ));
  }
}

/// @nodoc
abstract class _$$_LooksStateCopyWith<$Res>
    implements $LooksStateCopyWith<$Res> {
  factory _$$_LooksStateCopyWith(
          _$_LooksState value, $Res Function(_$_LooksState) then) =
      __$$_LooksStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isMoreLoading,
      List<BannerData> looks,
      List<LookLikeData> lookLikes});
}

/// @nodoc
class __$$_LooksStateCopyWithImpl<$Res> extends _$LooksStateCopyWithImpl<$Res>
    implements _$$_LooksStateCopyWith<$Res> {
  __$$_LooksStateCopyWithImpl(
      _$_LooksState _value, $Res Function(_$_LooksState) _then)
      : super(_value, (v) => _then(v as _$_LooksState));

  @override
  _$_LooksState get _value => super._value as _$_LooksState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? looks = freezed,
    Object? lookLikes = freezed,
  }) {
    return _then(_$_LooksState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      looks: looks == freezed
          ? _value._looks
          : looks // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      lookLikes: lookLikes == freezed
          ? _value._lookLikes
          : lookLikes // ignore: cast_nullable_to_non_nullable
              as List<LookLikeData>,
    ));
  }
}

/// @nodoc

class _$_LooksState extends _LooksState {
  const _$_LooksState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<BannerData> looks = const [],
      final List<LookLikeData> lookLikes = const []})
      : _looks = looks,
        _lookLikes = lookLikes,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<BannerData> _looks;
  @override
  @JsonKey()
  List<BannerData> get looks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_looks);
  }

  final List<LookLikeData> _lookLikes;
  @override
  @JsonKey()
  List<LookLikeData> get lookLikes {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lookLikes);
  }

  @override
  String toString() {
    return 'LooksState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, looks: $looks, lookLikes: $lookLikes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LooksState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality().equals(other._looks, _looks) &&
            const DeepCollectionEquality()
                .equals(other._lookLikes, _lookLikes));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(_looks),
      const DeepCollectionEquality().hash(_lookLikes));

  @JsonKey(ignore: true)
  @override
  _$$_LooksStateCopyWith<_$_LooksState> get copyWith =>
      __$$_LooksStateCopyWithImpl<_$_LooksState>(this, _$identity);
}

abstract class _LooksState extends LooksState {
  const factory _LooksState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<BannerData> looks,
      final List<LookLikeData> lookLikes}) = _$_LooksState;
  const _LooksState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BannerData> get looks;
  @override
  List<LookLikeData> get lookLikes;
  @override
  @JsonKey(ignore: true)
  _$$_LooksStateCopyWith<_$_LooksState> get copyWith =>
      throw _privateConstructorUsedError;
}
