import 'package:eppsee/src/core/env/base_config.dart';

class ProductionConfig implements BaseConfig {
  @override
  String get apiHost => 'https://api.tajgateways.com';

  @override
  String get path => '/api-v1/';
}
