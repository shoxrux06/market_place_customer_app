import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:g_customer/src/models/response/video_list_response.dart';
import 'package:g_customer/src/presentation/pages/main/profile/add_video/riverpod/state/add_video_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_compress/video_compress.dart';

import '../../../../../../../core/utils/app_connectivity.dart';
import '../../../../../../../repository/video_repository.dart';
import '../../add_video_page.dart';

class AddVideoNotifier extends StateNotifier<AddVideoState> {
  final VideoRepository _videoRepository;

  AddVideoNotifier(this._videoRepository)
      : super(
          AddVideoState(
            mediaInfo: MediaInfo(path: ''),
            videoFile: File(''),
            imageFile: File(''),
          ),
        );

  Future<void> getVideoList() async {
    final connected = await AppConnectivity.connectivity();
    if(connected){
      state = state.copyWith(isFetchingVideo: true);
      final response = await _videoRepository.getVideoList();
      response.when(success: (data){
        print('Video in Notifier success ::::${data.data}:::');
        state = state.copyWith(
          videoList: data.data,
        );
        state = state.copyWith(isFetchingVideo: false);
      }, failure: (failure){
        print('Video in Notifier error ::::$failure:::');
        state = state.copyWith(isFetchingVideo: false);
      });
    }
  }

  Future<void> createVideo({
    required int userId,
    required File imageFile,
    required String description,
  }) async {
    final connected = await AppConnectivity.connectivity();
    if (connected) {
      print('isNotEmpty ${state.videoFile?.path.isNotEmpty}');
      var response;
      if(state.videoFile?.path.isNotEmpty??false){
        state = state.copyWith(isUploadingVideo:true);
        response = await _videoRepository.createVideo(
          userId: userId,
          name: state.videoFile??File(''),
          banner: imageFile,
          description: description,
        );
      }
      response.when(success: (data) {
        state = state.copyWith(isUploadingVideo:false);
        print('Video is Created ${data.toString()}');
      }, failure: (failure) {
        state = state.copyWith(isUploadingVideo:false);
      });
    }
  }

  Future<void> baseFunc({required ImageSource source,required BuildContext context}) async {
    XFile? videoFile = await ImagePicker().pickVideo(source: source);

    if(videoFile != null){
      state = state.copyWith(isCompressingVideo: true);
    }

    File? inFile;
    inFile = File(videoFile?.path ?? '');

    final mediaInfo = await VideoCompress.compressVideo(
      inFile.path,
      quality: VideoQuality.Res640x480Quality,
      deleteOrigin: false, // It's false by default
    );

    state = state.copyWith(isCompressingVideo: false,mediaInfo: mediaInfo, videoFile: mediaInfo?.file);

    if(state.videoFile!= null){
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => AddVideoPage()));
    }
    int sizeIntBytes = inFile.lengthSync();
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

  Future<void> baseFuncForImage({required ImageSource source,required BuildContext context}) async {
    XFile? imageFile = await ImagePicker().pickImage(source: source);

    File? file = File(imageFile?.path ?? '');

    state = state.copyWith(imageFile: file);
  }

  getFromCamera(BuildContext context) async {
    await baseFunc(source: ImageSource.camera, context: context);
  }

  getFromGallery(BuildContext context) async {
    await baseFunc(source: ImageSource.gallery, context: context);
  }

  getImageFromCamera(BuildContext context) async {
    await baseFuncForImage(source: ImageSource.camera, context: context);
  }

  getImageFromGallery(BuildContext context) async {
    await baseFuncForImage(source: ImageSource.gallery, context: context);
  }
}
