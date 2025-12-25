import 'package:get/get.dart';
import '../controllers/forget_password_controller.dart';
import '../controllers/login_controller.dart';
import '../controllers/new_password_controller.dart';
import '../controllers/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut<SignupController>(() => SignupController(), fenix: true);
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController(), fenix: true);
    Get.lazyPut<NewPasswordController>(() => NewPasswordController(), fenix: true);
  }
}
