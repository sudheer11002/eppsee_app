import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eppsee/src/common_widgets/custom_text_widget.dart';
import 'package:eppsee/src/constants/app_assets.dart';
import 'package:eppsee/src/constants/app_strings.dart';

import '../../../../common_widgets/common_gradient_btn.dart';
import '../../../../common_widgets/common_header_bg.dart';
import '../../../../common_widgets/custom_input_field.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';
import '../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: AppColors.primaryBGColorShade,
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CommonHeaderBackground(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.size20,
                ),
                child: Column(
                  children: [
                    Gap(AppDimens.size40),
                    Center(
                      child: Image.asset(
                        AppAssets.appLogo,
                        height: AppDimens.size140,
                        width: AppDimens.size140,
                      ),
                    ),
                    Gap(AppDimens.size20),

                    ///
                    /// Log In input Fields
                    ///
                    /// Email
                    ///
                    Gap(AppDimens.size20),
                    CustomInputField(
                      label: AppStrings.email,
                      hintText: AppStrings.emailEx,
                      controller: controller.loginEmailController,
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
                      controller: controller.loginPassController,
                      isPassword: true,
                      // initialValue: "Edward",
                      onChanged: (value) {
                        // update controller by value
                      },
                    ),

                    Gap(AppDimens.size20),

                    ///
                    /// Header txt
                    ///
                    InkWell(
                      onTap: () => controller.navigateToForgotPassword(),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CustomTextWidget(
                          text: AppStrings.forgotPasswordQues,
                          color: AppColors.black87,
                          fontSize: AppDimens.size12,

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Gap(AppDimens.size20),

                    CommonGradientButton(
                      btnText: AppStrings.signIn,
                      onTap: controller.loginApiCall,
                    ),
                    // Gap(AppDimens.size20),
                    // Center(
                    //   child: RichText(
                    //     text: TextSpan(
                    //       text: '${AppStrings.dontHaveAnAccountQuestionMArk} ',
                    //       style: GoogleFonts.inter(
                    //         fontSize: AppDimens.size14,
                    //         color: AppColors.black,
                    //       ),
                    //       children: <TextSpan>[
                    //         TextSpan(
                    //             text: AppStrings.signUp,
                    //             style: GoogleFonts.inter(
                    //                 color: AppColors.lightGoldThemeColor,
                    //                 fontSize: AppDimens.size14,
                    //                 fontWeight: FontWeight.w500),
                    //             recognizer: TapGestureRecognizer()
                    //               ..onTap = () => controller.navigateToSignup()),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Gap(AppDimens.size20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
