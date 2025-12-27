import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/common_widgets/custom_button.dart';
import 'package:eppsee/src/features/onboarding/presentation/controllers/onboarding_controller.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';
import '../widgets/onboarding_title_body_text.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryAppBGColour,
        child: Stack(
          children: [
            SafeArea(
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  AppAssets.worldMap,
                  color: AppColors.primaryDark,
                ),
              ),
            ),
            SafeArea(
              child: SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      AppAssets.appLogo,
                      scale: 6,
                      
                    ),
                    Obx(() {
                      return OnBoardingTitleBodyText(
                        title: controller.onBoardingContent.title,
                        body: controller.onBoardingContent.body,
                      );
                    }),
                    Gap(Get.height / 3.5),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.size40,
                        vertical: AppDimens.size20,
                      ),
                      child: Row(
                        spacing: AppDimens.size10,
                        children: [
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: List.generate(3, (index) {
                                final isSelected =
                                    controller.selectedOnBoardingIndex.value == index;
                                return Container(
                                  margin: const EdgeInsets.only(right: 6),
                                  height: AppDimens.size12,
                                  width: AppDimens.size12,
                                  decoration: BoxDecoration(
                                    gradient: isSelected
                                        ? LinearGradient(
                                            colors: [
                                              AppColors.primaryGradientColor.withValues(alpha: 0.9),
                                              AppColors.secondaryGradientColor
                                                  .withValues(alpha: 0.9),
                                            ],
                                            stops: const [
                                              0.0,
                                              0.8, // 70% first color
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                          )
                                        : null,
                                    color: isSelected ? null : AppColors.lightGrey,
                                    borderRadius: BorderRadius.circular(AppDimens.size8),
                                  ),
                                );
                              }),
                            );
                          }),
                          Spacer(),
                          Obx(() {
                            return CustomButtonWidget(
                              width: AppDimens.size120,
                              text: controller.onBoardingContent.buttonText,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primaryGradientColor,
                                  AppColors.secondaryGradientColor,
                                ],
                                stops: const [
                                  0.0,
                                  0.8, // 70% first color
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderColor: AppColors.white,
                              onTap: controller.nextOrComplete,
                            );
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
