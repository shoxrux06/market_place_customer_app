// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_video_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddVideoState {
  MediaInfo? get mediaInfo => throw _privateConstructorUsedError;
  List<Video> get videoList => throw _privateConstructorUsedError;
  bool get isFetchingVideo => throw _privateConstructorUsedError;
  bool get isCompressingVideo => throw _privateConstructorUsedError;
  bool get isUploadingVideo => throw _privateConstructorUsedError;
  File? get videoFile => throw _privateConstructorUsedError;
  File? get imageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddVideoStateCopyWith<AddVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddVideoStateCopyWith<$Res> {
  factory $AddVideoStateCopyWith(
          AddVideoState value, $Res Function(AddVideoState) then) =
      _$AddVideoStateCopyWithImpl<$Res>;
  $Res call(
      {MediaInfo? mediaInfo,
      List<Video> videoList,
      bool isFetchingVideo,
      bool isCompressingVideo,
      bool isUploadingVideo,
      File? videoFile,
      File? imageFile});
}

/// @nodoc
class _$AddVideoStateCopyWithImpl<$Res>
    implements $AddVideoStateCopyWith<$Res> {
  _$AddVideoStateCopyWithImpl(this._value, this._then);

  final AddVideoState _value;
  // ignore: unused_field
  final $Res Function(AddVideoState) _then;

  @override
  $Res call({
    Object? mediaInfo = freezed,
    Object? videoList = freezed,
    Object? isFetchingVideo = freezed,
    Object? isCompressingVideo = freezed,
    Object? isUploadingVideo = freezed,
    Object? videoFile = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
      mediaInfo: mediaInfo == freezed
          ? _value.mediaInfo
          : mediaInfo // ignore: cast_nullable_to_non_nullable
              as MediaInfo?,
      videoList: videoList == freezed
          ? _value.videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      isFetchingVideo: isFetchingVideo == freezed
          ? _value.isFetchingVideo
          : isFetchingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompressingVideo: isCompressingVideo == freezed
          ? _value.isCompressingVideo
          : isCompressingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadingVideo: isUploadingVideo == freezed
          ? _value.isUploadingVideo
          : isUploadingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      videoFile: videoFile == freezed
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as File?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
abstract class _$$_AddVideoStateCopyWith<$Res>
    implements $AddVideoStateCopyWith<$Res> {
  factory _$$_AddVideoStateCopyWith(
          _$_AddVideoState value, $Res Function(_$_AddVideoState) then) =
      __$$_AddVideoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {MediaInfo? mediaInfo,
      List<Video> videoList,
      bool isFetchingVideo,
      bool isCompressingVideo,
      bool isUploadingVideo,
      File? videoFile,
      File? imageFile});
}

/// @nodoc
class __$$_AddVideoStateCopyWithImpl<$Res>
    extends _$AddVideoStateCopyWithImpl<$Res>
    implements _$$_AddVideoStateCopyWith<$Res> {
  __$$_AddVideoStateCopyWithImpl(
      _$_AddVideoState _value, $Res Function(_$_AddVideoState) _then)
      : super(_value, (v) => _then(v as _$_AddVideoState));

  @override
  _$_AddVideoState get _value => super._value as _$_AddVideoState;

  @override
  $Res call({
    Object? mediaInfo = freezed,
    Object? videoList = freezed,
    Object? isFetchingVideo = freezed,
    Object? isCompressingVideo = freezed,
    Object? isUploadingVideo = freezed,
    Object? videoFile = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$_AddVideoState(
      mediaInfo: mediaInfo == freezed
          ? _value.mediaInfo
          : mediaInfo // ignore: cast_nullable_to_non_nullable
              as MediaInfo?,
      videoList: videoList == freezed
          ? _value._videoList
          : videoList // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      isFetchingVideo: isFetchingVideo == freezed
          ? _value.isFetchingVideo
          : isFetchingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isCompressingVideo: isCompressingVideo == freezed
          ? _value.isCompressingVideo
          : isCompressingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      isUploadingVideo: isUploadingVideo == freezed
          ? _value.isUploadingVideo
          : isUploadingVideo // ignore: cast_nullable_to_non_nullable
              as bool,
      videoFile: videoFile == freezed
          ? _value.videoFile
          : videoFile // ignore: cast_nullable_to_non_nullable
              as File?,
      imageFile: imageFile == freezed
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_AddVideoState extends _AddVideoState {
  const _$_AddVideoState(
      {required this.mediaInfo,
      final List<Video> videoList = const [],
      this.isFetchingVideo = false,
      this.isCompressingVideo = false,
      this.isUploadingVideo = false,
      required this.videoFile,
      required this.imageFile})
      : _videoList = videoList,
        super._();

  @override
  final MediaInfo? mediaInfo;
  final List<Video> _videoList;
  @override
  @JsonKey()
  List<Video> get videoList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoList);
  }

  @override
  @JsonKey()
  final bool isFetchingVideo;
  @override
  @JsonKey()
  final bool isCompressingVideo;
  @override
  @JsonKey()
  final bool isUploadingVideo;
  @override
  final File? videoFile;
  @override
  final File? imageFile;

  @override
  String toString() {
    return 'AddVideoState(mediaInfo: $mediaInfo, videoList: $videoList, isFetchingVideo: $isFetchingVideo, isCompressingVideo: $isCompressingVideo, isUploadingVideo: $isUploadingVideo, videoFile: $videoFile, imageFile: $imageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddVideoState &&
            const DeepCollectionEquality().equals(other.mediaInfo, mediaInfo) &&
            const DeepCollectionEquality()
                .equals(other._videoList, _videoList) &&
            const DeepCollectionEquality()
                .equals(other.isFetchingVideo, isFetchingVideo) &&
            const DeepCollectionEquality()
                .equals(other.isCompressingVideo, isCompressingVideo) &&
            const DeepCollectionEquality()
                .equals(other.isUploadingVideo, isUploadingVideo) &&
            const DeepCollectionEquality().equals(other.videoFile, videoFile) &&
            const DeepCollectionEquality().equals(other.imageFile, imageFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(mediaInfo),
      const DeepCollectionEquality().hash(_videoList),
      const DeepCollectionEquality().hash(isFetchingVideo),
      const DeepCollectionEquality().hash(isCompressingVideo),
      const DeepCollectionEquality().hash(isUploadingVideo),
      const DeepCollectionEquality().hash(videoFile),
      const DeepCollectionEquality().hash(imageFile));

  @JsonKey(ignore: true)
  @override
  _$$_AddVideoStateCopyWith<_$_AddVideoState> get copyWith =>
      __$$_AddVideoStateCopyWithImpl<_$_AddVideoState>(this, _$identity);
}

abstract class _AddVideoState extends AddVideoState {
  const factory _AddVideoState(
      {required final MediaInfo? mediaInfo,
      final List<Video> videoList,
      final bool isFetchingVideo,
      final bool isCompressingVideo,
      final bool isUploadingVideo,
      required final File? videoFile,
      required final File? imageFile}) = _$_AddVideoState;
  const _AddVideoState._() : super._();

  @override
  MediaInfo? get mediaInfo;
  @override
  List<Video> get videoList;
  @override
  bool get isFetchingVideo;
  @override
  bool get isCompressingVideo;
  @override
  bool get isUploadingVideo;
  @override
  File? get videoFile;
  @override
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$_AddVideoStateCopyWith<_$_AddVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}
