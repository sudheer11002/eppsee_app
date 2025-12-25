import 'package:eppsee/src/core/env/base_config.dart';
import 'package:eppsee/src/core/env/dev_config.dart';
import 'package:eppsee/src/core/env/production_config.dart';
import 'package:eppsee/src/core/env/staging_config.dart';

//To load proper environment configuration in our Flutter app, we will create a class called Environment which can set configuration dynamically.
// To use this in your app where you are making HTTP call, pls use like below
// final String apiHost = Environment().config.apiHost;
class Environment {
  //singleton implementation
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String DEV = 'DEV';
  static const String STAGING = 'STAGING';
  static const String PRODUCTION = 'PRODUCTION';

  late BaseConfig config;

  void initConfig({required String environment}) {
    config = _getConfig(environment: environment);
  }

  BaseConfig _getConfig({required String environment}) {
    switch (environment) {
      case Environment.PRODUCTION:
        return ProductionConfig();
      case Environment.STAGING:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
