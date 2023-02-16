import 'dart:convert';

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
        Uri.parse('https://api.safin24.uz/api/v1/dashboard/user/importVideo'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    final jsonUser = jsonDecode(response.body);
    print('videoList in Service$jsonUser}');
    return jsonUser;
    // final connected = await AppConnectivity.connectivity();
    // if(connected){
    //   final response = await _videoRepository.getVideoList();
    //   response.when(success: (data){
    //     print('Video in Notifier success ::::${data.data}:::');
    //     return data.data;
    //   }, failure: (failure){
    //     print('Video in Notifier error ::::$failure:::');
    //   });
    // }
    // return <Video>[];
  }

  Future<dynamic> getUsers() async{
    try {
      // final client = inject<HttpService>().client(requireAuth: true);
      final response = await http.get(
          Uri.parse('https://jsonplaceholder.typicode.com/posts')
      );
      print('userList${response.body}');
      final jsonUser = jsonDecode(response.body);
      print('userListJson$jsonUser');

      return jsonUser;
    } catch (e) {
      print('==> get video List failure: $e');
      return 'Error';
    }
  }

}