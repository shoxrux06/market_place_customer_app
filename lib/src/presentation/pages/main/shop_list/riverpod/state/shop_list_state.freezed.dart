// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopListState {
  bool get isBannersLoading => throw _privateConstructorUsedError;
  bool get isCategoriesLoading => throw _privateConstructorUsedError;
  List<BannerData> get banners => throw _privateConstructorUsedError;
  List<CategoryData> get categories => throw _privateConstructorUsedError;
  int get activeBanner => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopListStateCopyWith<ShopListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopListStateCopyWith<$Res> {
  factory $ShopListStateCopyWith(
          ShopListState value, $Res Function(ShopListState) then) =
      _$ShopListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isBannersLoading,
      bool isCategoriesLoading,
      List<BannerData> banners,
      List<CategoryData> categories,
      int activeBanner});
}

/// @nodoc
class _$ShopListStateCopyWithImpl<$Res>
    implements $ShopListStateCopyWith<$Res> {
  _$ShopListStateCopyWithImpl(this._value, this._then);

  final ShopListState _value;
  // ignore: unused_field
  final $Res Function(ShopListState) _then;

  @override
  $Res call({
    Object? isBannersLoading = freezed,
    Object? isCategoriesLoading = freezed,
    Object? banners = freezed,
    Object? categories = freezed,
    Object? activeBanner = freezed,
  }) {
    return _then(_value.copyWith(
      isBannersLoading: isBannersLoading == freezed
          ? _value.isBannersLoading
          : isBannersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: isCategoriesLoading == freezed
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: banners == freezed
          ? _value.banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      categories: categories == freezed
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      activeBanner: activeBanner == freezed
          ? _value.activeBanner
          : activeBanner // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_ShopListStateCopyWith<$Res>
    implements $ShopListStateCopyWith<$Res> {
  factory _$$_ShopListStateCopyWith(
          _$_ShopListState value, $Res Function(_$_ShopListState) then) =
      __$$_ShopListStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isBannersLoading,
      bool isCategoriesLoading,
      List<BannerData> banners,
      List<CategoryData> categories,
      int activeBanner});
}

/// @nodoc
class __$$_ShopListStateCopyWithImpl<$Res>
    extends _$ShopListStateCopyWithImpl<$Res>
    implements _$$_ShopListStateCopyWith<$Res> {
  __$$_ShopListStateCopyWithImpl(
      _$_ShopListState _value, $Res Function(_$_ShopListState) _then)
      : super(_value, (v) => _then(v as _$_ShopListState));

  @override
  _$_ShopListState get _value => super._value as _$_ShopListState;

  @override
  $Res call({
    Object? isBannersLoading = freezed,
    Object? isCategoriesLoading = freezed,
    Object? banners = freezed,
    Object? categories = freezed,
    Object? activeBanner = freezed,
  }) {
    return _then(_$_ShopListState(
      isBannersLoading: isBannersLoading == freezed
          ? _value.isBannersLoading
          : isBannersLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCategoriesLoading: isCategoriesLoading == freezed
          ? _value.isCategoriesLoading
          : isCategoriesLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      banners: banners == freezed
          ? _value._banners
          : banners // ignore: cast_nullable_to_non_nullable
              as List<BannerData>,
      categories: categories == freezed
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryData>,
      activeBanner: activeBanner == freezed
          ? _value.activeBanner
          : activeBanner // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ShopListState extends _ShopListState {
  const _$_ShopListState(
      {this.isBannersLoading = false,
      this.isCategoriesLoading = false,
      final List<BannerData> banners = const [],
      final List<CategoryData> categories = const [],
      this.activeBanner = 0})
      : _banners = banners,
        _categories = categories,
        super._();

  @override
  @JsonKey()
  final bool isBannersLoading;
  @override
  @JsonKey()
  final bool isCategoriesLoading;
  final List<BannerData> _banners;
  @override
  @JsonKey()
  List<BannerData> get banners {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_banners);
  }

  final List<CategoryData> _categories;
  @override
  @JsonKey()
  List<CategoryData> get categories {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  @JsonKey()
  final int activeBanner;

  @override
  String toString() {
    return 'ShopListState(isBannersLoading: $isBannersLoading, isCategoriesLoading: $isCategoriesLoading, banners: $banners, categories: $categories, activeBanner: $activeBanner)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopListState &&
            const DeepCollectionEquality()
                .equals(other.isBannersLoading, isBannersLoading) &&
            const DeepCollectionEquality()
                .equals(other.isCategoriesLoading, isCategoriesLoading) &&
            const DeepCollectionEquality().equals(other._banners, _banners) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other.activeBanner, activeBanner));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isBannersLoading),
      const DeepCollectionEquality().hash(isCategoriesLoading),
      const DeepCollectionEquality().hash(_banners),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(activeBanner));

  @JsonKey(ignore: true)
  @override
  _$$_ShopListStateCopyWith<_$_ShopListState> get copyWith =>
      __$$_ShopListStateCopyWithImpl<_$_ShopListState>(this, _$identity);
}

abstract class _ShopListState extends ShopListState {
  const factory _ShopListState(
      {final bool isBannersLoading,
      final bool isCategoriesLoading,
      final List<BannerData> banners,
      final List<CategoryData> categories,
      final int activeBanner}) = _$_ShopListState;
  const _ShopListState._() : super._();

  @override
  bool get isBannersLoading;
  @override
  bool get isCategoriesLoading;
  @override
  List<BannerData> get banners;
  @override
  List<CategoryData> get categories;
  @override
  int get activeBanner;
  @override
  @JsonKey(ignore: true)
  _$$_ShopListStateCopyWith<_$_ShopListState> get copyWith =>
      throw _privateConstructorUsedError;
}
