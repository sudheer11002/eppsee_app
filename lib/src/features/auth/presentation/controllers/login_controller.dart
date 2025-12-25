import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/features/auth/data/data_models/request/login_request_model.dart';

import '../../../../constants/app_strings.dart';
import '../../../../core/helpers/dialog_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../../data/data_models/response/login_response_model.dart';
import '../../data/repositories/auth_repository.dart';

class LoginController extends GetxController {
  // final AuthApiProvider _apiProvider = AuthApiProvider();
  // AuthApiProvider loginRepository = AuthApiProvider.instance;
  final AuthRepository _authRepo = AuthRepository.instance;

  var isLoading = false.obs;

  TextEditingController loginEmailController = TextEditingController(text: kDebugMode ? "" : null);
  TextEditingController loginPassController = TextEditingController(text: kDebugMode ? "" : null);

  Future<void> loginApiCall() async {
    if (loginEmailController.text.trim().isEmpty) {
      DialogHelper.showToast(message: AppStrings.pleaseEnterEmailAddress);
      return;
    }
    try {
      AppUtils.showLoading();

      LoginRequestModel loginRequest = LoginRequestModel(
        email: loginEmailController.text.trim().toLowerCase(),
        password: loginPassController.text.trim(),
      );
      LoginResponseModel loginResponseModel = await _authRepo.login(loginRequest);

      // LoginResponseModel? response = await _apiProvider.loginApiCall(
      //   email: loginEmailController.text.trim().toLowerCase(),
      //   password: loginPassController.text.trim(),
      // );

      final status = getStatusFromCode(loginResponseModel.code);
      switch (status) {
        case ApiStatus.success:
          AppUtils.hideLoading();
          Get.offAllNamed(Routes.dashboard);

          break;
        case ApiStatus.error:
          AppUtils.hideLoading();
          DialogHelper.showToast(message: loginResponseModel.message);

          break;
        case ApiStatus.unknown:
          AppUtils.hideLoading();
          DialogHelper.showToast(message: loginResponseModel.message);

          break;
      }
      // LoginResponseModel loginResponseModel = await loginRepository.login(loginRequest);
      // AppUtils.hideLoading();
      // AppUtils.showToast(loginResponseModel.message ?? '');
      // sharedPrefs.setString(SharedPrefConstants.authToken, loginResponseModel.data?.token ?? '');
      // sharedPrefs.setString(SharedPrefConstants.role, loginResponseModel.data?.role ?? '');
    } catch (e) {
      AppUtils.hideLoading();
      DialogHelper.showToast(message: AppStrings.anErrorOccurredTryAgain);
    } finally {
      // AppUtils.hideLoading();
    }
  }

  void navigateToSignup() {
    Get.toNamed(Routes.signUp);
  }

  void navigateToForgotPassword() {
    Get.toNamed(Routes.forgotPassword);
  }

  void navigateToDashboard() {
    Get.offAllNamed(Routes.dashboard);
  }
}
