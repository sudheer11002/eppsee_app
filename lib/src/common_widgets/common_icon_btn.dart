import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

class CommonIconButton extends StatelessWidget {
  final VoidCallback? onTap; // required handler
  final String icon;
  final double size;
  final double padding;
  const CommonIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size = AppDimens.size40,
    this.padding = AppDimens.size10,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.size40,
        width: AppDimens.size40,
        decoration: BoxDecoration(
          color: AppColors.primaryDark,
          borderRadius: BorderRadius.circular(
            AppDimens.size28,
          ),
          border: Border.all(
            color: AppColors.primaryLightDark,
            width: 1.8,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(
            padding,
          ),
          child: Image.asset(
            icon,
          ),
        ),
      ),
    );
  }
}
