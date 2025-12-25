import 'package:get_it/get_it.dart';
import 'package:eppsee/src/core/connectivity/network_connection_observer.dart';
import 'package:eppsee/src/localization/language.dart';

var getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<NetworkConnectionObserver>(NetworkConnectionObserver());
  getIt.registerSingleton<APPLanguage>(APPLanguage());
}
