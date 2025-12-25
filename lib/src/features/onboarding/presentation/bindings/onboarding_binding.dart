import 'package:get/get.dart';
import 'package:eppsee/src/features/onboarding/presentation/controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController(), fenix: true);
  }
}
