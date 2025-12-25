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

class VerifyCodePage extends GetView<ForgetPasswordController> {
  const VerifyCodePage({super.key});

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
              onLeftTap: () => Get.back(),
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
                        text: AppStrings.enter,
                        color: AppColors.white,
                        fontSize: AppDimens.size20,
                        fontWeight: FontWeight.w800,
                        // fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        text: AppStrings.code,
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
                        label: '${AppStrings.verify} ${AppStrings.code}',
                        hintText: AppStrings.code,
                        keyboardType: TextInputType.number,
                        controller: controller.verifyCodetextController,
                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      Gap(AppDimens.size40),

                      CommonGradientButton(
                        onTap: () => controller.verifyCodeApiCall(),
                        btnText: '${AppStrings.confirm} ${AppStrings.email}',
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
