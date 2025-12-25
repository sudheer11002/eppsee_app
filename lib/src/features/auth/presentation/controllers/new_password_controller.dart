import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';

class NewPasswordController extends GetxController {
  var isLoading = false.obs;

  Future<void> setNewPassword(String newPassword) async {
    isLoading.value = true;

    // TODO: Replace with API call
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // After success → back to login
    Get.offAllNamed(Routes.login);
  }
}
