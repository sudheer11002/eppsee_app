// To parse this JSON data, do
//
//     final loginRequest = loginRequestFromJson(jsonString);

import 'dart:convert';

ForgetPasswordRequestModel loginRequestFromJson(String str) =>
    ForgetPasswordRequestModel.fromJson(json.decode(str));

String loginRequestToJson(ForgetPasswordRequestModel data) => json.encode(data.toJson());

class ForgetPasswordRequestModel {
  String? email;

  ForgetPasswordRequestModel({
    this.email,
  });

  factory ForgetPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordRequestModel(
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
      };
}
