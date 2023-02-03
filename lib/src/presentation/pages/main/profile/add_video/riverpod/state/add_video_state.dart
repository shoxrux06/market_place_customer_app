import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../../../../models/response/video_list_response.dart';
import '../../../../../../../models/response/video_response.dart';

part 'add_video_state.freezed.dart';

@freezed
class AddVideoState with _$AddVideoState {

  const factory AddVideoState({
    required MediaInfo? mediaInfo,
    @Default([]) List<Video> videoList,
    @Default(false) bool isCompressingVideo,
    required  File? videoFile,
}) = _AddVideoState;

   const AddVideoState._();
}