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
              AppColors.primaryGradientColor.withValues(alpha: 0.9),
              AppColors.secondaryGradientColor.withValues(alpha: 0.9),
            ],
            stops: const [
              0.0,
              0.8, // 70% first color
            ],
          ),
        ),
        child: Center(
          child: CustomTextWidget(
            text: btnText,
            color: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: AppDimens.size14,

            // onTap: controller.navigateToSignup,
          ),
        ),
      ),
    );
  }
}
