part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String onBoardingScreen = '/onBoardingScreen';

  // 🔑 Auth routes
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String verifyCode = '/verifyCode';
  static const String forgotPassword = '/forgotPassword';
  static const String updatePassword = '/updatePassword';

  // Dashboard (Dashboard )
  static const String dashboard = '/dashboard';
}
