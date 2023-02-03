import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/state/add_video_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../../../../core/utils/app_connectivity.dart';
import '../../../../../../../core/utils/app_helpers.dart';
import '../../../../../../../repository/video_repository.dart';

class AddVideoNotifier extends StateNotifier<AddVideoState> {
  final VideoRepository _videoRepository;

  AddVideoNotifier(this._videoRepository)
      : super(
          AddVideoState(
            mediaInfo: MediaInfo(path: ''),
            videoFile: File(''),
          ),
        );

  Future<void> getVideoList() async {
    final connected = await AppConnectivity.connectivity();
    if(connected){
      final response = await _videoRepository.getVideoList();

      response.when(success: (data){
        print('Video in Notifier success ::::${data.data}:::');
        state.copyWith(
          videoList: data.data,
        );
      }, failure: (failure){
        print('Video in Notifier error ::::$failure:::');
      });
    }

  }

  Future<void> createVideo({
    required String userId,
    required File name,
    required String description,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      final response = await _videoRepository.createVideo(
        userId: userId,
        name: name,
        description: description,
      );

      response.when(success: (data) {
        state.copyWith();
      }, failure: (failure) {});
    }
    state.copyWith();
  }

  Future<void> baseFunc({required ImageSource source}) async {
    XFile? theVideo = await ImagePicker().pickVideo(source: source);

    if(theVideo != null){
      state.copyWith(isCompressingVideo: true);
    }

    File? inFile;
    inFile = File(theVideo?.path ?? '');

    final mediaInfo = await VideoCompress.compressVideo(
      inFile.path ?? '',
      quality: VideoQuality.Res640x480Quality,
      deleteOrigin: false, // It's false by default
    );

    state.copyWith(mediaInfo: mediaInfo, videoFile: mediaInfo?.file,isCompressingVideo: true);

    int sizeIntBytes = inFile.lengthSync() ?? 0;
    double sizeInMB = sizeIntBytes / (1024 * 1024);
    if (kDebugMode) {
      print('$sizeInMB Mb');
    }

    int sizeIntBytes2 = mediaInfo?.file?.lengthSync() ?? 0;
    double sizeInMB2 = sizeIntBytes2 / (1024 * 1024);
    if (kDebugMode) {
      print('Compressed --> $sizeInMB2 Mb');
    }
  }

  Future<void> getFromCamera() async {
    await baseFunc(source: ImageSource.camera);
  }

  Future<void> getFromGallery() async {
    await baseFunc(source: ImageSource.gallery);
  }
}
