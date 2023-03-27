// To parse this JSON data, do
//
//     final tokenResponse = tokenResponseFromJson(jsonString);

import 'dart:convert';

TokenResponse tokenResponseFromJson(String str) => TokenResponse.fromJson(json.decode(str));

String tokenResponseToJson(TokenResponse data) => json.encode(data.toJson());

class TokenResponse {
  TokenResponse({
    required this.accessToken,
    required this.scope,
    required this.tokenType,
    required this.expiresIn,
  });

  String accessToken;
  String scope;
  String tokenType;
  int expiresIn;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
    accessToken: json["access_token"],
    scope: json["scope"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "scope": scope,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };

  @override
  String toString() {
    return 'TokenResponse{accessToken: $accessToken, scope: $scope, tokenType: $tokenType, expiresIn: $expiresIn}';
  }
}
