// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'blogs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlogsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BlogData> get blogs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlogsStateCopyWith<BlogsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlogsStateCopyWith<$Res> {
  factory $BlogsStateCopyWith(
          BlogsState value, $Res Function(BlogsState) then) =
      _$BlogsStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> blogs});
}

/// @nodoc
class _$BlogsStateCopyWithImpl<$Res> implements $BlogsStateCopyWith<$Res> {
  _$BlogsStateCopyWithImpl(this._value, this._then);

  final BlogsState _value;
  // ignore: unused_field
  final $Res Function(BlogsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? blogs = freezed,
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
      blogs: blogs == freezed
          ? _value.blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ));
  }
}

/// @nodoc
abstract class _$$_BlogsStateCopyWith<$Res>
    implements $BlogsStateCopyWith<$Res> {
  factory _$$_BlogsStateCopyWith(
          _$_BlogsState value, $Res Function(_$_BlogsState) then) =
      __$$_BlogsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> blogs});
}

/// @nodoc
class __$$_BlogsStateCopyWithImpl<$Res> extends _$BlogsStateCopyWithImpl<$Res>
    implements _$$_BlogsStateCopyWith<$Res> {
  __$$_BlogsStateCopyWithImpl(
      _$_BlogsState _value, $Res Function(_$_BlogsState) _then)
      : super(_value, (v) => _then(v as _$_BlogsState));

  @override
  _$_BlogsState get _value => super._value as _$_BlogsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? blogs = freezed,
  }) {
    return _then(_$_BlogsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      blogs: blogs == freezed
          ? _value._blogs
          : blogs // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ));
  }
}

/// @nodoc

class _$_BlogsState extends _BlogsState {
  const _$_BlogsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<BlogData> blogs = const []})
      : _blogs = blogs,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<BlogData> _blogs;
  @override
  @JsonKey()
  List<BlogData> get blogs {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blogs);
  }

  @override
  String toString() {
    return 'BlogsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, blogs: $blogs)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlogsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality().equals(other._blogs, _blogs));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(_blogs));

  @JsonKey(ignore: true)
  @override
  _$$_BlogsStateCopyWith<_$_BlogsState> get copyWith =>
      __$$_BlogsStateCopyWithImpl<_$_BlogsState>(this, _$identity);
}

abstract class _BlogsState extends BlogsState {
  const factory _BlogsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<BlogData> blogs}) = _$_BlogsState;
  const _BlogsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BlogData> get blogs;
  @override
  @JsonKey(ignore: true)
  _$$_BlogsStateCopyWith<_$_BlogsState> get copyWith =>
      throw _privateConstructorUsedError;
}
