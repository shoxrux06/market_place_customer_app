import 'dart:io';

import 'package:dio/dio.dart';
import 'package:g_customer/src/core/handlers/api_result.dart';
import 'package:g_customer/src/models/response/UserResponse.dart';

import 'package:g_customer/src/models/response/video_response.dart';

import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../models/response/VideoListResponseTest.dart';
import '../../models/response/video_list_response.dart';
import '../video_repository.dart';
import 'package:http/http.dart' as http;

class VideoRepositoryImpl extends VideoRepository {
  @override
  Future<ApiResult<VideoResponse>> createVideo({
    required String userId,
    required File name,
    required String description,
  }) async {
    var formData = FormData.fromMap(
      {
        'user_id': userId,
        'description': description,
        'name': await MultipartFile.fromFile(
          name.path,
          filename: 'video.mp4',
          // contentType: MediaType.parse('application/json'),
        ),
      },
    );

    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/user/importVideo',
        data: formData,
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

  @override
  Future<ApiResult<UserResponse>> getUsers() async{
    try {
      // final client = inject<HttpService>().client(requireAuth: true);
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts')
      );
      return ApiResult.success(
        data: UserResponse.fromJson(response.body),
      );
    } catch (e) {
      print('==> get video List failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
