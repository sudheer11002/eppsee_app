import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:eppsee/src/features/auth/presentation/controllers/sign_up_controller.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_strings.dart';
import '../../../../constants/app_dimens.dart';
import '../../../../common_widgets/custom_input_field.dart';
import '../../../../common_widgets/common_gradient_btn.dart';
import '../../../../common_widgets/custom_text_widget.dart';

class VerifyPhoneDialog extends GetView<SignupController> {
  const VerifyPhoneDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(AppDimens.size16),
                  Image.asset(AppAssets.appLogo, scale: 5),
                  Gap(AppDimens.size20),
                  CustomTextWidget(
                    text: '${AppStrings.verifyYour} ${AppStrings.phoneNo}',
                    color: AppColors.white,
                    fontSize: AppDimens.size24,
                    fontWeight: FontWeight.w800,
                  ),
                  Gap(AppDimens.size8),
                  CustomTextWidget(
                    text: AppStrings.verificationCodeHasBeenSentTo,
                    color: AppColors.white,
                    fontSize: AppDimens.size12,
                  ),
                  Gap(AppDimens.size8),
                  CustomTextWidget(
                    text: controller.signUpPhNumberTextController.text,
                    color: AppColors.white,
                    fontSize: AppDimens.size12,
                  ),
                  Gap(AppDimens.size30),
                  CustomInputField(
                    label: '',
                    hintText: AppStrings.code,
                    controller: controller.signUpVerifyCodetextController,
                    onChanged: (value) {},
                  ),
                  Gap(AppDimens.size30),
                  CommonGradientButton(
                    onTap: () => controller.verifyCodeApiCall(), // Or navigate
                    btnText: '${AppStrings.verify} ${AppStrings.code}',
                  ),
                ],
              ),
            ),

            // ❌ Close button
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Get.back(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
