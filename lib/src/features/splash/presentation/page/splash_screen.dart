import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eppsee/src/constants/app_assets.dart';
import 'package:eppsee/src/constants/app_colors.dart';
import '../../../../core/helpers/local_storage_helper.dart';
import '../../../../routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigateUser();
    });
  }

  void navigateUser() async {
    var isLoggedIn = await LocalStorageHelper.getIsLogin();
    if (isLoggedIn) {
      Get.offAllNamed(Routes.dashboard);
    } else {
      Get.offAllNamed(Routes.onBoardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryDarkAppBGColour,
      child: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Opacity(
            opacity: 0.2,
            child: Image.asset(
              AppAssets.worldMap,
            ),
          ),
          Image.asset(
            AppAssets.appLogo,
            scale: 4,
          )
        ],
      ),
    );
  }
}
