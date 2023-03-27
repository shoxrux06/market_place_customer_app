class BindCardResponse {
  Result? result;
  int? transactionId;
  String? phone;

  BindCardResponse({this.result, this.transactionId, this.phone});

  BindCardResponse.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ?  Result.fromJson(json['result']) : null;
    transactionId = json['transaction_id'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['transaction_id'] = transactionId;
    data['phone'] = phone;
    return data;
  }

  @override
  String toString() {
    return 'BindCardResponse{result: $result, transactionId: $transactionId, phone: $phone}';
  }
}

class Result {
  String? code;
  String? description;

  Result({this.code, this.description});

  Result.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    return data;
  }

  @override
  String toString() {
    return 'Result{code: $code, description: $description}';
  }
}