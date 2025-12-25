import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eppsee/src/common_widgets/custom_text_widget.dart';
import 'package:eppsee/src/constants/app_strings.dart';
import 'package:eppsee/src/features/auth/presentation/controllers/sign_up_controller.dart';

import '../../../../common_widgets/common_gradient_btn.dart';
import '../../../../common_widgets/common_header_bg.dart';
import '../../../../common_widgets/custom_input_field.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';

class SignupPage extends GetView<SignupController> {
  const SignupPage({super.key});

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
                      Gap(AppDimens.size20),

                      ///
                      /// Header txt
                      ///
                      CustomTextWidget(
                        text: AppStrings.lets,
                        color: AppColors.white,
                        fontSize: AppDimens.size20,
                        fontWeight: FontWeight.w800,
                        // fontWeight: FontWeight.bold,
                      ),
                      CustomTextWidget(
                        text: '${AppStrings.signUp} 👇',
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
                      /// Registraction input Fields
                      ///
                      /// First name
                      ///
                      CustomInputField(
                        label: AppStrings.firstName,
                        hintText: AppStrings.firstNameEx,
                        controller: controller.signUpFirstNameTextController,
                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      ///
                      /// Last name
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.lastName,
                        hintText: AppStrings.lastNameEx,
                        controller: controller.signUpLastNameTextController,

                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      ///
                      /// Email
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.email,
                        hintText: AppStrings.emailEx,
                        controller: controller.signUpEmailTextController,

                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      ///
                      /// Phone No
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.phoneNumber,
                        hintText: AppStrings.phoneNumberEx,

                        controller: controller.signUpPhNumberTextController,

                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      ///
                      /// Password
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.password,
                        hintText: AppStrings.passwordEx,
                        controller: controller.signUpPasswordNameTextController,

                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),

                      ///
                      /// Confirm Password
                      ///
                      Gap(AppDimens.size20),
                      CustomInputField(
                        label: AppStrings.confirmPassword,
                        hintText: AppStrings.confirmPasswordEx,
                        controller: controller.signUpConfirmPasswordTextController,

                        // initialValue: "Edward",
                        onChanged: (value) {
                          // update controller by value
                        },
                      ),
                      Gap(AppDimens.size20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: AppDimens.size10,
                        children: [
                          Obx(
                            () {
                              return GestureDetector(
                                onTap: () {
                                  controller.isTermOfUseChecked.value =
                                      !controller.isTermOfUseChecked.value;
                                },
                                child: Container(
                                  height: AppDimens.size20,
                                  width: AppDimens.size20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(AppDimens.size6),
                                    border: Border.all(
                                      color: AppColors.primaryLightDark,
                                      width: 1.8,
                                    ),
                                    color: controller.isTermOfUseChecked.value
                                        ? AppColors.primaryLightDark
                                        : Colors.transparent,
                                  ),
                                  child: controller.isTermOfUseChecked.value
                                      ? const Icon(
                                          Icons.check,
                                          size: 16,
                                          color: Colors.white,
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                text: '${AppStrings.iAgreeToTheTaj} ',
                                style: GoogleFonts.inter(
                                  fontSize: AppDimens.size12,
                                  color: AppColors.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '${AppStrings.termAndUse} ',
                                    style: GoogleFonts.inter(
                                      color: AppColors.lightGoldThemeColor,
                                      fontSize: AppDimens.size12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${AppStrings.and} ',
                                    style: GoogleFonts.inter(
                                      color: AppColors.white,
                                      fontSize: AppDimens.size12,
                                    ),
                                  ),
                                  TextSpan(
                                    text: AppStrings.privacyPolicy,
                                    style: GoogleFonts.inter(
                                      color: AppColors.lightGoldThemeColor,
                                      fontSize: AppDimens.size12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Gap(AppDimens.size20),

                      CommonGradientButton(
                        onTap: () => controller.signUpApiCall(),
                        btnText: AppStrings.signUp,
                      ),
                      Gap(AppDimens.size20),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: '${AppStrings.alreadyHaveAnAccountQuestionMArk} ',
                            style: GoogleFonts.inter(
                              fontSize: AppDimens.size14,
                              color: AppColors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppStrings.signIn,
                                  style: GoogleFonts.inter(
                                      color: AppColors.lightGoldThemeColor,
                                      fontSize: AppDimens.size14,
                                      fontWeight: FontWeight.w500),
                                  recognizer: TapGestureRecognizer()..onTap = () => Get.back()),
                            ],
                          ),
                        ),
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
