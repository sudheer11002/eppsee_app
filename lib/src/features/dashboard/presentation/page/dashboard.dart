import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/common_gradient_btn.dart';
import '../../../../common_widgets/common_header_bg.dart';
import '../../../../constants/app_assets.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/app_dimens.dart';
import '../../../../routes/app_pages.dart';
import '../../../flight/flight_search/presentation/page/search_flight_screen.dart';
import '../controllers/dashboard_controller.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/dashboard_header_widget.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBGColorShade,
      bottomNavigationBar: const BottomNavigation(),
      body: Container(
        color: AppColors.primaryBGColorShade,
        width: Get.width,
        height: Get.height,
        child: Stack(
          children: [
            CommonHeaderBackground(
              hight: 320,
              imageFit: BoxFit.fitWidth,
              imagePath: AppAssets.verticalWorldMap,
            ),
            Container(
              // color: AppColors.black.withValues(alpha: 0.2),
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Get.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(AppDimens.size20),

                      /// Header (Name & Notification icon)
                      DashboardHeader(),
                      Gap(AppDimens.size20),

                      /// Search Flight
                      // SearchFlightScreen(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
