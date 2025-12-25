class VerifyCodeRequestModel {
  String? email;
  String? otp;

  VerifyCodeRequestModel({
    this.email,
    this.otp,
  });

  factory VerifyCodeRequestModel.fromJson(Map<String, dynamic> json) => VerifyCodeRequestModel(
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}
