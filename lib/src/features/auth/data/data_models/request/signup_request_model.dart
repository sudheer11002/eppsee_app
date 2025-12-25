class SignUpRequestModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? dialCode;
  String? phoneNo;

  SignUpRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.dialCode,
    this.phoneNo,
  });

  factory SignUpRequestModel.fromJson(Map<String, dynamic> json) => SignUpRequestModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        dialCode: json["dialCode"],
        phoneNo: json["phoneNo"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "dialCode": dialCode,
        "phoneNo": phoneNo,
      };
}
