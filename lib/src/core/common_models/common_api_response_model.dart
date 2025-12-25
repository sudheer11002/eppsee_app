class CommonApiResponseModel {
  int? code;
  String? message;

  CommonApiResponseModel({
    this.code,
    this.message,
  });

  factory CommonApiResponseModel.fromJson(Map<String, dynamic> json) => CommonApiResponseModel(
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
      };
}
