import 'dart:io';

import 'package:g_customer/src/core/handlers/api_result.dart';

import 'package:g_customer/src/models/response/video_response.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../models/response/video_list_response.dart';
import '../video_repository.dart';

class VideoRepositoryImpl extends VideoRepository {

  @override
  Future<ApiResult<VideoResponse>> createVideo({
    required String userId,
    required File name,
    required String description,
  }) async {
    final data = {
      'user_id': userId,
      'name': name,
      'description': description,
    };
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/importVideo',
        data: data,
      );
      print('Upload response *** $response ***');
      return ApiResult.success(
        data: VideoResponse.fromJson(response.data),
      );
    } catch (e) {
      print('==> create video failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<VideoListResponse>> getVideoList() async {
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.get(
        '/api/v1/dashboard/user/importVideo',
      );
      return ApiResult.success(
        data: VideoListResponse.fromJson(response.data),
      );
    } catch (e) {
      print('==> get video List failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
