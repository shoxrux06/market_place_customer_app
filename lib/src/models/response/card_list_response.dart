// To parse this JSON data, do
//
//     final cardListResponse = cardListResponseFromJson(jsonString);

import 'dart:convert';

CardListResponse cardListResponseFromJson(String str) => CardListResponse.fromJson(json.decode(str));

String cardListResponseToJson(CardListResponse data) => json.encode(data.toJson());

class CardListResponse {
  CardListResponse({
    required this.result,
    required this.cardList,
  });

  Result result;
  List<CardList> cardList;

  factory CardListResponse.fromJson(Map<String, dynamic> json) => CardListResponse(
    result: Result.fromJson(json["result"]),
    cardList: List<CardList>.from(json["card_list"].map((x) => CardList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result.toJson(),
    "card_list": List<dynamic>.from(cardList.map((x) => x.toJson())),
  };
}

class CardList {
  CardList({
    required this.cardId,
    required this.cardToken,
    required this.pan,
    required this.expiry,
  });

  int cardId;
  String cardToken;
  String pan;
  String expiry;

  factory CardList.fromJson(Map<String, dynamic> json) => CardList(
    cardId: json["card_id"],
    cardToken: json["card_token"],
    pan: json["pan"],
    expiry: json["expiry"],
  );

  Map<String, dynamic> toJson() => {
    "card_id": cardId,
    "card_token": cardToken,
    "pan": pan,
    "expiry": expiry,
  };
}

class Result {
  Result({
    required this.code,
    required this.description,
  });

  String code;
  String description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    code: json["code"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "description": description,
  };
}
