// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'notifications_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NotificationsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isMoreLoading => throw _privateConstructorUsedError;
  List<BlogData> get notifications => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotificationsStateCopyWith<NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsStateCopyWith<$Res> {
  factory $NotificationsStateCopyWith(
          NotificationsState value, $Res Function(NotificationsState) then) =
      _$NotificationsStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> notifications});
}

/// @nodoc
class _$NotificationsStateCopyWithImpl<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  _$NotificationsStateCopyWithImpl(this._value, this._then);

  final NotificationsState _value;
  // ignore: unused_field
  final $Res Function(NotificationsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? notifications = freezed,
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
      notifications: notifications == freezed
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ));
  }
}

/// @nodoc
abstract class _$$_NotificationsStateCopyWith<$Res>
    implements $NotificationsStateCopyWith<$Res> {
  factory _$$_NotificationsStateCopyWith(_$_NotificationsState value,
          $Res Function(_$_NotificationsState) then) =
      __$$_NotificationsStateCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isMoreLoading, List<BlogData> notifications});
}

/// @nodoc
class __$$_NotificationsStateCopyWithImpl<$Res>
    extends _$NotificationsStateCopyWithImpl<$Res>
    implements _$$_NotificationsStateCopyWith<$Res> {
  __$$_NotificationsStateCopyWithImpl(
      _$_NotificationsState _value, $Res Function(_$_NotificationsState) _then)
      : super(_value, (v) => _then(v as _$_NotificationsState));

  @override
  _$_NotificationsState get _value => super._value as _$_NotificationsState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isMoreLoading = freezed,
    Object? notifications = freezed,
  }) {
    return _then(_$_NotificationsState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isMoreLoading: isMoreLoading == freezed
          ? _value.isMoreLoading
          : isMoreLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      notifications: notifications == freezed
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<BlogData>,
    ));
  }
}

/// @nodoc

class _$_NotificationsState extends _NotificationsState {
  const _$_NotificationsState(
      {this.isLoading = false,
      this.isMoreLoading = false,
      final List<BlogData> notifications = const []})
      : _notifications = notifications,
        super._();

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isMoreLoading;
  final List<BlogData> _notifications;
  @override
  @JsonKey()
  List<BlogData> get notifications {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  String toString() {
    return 'NotificationsState(isLoading: $isLoading, isMoreLoading: $isMoreLoading, notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationsState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isMoreLoading, isMoreLoading) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isMoreLoading),
      const DeepCollectionEquality().hash(_notifications));

  @JsonKey(ignore: true)
  @override
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      __$$_NotificationsStateCopyWithImpl<_$_NotificationsState>(
          this, _$identity);
}

abstract class _NotificationsState extends NotificationsState {
  const factory _NotificationsState(
      {final bool isLoading,
      final bool isMoreLoading,
      final List<BlogData> notifications}) = _$_NotificationsState;
  const _NotificationsState._() : super._();

  @override
  bool get isLoading;
  @override
  bool get isMoreLoading;
  @override
  List<BlogData> get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationsStateCopyWith<_$_NotificationsState> get copyWith =>
      throw _privateConstructorUsedError;
}
