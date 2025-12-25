import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class EncryptionHelper {
  // Decryption method
  static String? decrypt({
    required String base64Data,
    required String key,
    required String iv,
  }) {
    try {
      final Uint8List encryptedBytes = base64Decode(base64Data); // Decode base64 string

      final encrypt.Encrypter encrypter = encrypt.Encrypter(
        encrypt.AES(
          encrypt.Key(const Utf8Codec().encode(key)), // Create key
          mode: encrypt.AESMode.cbc, // Use CBC mode
          padding: null, // No padding
        ),
      );
      final encrypt.IV ivSpec = encrypt.IV(const Utf8Codec().encode(iv)); // IV specification

      // Decrypt the data
      final List<int> decryptedBytes = encrypter.decryptBytes(
        encrypt.Encrypted(encryptedBytes),
        iv: ivSpec,
      );

      // Return the result as a trimmed string
      return const Utf8Codec().decode(decryptedBytes).trim();
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);

      debugPrint("Decryption Error: $e");
      return null;
    }
  }

  // Encryption method
  static String? encryptData({
    required String data,
    required String key,
    required String iv,
  }) {
    try {
      final Uint8List keyBytes = const Utf8Codec().encode(key);
      final Uint8List ivBytes = const Utf8Codec().encode(iv);

      final encrypt.Encrypter encrypter = encrypt.Encrypter(
        encrypt.AES(
          encrypt.Key(keyBytes),
          mode: encrypt.AESMode.cbc,
          padding: null, // No padding for encryption
        ),
      );

      final encrypt.IV ivSpec = encrypt.IV(ivBytes);

      // Pad the data to make its length a multiple of the block size (16 bytes)
      final int blockSize = 16;
      final Uint8List dataBytes = const Utf8Codec().encode(data);
      int paddedLength = dataBytes.length;
      if (paddedLength % blockSize != 0) {
        paddedLength += (blockSize - (paddedLength % blockSize));
      }

      final Uint8List paddedData = Uint8List(paddedLength)..setAll(0, dataBytes);

      // Encrypt the data
      final encrypt.Encrypted encrypted = encrypter.encryptBytes(paddedData, iv: ivSpec);

      // Return the base64-encoded encrypted string
      return base64Encode(encrypted.bytes);
    } catch (e, stackTrace) {
      FirebaseCrashlytics.instance.recordError(e, stackTrace);
      debugPrint("Encryption Error: $e");
      return null;
    }
  }
}
