import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/core/common_models/common_api_response_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/request/forget_password_request_model.dart';
import 'package:eppsee/src/features/auth/data/data_models/response/forget_password_response_model.dart';

import '../../../../constants/app_strings.dart';
import '../../../../core/helpers/dialog_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../../data/data_models/request/update_password_request_model.dart';
import '../../data/data_models/request/verify_otp_request_model.dart';
import '../../data/repositories/auth_repository.dart';

class ForgetPasswordController extends GetxController {
  final AuthRepository _authRepo = AuthRepository.instance;
  var isLoading = false.obs;
  TextEditingController forgotPasswordController = TextEditingController();
  TextEditingController verifyCodetextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  void clearForgotPasswordFields() {
    forgotPasswordController.clear();
    verifyCodetextController.clear();
    passwordTextController.clear();
    confirmPasswordTextController.clear();
  }

  Future<void> forgetPasswordApiCall() async {
    if (forgotPasswordController.text.trim().isEmpty) {
      DialogHelper.showToast(message: AppStrings.pleaseEnterEmailAddress);
      return;
    }
    try {
      AppUtils.showLoading();
      ForgetPasswordRequestModel forgetPasswordRequest = ForgetPasswordRequestModel(
        email: forgotPasswordController.text.trim().toLowerCase(),
      );
      ForgetPasswordResponseModel forgetPasswordResponseModel =
          await _authRepo.forgetPassword(forgetPasswordRequest);

      final status = getStatusFromCode(forgetPasswordResponseModel.code);
      switch (status) {
        case ApiStatus.success:
          AppUtils.hideLoading();
          verifyCodetextController.text = forgetPasswordResponseModel.data != null
              ? forgetPasswordResponseModel.data!.otp.toString()
              : '';
          Get.toNamed(Routes.verifyCode);

          break;
        case ApiStatus.error:
          AppUtils.hideLoading();
          DialogHelper.showToast(message: forgetPasswordResponseModel.message);

          break;
        case ApiStatus.unknown:
          AppUtils.hideLoading();

          break;
      }
    } catch (e) {
      DialogHelper.showToast(message: AppStrings.anErrorOccurredTryAgain);
      AppUtils.hideLoading();
    } finally {
      // AppUtils.hideLoading();
    }
  }

  ///
  /// Verify Cdoe api call
  ///
  Future<void> verifyCodeApiCall() async {
    // if (verifyCodetextController.text.trim().isEmpty) {
    //   DialogHelper.showToast(message: AppStrings.pleaseEnterEmailAddress);
    //   return;
    // }
    try {
      AppUtils.showLoading();

      VerifyCodeRequestModel verifyCodeRequest = VerifyCodeRequestModel(
        email: forgotPasswordController.text.trim().toLowerCase(),
        otp: verifyCodetextController.text.trim().toLowerCase(),
      );
      CommonApiResponseModel verifyCodeResponseModel =
          await _authRepo.verifyCode(verifyCodeRequest);

      final status = getStatusFromCode(verifyCodeResponseModel.code);
      switch (status) {
        case ApiStatus.success:
          AppUtils.hideLoading();
          Get.toNamed(Routes.updatePassword);

          break;
        case ApiStatus.error:
          AppUtils.hideLoading();
          DialogHelper.showToast(message: verifyCodeResponseModel.message);

          break;
        case ApiStatus.unknown:
          AppUtils.hideLoading();
          DialogHelper.showToast(message: verifyCodeResponseModel.message);

          break;
      }
    } catch (e) {
      AppUtils.hideLoading();
      DialogHelper.showToast(message: AppStrings.anErrorOccurredTryAgain);
    } finally {
      // AppUtils.hideLoading();
    }
  }

  ///
  /// Verify Cdoe api call
  ///
  Future<void> updatePasswordpiCall() async {
    if (passwordTextController.text.trim().isEmpty) {
      DialogHelper.showToast(message: AppStrings.passwordLengthShouldBeEqualOrGreaterThan5);
      return;
    }
    if (confirmPasswordTextController.text.trim().isEmpty) {
      DialogHelper.showToast(message: AppStrings.passwordLengthShouldBeEqualOrGreaterThan5);
      return;
    }
    if (passwordTextController.text.trim() != confirmPasswordTextController.text.trim()) {
      DialogHelper.showToast(message: AppStrings.passwordAndConfirmPasswordDoesNotMatch);
      return;
    }
    try {
      UpdatePasswordRequestModel updatePasswordRequest = UpdatePasswordRequestModel(
        email: forgotPasswordController.text.trim().toLowerCase(),
        newPassword: confirmPasswordTextController.text.trim().toLowerCase(),
      );
      CommonApiResponseModel updatePasswordResponseModel =
          await _authRepo.updatePassword(updatePasswordRequest);

      final status = getStatusFromCode(updatePasswordResponseModel.code);
      switch (status) {
        case ApiStatus.success:
          DialogHelper.showToast(warning: true, message: updatePasswordResponseModel.message);
          clearForgotPasswordFields();
          Get.toNamed(Routes.login);
          break;
        case ApiStatus.error:
          DialogHelper.showToast(message: updatePasswordResponseModel.message.toString());

          break;
        case ApiStatus.unknown:
          break;
      }
      // LoginResponseModel loginResponseModel = await loginRepository.login(loginRequest);
      // AppUtils.hideLoading();
      // AppUtils.showToast(loginResponseModel.message ?? '');
      // sharedPrefs.setString(SharedPrefConstants.authToken, loginResponseModel.data?.token ?? '');
      // sharedPrefs.setString(SharedPrefConstants.role, loginResponseModel.data?.role ?? '');
    } catch (e) {
      // DialogHelper.hideLoading();
      // Logger.logData('Flight Review API Exception', e.toString());
      // Logger.logData('StackTrace', stackTrace.toString());

      DialogHelper.showToast(message: AppStrings.anErrorOccurredTryAgain);

      // return null;
    } finally {
      // DialogHelper.hideLoading();
    }
  }

  void navigateToVerifyCode() {
    Get.toNamed(Routes.verifyCode);
  }
}
