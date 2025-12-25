// To parse this JSON data, do
//
//     final forgetPAsswordResponseModel = forgetPAsswordResponseModelFromJson(jsonString);

import 'dart:convert';

ForgetPasswordResponseModel forgetPAsswordResponseModelFromJson(String str) =>
    ForgetPasswordResponseModel.fromJson(json.decode(str));

String forgetPAsswordResponseModelToJson(ForgetPasswordResponseModel data) =>
    json.encode(data.toJson());

class ForgetPasswordResponseModel {
  int? code;
  String? message;
  Data? data;

  ForgetPasswordResponseModel({
    this.code,
    this.message,
    this.data,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponseModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  int? otp;

  Data({
    this.otp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}
