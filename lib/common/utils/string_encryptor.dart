///
///@auther gejiahui
///created at 2024/12/27/16:18

import 'package:encrypt/encrypt.dart';

class StringEncryptor {
  final Key key; // 32-byte key for AES-256
  final IV iv;   // Initialization Vector

  StringEncryptor(String secretKey, String ivKey)
      : key = Key.fromUtf8(_normalizeKey(secretKey,32)),
        iv = IV.fromUtf8(_normalizeIV(ivKey));

  // 加密字符串
  String encryptString(String plainText) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64; // 返回 Base64 编码的密文
  }

  // 解密字符串
  String decryptString(String encryptedText) {
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  }

  static String _normalizeIV(String ivKey) {
    if (ivKey.length < 16) {
      return ivKey.padRight(16, '0'); // 补齐到 16 字节
    } else if (ivKey.length > 16) {
      return ivKey.substring(0, 16); // 截断到 16 字节
    }
    return ivKey;
  }

  static String _normalizeKey(String key, int targetLength) {
    if (key.length < targetLength) {
      return key.padRight(targetLength, '0'); // 补齐到目标长度
    } else if (key.length > targetLength) {
      return key.substring(0, targetLength); // 截断到目标长度
    }
    return key;
  }


}
