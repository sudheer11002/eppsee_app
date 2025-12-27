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
          color: AppColors.black87,
          textAlign: TextAlign.center,
          fontSize: AppDimens.size28,
          fontWeight: FontWeight.w700,
        ),
        Gap(AppDimens.size30),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppDimens.size20,
          ),
          child: CustomTextWidget(
            text: body,
            color: AppColors.black54,
            textAlign: TextAlign.center,
            fontSize: AppDimens.size14,
          ),
        ),
      ],
    );
  }
}
