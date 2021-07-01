// To parse this JSON data, do
//
//     final generalResponseModel = generalResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:cable_vasool/utils/utils.dart';

GeneralResponseModel? generalResponseModelFromJson(String? str) {
  try{
    return GeneralResponseModel.fromJson(json.decode(str!));
  } catch (e) {
    logger.e('json decode error', e);
    return null;
  }
}

String generalResponseModelToJson(GeneralResponseModel data) =>
    json.encode(data.toJson());

class GeneralResponseModel {
  GeneralResponseModel({
    this.message,
    this.response,
  });

  String? message;
  bool? response;

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) =>
      GeneralResponseModel(
        message: json["message"] == null ? "" : json["message"],
        response: json["response"] == null ? false : json["response"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "response": response == null ? null : response,
      };
}
