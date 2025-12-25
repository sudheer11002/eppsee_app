import 'package:get/get.dart';
import 'package:eppsee/src/features/auth/presentation/page/update_password.dart';
import 'package:eppsee/src/features/auth/presentation/page/verify_code.dart';
import 'package:eppsee/src/features/splash/presentation/page/splash_screen.dart';

import '../features/auth/presentation/bindings/auth_binding.dart';
import '../features/auth/presentation/page/forget_password.dart';
import '../features/auth/presentation/page/login.dart';
import '../features/auth/presentation/page/sign_up.dart';
import '../features/dashboard/presentation/bindings/dashboard_binding.dart';
import '../features/dashboard/presentation/page/dashboard.dart';
import '../features/onboarding/presentation/bindings/onboarding_binding.dart';
import '../features/onboarding/presentation/page/on_boarding_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
      binding: OnboardingBinding(),
    ),

    ///
    ///  Auth Routes
    ///
    GetPage(
      name: Routes.login,
      page: () => const LoginPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUp,
      page: () => const SignupPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.verifyCode,
      page: () => const VerifyCodePage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => const ForgetPasswordPage(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.updatePassword,
      page: () => const UpdatePasswordPage(),
      binding: AuthBinding(),
    ),

    ///
    /// Dashboard
    ///
    GetPage(
      name: Routes.dashboard,
      page: () => const Dashboard(),
      binding: DashboardBinding(),
    ),
  ];
}
