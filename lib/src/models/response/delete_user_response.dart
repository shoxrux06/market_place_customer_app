// To parse this JSON data, do
//
//     final deleteUserResponse = deleteUserResponseFromJson(jsonString);

import 'dart:convert';

DeleteUserResponse deleteUserResponseFromJson(String str) => DeleteUserResponse.fromJson(json.decode(str));

String deleteUserResponseToJson(DeleteUserResponse data) => json.encode(data.toJson());

class DeleteUserResponse {
  DeleteUserResponse({
    required this.timestamp,
    required this.status,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  DateTime timestamp;
  bool status;
  String message;
  String statusCode;
  List<dynamic> data;

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) => DeleteUserResponse(
    timestamp: DateTime.parse(json["timestamp"]),
    status: json["status"]??DateTime.now(),
    message: json["message"]??false,
    statusCode: json["statusCode"]??'',
    data: json["data"] != null?List<dynamic>.from(json["data"].map((x) => x)):[],
  );

  Map<String, dynamic> toJson() => {
    "timestamp": timestamp.toIso8601String(),
    "status": status,
    "message": message,
    "statusCode": statusCode,
    "data": List<dynamic>.from(data.map((x) => x)),
  };
}
