import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/constants/app_colors.dart';
import 'package:eppsee/src/features/auth/presentation/widgets/verify_phone_dialog.dart';

import '../../../../constants/app_strings.dart';
import '../../../../core/common_models/common_api_response_model.dart';
import '../../../../core/helpers/dialog_helper.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utils/app_utils.dart';
import '../../data/data_models/request/signup_request_model.dart';
import '../../data/data_models/request/verify_otp_request_model.dart';
import '../../data/data_models/response/signup_response_model.dart';
import '../../data/repositories/auth_repository.dart';

class SignupController extends GetxController {
  var isLoading = false.obs;
  var isTermOfUseChecked = false.obs;
  final AuthRepository _authRepo = AuthRepository.instance;

  TextEditingController signUpFirstNameTextController = TextEditingController();
  TextEditingController signUpLastNameTextController = TextEditingController();
  TextEditingController signUpEmailTextController = TextEditingController();
  TextEditingController signUpPhNumberTextController = TextEditingController();
  TextEditingController signUpPasswordNameTextController = TextEditingController();
  TextEditingController signUpConfirmPasswordTextController = TextEditingController();

  /// popup input code
  TextEditingController signUpVerifyCodetextController = TextEditingController();

  /// Helper method to clear all
  void clearAllRegisterTextControllers() {
    final controllers = [
      signUpFirstNameTextController,
      signUpLastNameTextController,
      signUpEmailTextController,
      signUpPhNumberTextController,
      signUpPasswordNameTextController,
      signUpConfirmPasswordTextController,
    ];

    for (final controller in controllers) {
      controller.clear();
    }
  }

  bool validateForm({
    required TextEditingController firstNameController,
    required TextEditingController lastNameController,
    required TextEditingController emailController,
    required TextEditingController phoneController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) {
    // First Name
    if (firstNameController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'First name is required');
      return false;
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(firstNameController.text.trim())) {
      DialogHelper.showToast(message: 'First name must contain only letters');
      return false;
    }

    // Last Name
    if (lastNameController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Last name is required');
      return false;
    }
    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(lastNameController.text.trim())) {
      DialogHelper.showToast(message: 'Last name must contain only letters');
      return false;
    }

    // Email
    if (emailController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Email is required');
      return false;
    }
    if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$").hasMatch(emailController.text.trim())) {
      DialogHelper.showToast(message: 'Enter a valid email address');
      return false;
    }

    // Phone Number
    if (phoneController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Phone number is required');
      return false;
    }
    if (!RegExp(r"^\+?[0-9]{10,15}$").hasMatch(phoneController.text.trim())) {
      DialogHelper.showToast(message: 'Enter a valid phone number');
      return false;
    }

    // Password
    if (passwordController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Password is required');
      return false;
    }
    if (passwordController.text.trim().length < 6) {
      DialogHelper.showToast(message: 'Password must be at least 6 characters');
      return false;
    }

    // Confirm Password
    if (confirmPasswordController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Confirm password is required');
      return false;
    }
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      DialogHelper.showToast(message: 'Passwords do not match');
      return false;
    }
    if (!isTermOfUseChecked.value) {
      DialogHelper.showToast(
        message: 'You must agree to the Terms of Use before continuing',
      );
      return false;
    }

    return true; // ✅ All validations passed
  }

  Future<void> signUpApiCall() async {
    bool isValid = validateForm(
      firstNameController: signUpFirstNameTextController,
      lastNameController: signUpLastNameTextController,
      emailController: signUpEmailTextController,
      phoneController: signUpPhNumberTextController,
      passwordController: signUpPasswordNameTextController,
      confirmPasswordController: signUpConfirmPasswordTextController,
    );

    if (isValid) {
      try {
        AppUtils.showLoading();

        SignUpRequestModel signUpRequest = SignUpRequestModel(
          firstName: signUpFirstNameTextController.text.trim(),
          lastName: signUpLastNameTextController.text.trim(),
          email: signUpEmailTextController.text.trim(),
          dialCode: '+91',
          phoneNo: signUpPhNumberTextController.text.trim(),
          password: signUpConfirmPasswordTextController.text.trim(),
        );
        SignUpResponseModel signUpResponseModel = await _authRepo.signup(signUpRequest);

        final status = getStatusFromCode(signUpResponseModel.code);
        switch (status) {
          case ApiStatus.success:
            AppUtils.hideLoading();

            /// Delete this later
            signUpVerifyCodetextController.text = signUpResponseModel.otp.toString();
            verifyPhoneNumber();

            break;
          case ApiStatus.error:
            AppUtils.hideLoading();
            DialogHelper.showToast(message: signUpResponseModel.message);

            break;
          case ApiStatus.unknown:
            AppUtils.hideLoading();
            DialogHelper.showToast(message: signUpResponseModel.message);

            break;
        }
      } catch (e) {
        AppUtils.hideLoading();
        DialogHelper.showToast(message: AppStrings.anErrorOccurredTryAgain);
      } finally {
        // AppUtils.hideLoading();
      }
    }
  }

  void verifyPhoneNumber() {
    /// Show a custom dialog widget using GetX's built-in dialog method
    Get.dialog(
      const VerifyPhoneDialog(),

      /// Prevents the dialog from being dismissed when the user taps outside
      barrierDismissible: false,

      /// Dark semi-transparent background behind the dialog (dark overlay behind)
      barrierColor: AppColors.black.withValues(alpha: 0.5),
    );
  }

  ///
  /// Verify Cdoe api call
  ///
  Future<void> verifyCodeApiCall() async {
    if (signUpVerifyCodetextController.text.trim().isEmpty) {
      DialogHelper.showToast(message: 'Please enter the code');
      return;
    }
    try {
      AppUtils.showLoading();

      VerifyCodeRequestModel verifyCodeRequest = VerifyCodeRequestModel(
        email: signUpEmailTextController.text.trim(),
        otp: signUpVerifyCodetextController.text.trim(),
      );
      CommonApiResponseModel verifyCodeResponseModel =
          await _authRepo.verifyCode(verifyCodeRequest);

      final status = getStatusFromCode(verifyCodeResponseModel.code);
      switch (status) {
        case ApiStatus.success:
          AppUtils.hideLoading();
          Get.offAllNamed(Routes.dashboard);

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

  void navigateToDashboard() {
    Get.offAllNamed(Routes.dashboard);
  }
}
