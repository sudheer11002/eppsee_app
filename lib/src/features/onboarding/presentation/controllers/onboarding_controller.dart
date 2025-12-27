import 'package:get/get.dart';

import '../../../../constants/app_strings.dart';
import '../../../../routes/app_pages.dart';
import '../ui_models/onboarding_content.dart';

class OnboardingController extends GetxController {
  RxInt selectedOnBoardingIndex = 0.obs;

  void onOnBoardingPageChanged(int index) {
    selectedOnBoardingIndex.value = index;
  }

  OnBoardingContent get onBoardingContent {
    switch (selectedOnBoardingIndex.value) {
      case 0:
        return const OnBoardingContent(
          title: AppStrings.buildYourStoreYourWay,
          body: AppStrings.setUpYourOnlineStoreInMinutes,
          buttonText: "Next",
        );
      case 1:
        return const OnBoardingContent(
          title: AppStrings.launchFasterThanEver,
          body: AppStrings.weHaveBuildAsimpleWayForBusiness,
          buttonText: "Next",
        );
      case 2:
        return const OnBoardingContent(
          title: AppStrings.startSellingOnline,
          body: AppStrings.easyToUseTheAppForYourNextFli,
          buttonText: "Get Started",
        );
      default:
        return const OnBoardingContent(
          title: "",
          body: "",
          buttonText: "Next",
        );
    }
  }

  void nextOrComplete() {
    if (selectedOnBoardingIndex.value < 2) {
      selectedOnBoardingIndex.value++;
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    Get.offAllNamed(Routes.login);
  }

  void completeOnboarding() {
    Get.offAllNamed(Routes.login);
  }
}
