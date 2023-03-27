class BindCardApplyResponse {
  Result? result;
  Data? data;

  BindCardApplyResponse({this.result, this.data});

  BindCardApplyResponse.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'BindCardApplyResponse{result: $result, data: $data}';
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['description'] = this.description;
    return data;
  }

  @override
  String toString() {
    return 'Result{code: $code, description: $description}';
  }
}

class Data {
  int? cardId;
  String? pan;
  String? expiry;
  String? cardHolder;
  int? balance;
  String? phone;
  String? cardToken;

  Data(
      {this.cardId,
        this.pan,
        this.expiry,
        this.cardHolder,
        this.balance,
        this.phone,
        this.cardToken});

  Data.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    pan = json['pan'];
    expiry = json['expiry'];
    cardHolder = json['card_holder'];
    balance = json['balance'];
    phone = json['phone'];
    cardToken = json['card_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['card_id'] = this.cardId;
    data['pan'] = this.pan;
    data['expiry'] = this.expiry;
    data['card_holder'] = this.cardHolder;
    data['balance'] = this.balance;
    data['phone'] = this.phone;
    data['card_token'] = this.cardToken;
    return data;
  }

  @override
  String toString() {
    return 'Data{cardId: $cardId, pan: $pan, expiry: $expiry, cardHolder: $cardHolder, balance: $balance, phone: $phone, cardToken: $cardToken}';
  }
}