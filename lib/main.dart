import 'package:eppsee/app.dart';
import 'package:eppsee/src/core/di/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:eppsee/src/localization/language.dart';
import 'package:eppsee/src/core/di/device_info_service.dart';
import 'package:eppsee/src/core/env/environment.dart';
import 'package:eppsee/src/core/helpers/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  await setup();
  runApp(const MyApp());
}

Future<void> setup() async {
  SharedPreferencesService sharedPrefs = await SharedPreferencesService.getInstance();
  getIt.registerSingleton<SharedPreferencesService>(sharedPrefs);
  await getIt.get<APPLanguage>().loadAppLanguage();
  const environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.PRODUCTION,
  );
  Environment().initConfig(environment: environment);
  // Fetch device information using the singleton instance
  await DeviceInfoService.instance.fetchDeviceInfo();
}
