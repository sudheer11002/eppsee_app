import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import '../../../../common_widgets/custom_text_widget.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';

class OnBoardingTitleBodyText extends StatelessWidget {
  final String title;
  final String body;
  const OnBoardingTitleBodyText({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextWidget(
          text: title,
          color: AppColors.white,
          textAlign: TextAlign.center,
          fontSize: AppDimens.size28,
          fontWeight: FontWeight.w600,
        ),
        Gap(AppDimens.size30),
        CustomTextWidget(
          text: body,
          color: AppColors.textColor,
          textAlign: TextAlign.center,
          fontSize: AppDimens.size14,
        ),
      ],
    );
  }
}
