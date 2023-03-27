class GetTokenResponse {
  String? accessToken;
  String? scope;
  String? tokenType;
  int? expiresIn;

  GetTokenResponse({
    this.accessToken,
    this.scope,
    this.tokenType,
    this.expiresIn,
  });

  GetTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['access_token'] = accessToken;
    data['scope'] = scope;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
