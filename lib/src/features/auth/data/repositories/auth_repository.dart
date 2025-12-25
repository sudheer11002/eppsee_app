import 'dart:convert';

import 'package:eppsee/src/core/common_models/common_api_response_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/request/forget_password_request_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/request/login_request_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/request/verify_otp_request_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/response/forget_password_response_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/response/login_response_model.dart';

import '../../../../core/env/environment.dart';
import '../../../../core/network/base_client.dart';
import '../data_models/request/signup_request_model.dart';
import '../data_models/request/update_password_request_model.dart';
import '../data_models/response/signup_response_model.dart';

class AuthRepository extends DioBaseService {
  AuthRepository._() : super(Environment().config.apiHost + Environment().config.path);
  static AuthRepository? _instance;
  static AuthRepository get instance => _instance ??= AuthRepository._();

  static const _signup = 'users/signup';
  static const _login = 'users/login';
  static const _forgetPassword = 'users/sendOtp';
  static const _verifyOtp = 'users/verifyOtp';
  static const _updatePassword = 'users/resetPassword';

  /// Login api call
  Future<SignUpResponseModel> signup(SignUpRequestModel signUpRequest) async {
    try {
      final response = await postJson(_signup, signUpRequest.toJson());
      final signUpResponseModel = SignUpResponseModel.fromJson(jsonDecode(response));
      return signUpResponseModel;
    } catch (dioException) {
      return Future.error(dioException);
    }
  }

  /// Login api call
  Future<LoginResponseModel> login(LoginRequestModel loginRequest) async {
    try {
      final response = await postJson(_login, loginRequest.toJson());
      final loginResponseModel = LoginResponseModel.fromJson(jsonDecode(response));
      return loginResponseModel;
    } catch (dioException) {
      return Future.error(dioException);
    }
  }

  /// Forget Password api call
  Future<ForgetPasswordResponseModel> forgetPassword(
      ForgetPasswordRequestModel forgetPasswordRequest) async {
    try {
      final response = await postJson(_forgetPassword, forgetPasswordRequest.toJson());
      final forgetPasswordResponseModel =
          ForgetPasswordResponseModel.fromJson(jsonDecode(response));
      return forgetPasswordResponseModel;
    } catch (dioException) {
      return Future.error(dioException);
    }
  }

  /// Verify Code api call
  Future<CommonApiResponseModel> verifyCode(VerifyCodeRequestModel verifyCodeRequest) async {
    try {
      final response = await postJson(_verifyOtp, verifyCodeRequest.toJson());
      final verifyCodeResponseModel = CommonApiResponseModel.fromJson(jsonDecode(response));
      return verifyCodeResponseModel;
    } catch (dioException) {
      return Future.error(dioException);
    }
  }

  /// Update Password api call
  Future<CommonApiResponseModel> updatePassword(
      UpdatePasswordRequestModel updatePasswordRequest) async {
    try {
      final response = await postJson(_updatePassword, updatePasswordRequest.toJson());
      final updatePasswordResponseModel = CommonApiResponseModel.fromJson(jsonDecode(response));
      return updatePasswordResponseModel;
    } catch (dioException) {
      return Future.error(dioException);
    }
  }
}
