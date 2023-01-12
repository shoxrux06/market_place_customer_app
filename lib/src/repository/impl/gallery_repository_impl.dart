import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/constants/constants.dart';
import '../../core/di/injection.dart';
import '../../core/handlers/handlers.dart';
import '../../models/models.dart';
import '../repository.dart';

class GalleryRepositoryImpl extends GalleryRepository {
  @override
  Future<ApiResult<GalleryUploadResponse>> uploadImage(
    XFile file,
    UploadType uploadType,
  ) async {
    String type = '';
    switch (uploadType) {
      case UploadType.brands:
        type = 'brands';
        break;
      case UploadType.extras:
        type = 'extras';
        break;
      case UploadType.categories:
        type = 'categories';
        break;
      case UploadType.shopsLogo:
        type = 'shops/logo';
        break;
      case UploadType.shopsBack:
        type = 'shops/background';
        break;
      case UploadType.products:
        type = 'products';
        break;
      case UploadType.reviews:
        type = 'reviews';
        break;
      case UploadType.users:
        type = 'users';
        break;
      default:
        type = 'extras';
        break;
    }
    final data = FormData.fromMap(
      {
        'image': await MultipartFile.fromFile(file.path),
        'type': type,
      },
    );
    try {
      final client = inject<HttpService>().client(requireAuth: true);
      final response = await client.post(
        '/api/v1/dashboard/galleries',
        data: data,
      );
      return ApiResult.success(
        data: GalleryUploadResponse.fromJson(response.data),
      );
    } catch (e) {
      debugPrint('==> upload image failure: $e');
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
