import 'dart:convert';

import 'package:g_customer/src/core/constants/app_constants.dart';

import '../../../../../../core/handlers/api_result.dart';
import '../../../../../../core/handlers/handlers.dart';
import '../../../../../../core/utils/app_connectivity.dart';
import '../../../../../../core/utils/local_storage.dart';
import '../../../../../../models/response/UserResponse.dart';
import '../../../../../../models/response/video_list_response.dart';
import '../../../../../../repository/video_repository.dart';
import 'package:http/http.dart' as http;

class VideoService{
  final VideoRepository _videoRepository;

  VideoService(this._videoRepository);

  Future<dynamic> getVideoList() async {
    final String token = LocalStorage.instance.getToken();
    final response = await http.get(
        Uri.parse('${AppConstants.baseUrl}/api/allVideo'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          // 'Authorization': 'Bearer $token',
        }
    );
    final jsonUser = jsonDecode(response.body);
    print('videoList in Service$jsonUser}');
    return jsonUser;

  }


}