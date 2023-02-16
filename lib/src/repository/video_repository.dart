import '../core/handlers/handlers.dart';
import '../models/response/UserResponse.dart';
import '../models/response/VideoListResponseTest.dart';
import '../models/response/video_list_response.dart';
import '../models/response/video_response.dart';
import 'dart:io';

abstract class VideoRepository {
  Future<ApiResult<VideoResponse>> createVideo({
    required String userId,
    required File name,
    required String description,
  });

  Future<ApiResult<VideoListResponse>> getVideoList();

  Future<ApiResult<UserResponse>> getUsers();


}
