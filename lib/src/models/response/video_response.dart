// To parse this JSON data, do
//
//     final videoResponse = videoResponseFromJson(jsonString);

import 'dart:convert';

VideoResponse videoResponseFromJson(String str) => VideoResponse.fromJson(json.decode(str));

String videoResponseToJson(VideoResponse data) => json.encode(data.toJson());

class VideoResponse {
  VideoResponse({
    required this.status,
    required this.message,
  });

  bool status;
  String message;

  factory VideoResponse.fromJson(Map<String, dynamic> json) => VideoResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
