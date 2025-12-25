class SignUpResponseModel {
  int? code;
  String? message;
  int? otp;

  SignUpResponseModel({
    this.code,
    this.message,
    this.otp,
  });

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) => SignUpResponseModel(
        code: json["code"],
        message: json["message"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "otp": otp,
      };
}
