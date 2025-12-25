import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/common_widgets/custom_text_widget.dart';
import 'package:eppsee/src/constants/app_strings.dart';
import 'package:eppsee/src/features/auth/presentation/controllers/forget_password_controller.dart';

import '../../../../common_widgets/common_gradient_btn.dart';
import '../../../../common_widgets/common_header_bg.dart';
import '../../../../common_widgets/custom_input_field.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';

class ForgetPasswordPage extends GetView<ForgetPasswordController> {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryDark,
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            CommonHeaderBackground(
              leftIcon: AppAssets.backArrow,
              onLeftTap: () {
                controller.clearForgotPasswordFields();
                Get.back();
              },
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDimens.size20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(AppDimens.size40),

                      ///
                      /// Header txt
                      ///
                      CustomTextWidget(
                        text: AppStrings.forgot,
                        color: AppColors.white,
                        fontSize: AppDimens.size20,
                        fontWeight: FontWeight.w800,
                        // fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        text: AppStrings.passwordQues,
                        color: AppColors.white,
                        fontSize: AppDimens.size28,
                        fontWeight: FontWeight.w800,
                      ),
                      Gap(AppDimens.size20),
                      CustomTextWidget(
                        text: AppStrings.dummyTextSignup,
                        color: AppColors.white,
                        fontSize: AppDimens.size12,
                      ),
                      Gap(AppDimens.size30),

                      ///
                      /// Email
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.email,
                        hintText: AppStrings.emailEx,
                        // initialValue: "Edward",
                        controller: controller.forgotPasswordController,
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      Gap(AppDimens.size40),

                      CommonGradientButton(
                        onTap: () => controller.forgetPasswordApiCall(),
                        btnText: AppStrings.resetPassword,
                      ),

                      Gap(AppDimens.size40),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
