// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'blog_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlogDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  BlogDetailsResponse? get blogDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogDetailsStateCopyWith<BlogDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogDetailsStateCopyWith<$Res> {
  factory $BlogDetailsStateCopyWith(
          BlogDetailsState value, $Res Function(BlogDetailsState) then) =
      _$BlogDetailsStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, BlogDetailsResponse? blogDetails});
}

/// @nodoc
class _$BlogDetailsStateCopyWithImpl<$Res>
    implements $BlogDetailsStateCopyWith<$Res> {
  _$BlogDetailsStateCopyWithImpl(this._value, this._then);

  final BlogDetailsState _value;
  // ignore: unused_field
  final $Res Function(BlogDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? blogDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogDetails: blogDetails == freezed
          ? _value.blogDetails
          : blogDetails // ignore: cast_nullable_to_non_nullable
              as BlogDetailsResponse?,
    ));
  }
}

/// @nodoc
abstract class _$$_BlogDetailsStateCopyWith<$Res>
    implements $BlogDetailsStateCopyWith<$Res> {
  factory _$$_BlogDetailsStateCopyWith(
          _$_BlogDetailsState value, $Res Function(_$_BlogDetailsState) then) =
      __$$_BlogDetailsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, BlogDetailsResponse? blogDetails});
}

/// @nodoc
class __$$_BlogDetailsStateCopyWithImpl<$Res>
    extends _$BlogDetailsStateCopyWithImpl<$Res>
    implements _$$_BlogDetailsStateCopyWith<$Res> {
  __$$_BlogDetailsStateCopyWithImpl(
      _$_BlogDetailsState _value, $Res Function(_$_BlogDetailsState) _then)
      : super(_value, (v) => _then(v as _$_BlogDetailsState));

  @override
  _$_BlogDetailsState get _value => super._value as _$_BlogDetailsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? blogDetails = freezed,
  }) {
    return _then(_$_BlogDetailsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogDetails: blogDetails == freezed
          ? _value.blogDetails
          : blogDetails // ignore: cast_nullable_to_non_nullable
              as BlogDetailsResponse?,
    ));
  }
}

/// @nodoc

class _$_BlogDetailsState extends _BlogDetailsState {
  const _$_BlogDetailsState({this.isLoading = false, this.blogDetails})
      : super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final BlogDetailsResponse? blogDetails;

  @override
  String toString() {
    return 'BlogDetailsState(isLoading: $isLoading, blogDetails: $blogDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogDetailsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.blogDetails, blogDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(blogDetails));

  @JsonKey(ignore: true)
  @override
  _$$_BlogDetailsStateCopyWith<_$_BlogDetailsState> get copyWith =>
      __$$_BlogDetailsStateCopyWithImpl<_$_BlogDetailsState>(this, _$identity);
}

abstract class _BlogDetailsState extends BlogDetailsState {
  const factory _BlogDetailsState(
      {final bool isLoading,
      final BlogDetailsResponse? blogDetails}) = _$_BlogDetailsState;
  const _BlogDetailsState._() : super._();

  @override
  bool get isLoading;
  @override
  BlogDetailsResponse? get blogDetails;
  @override
  @JsonKey(ignore: true)
  _$$_BlogDetailsStateCopyWith<_$_BlogDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
