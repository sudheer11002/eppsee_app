import 'package:flutter/material.dart';

import '../../../../common_widgets/common_icon_btn.dart';
import '../../../../common_widgets/custom_text_widget.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';
import '../../../../constants/app_strings.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.size20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              CustomTextWidget(
                text: AppStrings.welcome,
                color: AppColors.primaryDark,
                fontSize: AppDimens.size16,
                fontWeight: FontWeight.w500,
              ),
              CustomTextWidget(
                text: AppStrings.deleteUserNameAdward,
                color: AppColors.primaryDark,
                fontSize: AppDimens.size28,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          const CommonIconButton(icon: AppAssets.notification),
        ],
      ),
    );
  }
}
