import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/common_widgets/common_icon_btn.dart';
import 'package:eppsee/src/constants/app_assets.dart';
import 'package:eppsee/src/constants/app_dimens.dart';

import '../constants/app_colors.dart';

class CommonHeaderBackground extends StatelessWidget {
  final Widget? widget;
  final double hight;

  // 👇 new fields for dynamic icons
  final String? leftIcon;
  final String? rightIcon;
  final String imagePath;
  final VoidCallback? onLeftTap;
  final VoidCallback? onRightTap;
  final BoxFit? imageFit;
  final double? imageHeight;
  final double? imageWidth;

  const CommonHeaderBackground({
    super.key,
    this.widget,
    this.imagePath = AppAssets.fullWorldMap,
    this.hight = AppDimens.size130,
    this.leftIcon,
    this.rightIcon,
    this.onLeftTap,
    this.imageHeight,
    this.imageWidth,
    this.onRightTap,
    this.imageFit = BoxFit.fitWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: hight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(AppDimens.size36),
          bottomRight: Radius.circular(AppDimens.size36),
        ),
        color: AppColors.secondaryDark,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: imageFit,
          colorFilter: ColorFilter.mode(
            AppColors.white.withValues(alpha: 0.7),
            BlendMode.srcIn,
          ),
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppDimens.size20,
          top: kToolbarHeight,
          right: AppDimens.size20,
        ),
        child: Stack(
          children: [
            // 👈 left icon
            if (leftIcon != null)
              Align(
                alignment: Alignment.centerLeft,
                child: CommonIconButton(
                  onTap: onLeftTap,
                  icon: leftIcon ?? '',
                ),
              ),

            // 👈 center widget (your title, etc.)
            if (widget != null)
              Align(
                alignment: Alignment.center,
                child: widget!,
              ),

            // 👈 right icon
            if (rightIcon != null)
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: onRightTap,
                  child: CommonIconButton(
                    onTap: onRightTap,
                    icon: rightIcon ?? '',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
