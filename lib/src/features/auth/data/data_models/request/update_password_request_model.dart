class UpdatePasswordRequestModel {
  String? email;
  String? newPassword;

  UpdatePasswordRequestModel({
    this.email,
    this.newPassword,
  });

  factory UpdatePasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      UpdatePasswordRequestModel(
        email: json["email"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "newPassword": newPassword,
      };
}
