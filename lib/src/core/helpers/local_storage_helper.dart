import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

IOSOptions _getIosOptions() => const IOSOptions(accessibility: KeychainAccessibility.first_unlock);

class LocalStorageHelper {
  static const String _isLoggedIn = "isLoggedIn";
  static const String _rememberMe = "rememberMe";

  static const List<String> keyList = <String>[
    // Add the item to clear
  ];
  static final FlutterSecureStorage _storage = FlutterSecureStorage(
    aOptions: _getAndroidOptions(),
    iOptions: _getIosOptions(),
  );
  // Write data
  static Future<void> writeData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Read data
  static Future<String> readData(String key) async => await _storage.read(key: key) ?? '';

  // Delete data
  static Future<void> deleteData(String key) async {
    await _storage.delete(key: key);
  }

  // Erase all data
  static Future<void> eraseData() async {
    if (await getRememberMe()) {
      for (String value in keyList) {
        await deleteData(value);
      }
    } else {
      await _storage.deleteAll();
    }
  }

  static Future<void> saveIsLogin({required bool value}) async {
    await writeData(_isLoggedIn, '$value');
  }

  static Future<bool> getIsLogin() async {
    String value = await readData(_isLoggedIn);
    return value == 'true';
  }

  static Future<bool> getRememberMe() async {
    String value = await readData(_rememberMe);
    return value == 'true';
  }
}
