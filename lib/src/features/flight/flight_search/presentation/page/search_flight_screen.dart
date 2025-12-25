import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eppsee/src/common_widgets/common_icon_btn.dart';
import 'package:eppsee/src/common_widgets/custom_text_widget.dart';
import 'package:eppsee/src/constants/app_strings.dart';
import 'package:eppsee/src/features/auth/presentation/controllers/sign_up_controller.dart';

import '../../../../../common_widgets/common_gradient_btn.dart';
import '../../../../../common_widgets/custom_input_field.dart';
import '../../../../../constants/app_assets.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_dimens.dart';

class SearchFlightScreen extends StatelessWidget {
  const SearchFlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppDimens.size20,
        vertical: AppDimens.size24,
      ),
      decoration: BoxDecoration(
          color: AppColors.secondaryDark,
          borderRadius: BorderRadius.circular(
            AppDimens.size30,
          )),
      child: Column(
        children: [
          CustomInputField(
            label: AppStrings.from,
            hintText: 'US - Amsterdam',
            prefixImage: AppAssets.depart,
            prefixGradientColors: [
              AppColors.goldThemeColor,
              AppColors.lightGoldThemeColor,
            ],
            inputFilledColor: AppColors.primaryDark,

            // initialValue: "Edward",
            onChanged: (value) {
              // update controller by value
            },
          ),

          ///
          /// To
          ///
          Gap(AppDimens.size20),
          CustomInputField(
            label: AppStrings.to,
            hintText: 'UAE - Ireland',
            prefixImage: AppAssets.arrival,
            prefixGradientColors: [
              AppColors.goldThemeColor,
              AppColors.lightGoldThemeColor,
            ],
            inputFilledColor: AppColors.primaryDark,

            // initialValue: "Edward",
            onChanged: (value) {
              // update controller by value
            },
          ),

          ///
          /// Depart time & Date
          ///
          Gap(AppDimens.size20),
          CustomInputField(
            label: AppStrings.departure,
            hintText: '09 August 2025',
            prefixImage: AppAssets.calander,
            prefixGradientColors: [
              AppColors.goldThemeColor,
              AppColors.lightGoldThemeColor,
            ],
            inputFilledColor: AppColors.primaryDark,
            // initialValue: "Edward",
            onChanged: (value) {
              // update controller by value
            },
          ),

          ///
          /// Class
          ///
          Gap(AppDimens.size20),
          CustomInputField(
            label: AppStrings.class_,
            hintText: 'Economy',
            prefixImage: AppAssets.seatClass,
            prefixGradientColors: [
              AppColors.goldThemeColor,
              AppColors.lightGoldThemeColor,
            ],
            inputFilledColor: AppColors.primaryDark,
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
            label: AppStrings.passenger,
            hintText: '2',
            prefixImage: AppAssets.passengers,
            prefixGradientColors: [
              AppColors.goldThemeColor,
              AppColors.lightGoldThemeColor,
            ],
            inputFilledColor: AppColors.primaryDark,
            // initialValue: "Edward",
            onChanged: (value) {
              // update controller by value
            },
          ),

          Gap(AppDimens.size30),

          CommonGradientButton(
            // onTap: () => controller.verifyPhoneNumber(),
            btnText: '${AppStrings.search} ${AppStrings.now}',
          ),
        ],
      ),
    );
  }
}
