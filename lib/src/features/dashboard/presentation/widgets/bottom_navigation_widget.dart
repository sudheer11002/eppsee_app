import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_text_widget.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';
import '../../../../constants/app_strings.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).padding.bottom;

    return Container(
      color: AppColors.black.withValues(alpha: 0.2), // dim overlay

      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppDimens.size30),
          topRight: Radius.circular(AppDimens.size30),
        ),
        child: Container(
          height: Platform.isAndroid
              ? AppDimens.size100 + bottomInset
              : AppDimens.size64 + bottomInset, //  extend behind safe area
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.size20,
            vertical: AppDimens.size24,
          ),
          color: AppColors.secondaryDark,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(icon: AppAssets.home, label: AppStrings.home),
              _divider(),
              _NavItem(icon: AppAssets.bookings, label: AppStrings.bookings),
              _divider(),
              _NavItem(icon: AppAssets.user, label: AppStrings.profile),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() => Container(
        width: 2,
        height: AppDimens.size20,
        decoration: BoxDecoration(
          color: AppColors.primaryLightDark,
          borderRadius: BorderRadius.circular(AppDimens.size30),
        ),
      );
}

class _NavItem extends StatelessWidget {
  final String icon;
  final String label;

  const _NavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          height: AppDimens.size24,
          width: AppDimens.size24,
          color: AppColors.white,
        ),
        const SizedBox(height: 4),
        CustomTextWidget(
          text: label,
          color: AppColors.white,
          fontSize: AppDimens.size14,
        ),
      ],
    );
  }
}
