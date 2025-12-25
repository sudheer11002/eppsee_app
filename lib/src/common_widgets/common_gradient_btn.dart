import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';
import 'custom_text_widget.dart';

class CommonGradientButton extends StatelessWidget {
  String btnText;
  double? width;
  double? hight;
  final VoidCallback? onTap;

  CommonGradientButton({
    required this.btnText,
    super.key,
    this.onTap,
    this.width = double.infinity,
    this.hight = AppDimens.size60,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        AppDimens.size16,
      ),
      child: Container(
        width: width, // full width
        height: hight, // set your height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            AppDimens.size16,
          ), // rounded corners
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.leftColourShade,
              AppColors.rightColourShade,
            ],
            stops: [
              0.5, // Blue takes 80% width
              1.0, // Red only blends in last 20%
            ],
          ),
        ),
        child: Center(
          child: CustomTextWidget(
            text: btnText,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: AppDimens.size14,

            // onTap: controller.navigateToSignup,
          ),
        ),
      ),
    );
  }
}
