// To parse this JSON data, do
//
//     final videoListResponse = videoListResponseFromJson(jsonString);

import 'dart:convert';

VideoListResponse videoListResponseFromJson(String str) => VideoListResponse.fromJson(json.decode(str));

String videoListResponseToJson(VideoListResponse data) => json.encode(data.toJson());

class VideoListResponse {
  VideoListResponse({
    required this.data,
  });

  List<Video> data;

  factory VideoListResponse.fromJson(Map<String, dynamic> json) => VideoListResponse(
    data: List<Video>.from(json["data"].map((x) => Video.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Video {
  Video({
    required this.id,
    required this.userId,
    required this.imageName,
    required this.description,
  });

  int id;
  int userId;
  String imageName;
  String description;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    id: json["id"],
    userId: json["user_id"],
    imageName: json["image_name"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "image_name": imageName,
    "description": description,
  };
}
