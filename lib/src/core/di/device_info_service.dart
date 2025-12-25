import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  // Singleton instance
  static DeviceInfoService? _instance;
  static DeviceInfoService get instance {
    return _instance ??= DeviceInfoService._();
  }

  // Private constructor
  DeviceInfoService._();

  // Property to hold device information
  Map<String, dynamic> _deviceInfo = {};

  Map<String, dynamic> get deviceInfo => _deviceInfo;

  // Method to fetch device information
  Future<void> fetchDeviceInfo() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
        _deviceInfo = {
          'device_id': androidInfo.id,
          'platform': 'Android',
          'app_version':
              'your_app_version', // Replace with your actual app version
          'device_brand': androidInfo.brand,
          'device_model': androidInfo.model,
          'device_os': androidInfo.version.release,
        };
      } else if (Platform.isIOS) {
        IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
        _deviceInfo = {
          'device_id': iosInfo.identifierForVendor,
          'platform': 'iOS',
          'app_version':
              'your_app_version', // Replace with your actual app version
          'device_brand': 'Apple',
          'device_model': iosInfo.utsname.machine,
          'device_os': iosInfo.systemVersion,
        };
      }
    } catch (e) {
      // Handle exceptions
      print('Error getting device information: $e');
    }
  }
}
