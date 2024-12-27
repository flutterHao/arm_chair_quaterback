///
///@auther gejiahui
///created at 2024/12/27/16:05
import 'dart:io';
import 'package:arm_chair_quaterback/common/utils/string_encryptor.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PlatformFileManager {
  static String defaultFileName = "pfm.txt";

  static String defaultEncryptorKey = "fegtaijxiuh202412271656";

  static String defaultEncryptorIV = "aegpaijpiuh202412271656";

  // 检查并请求存储权限（仅 Android 需要）
  static Future<bool> requestPermission() async {
    if (Platform.isAndroid) {
      String version = Platform.operatingSystemVersion;
      var versionCode = int.tryParse(
          version.split(" ")[0].replaceAll(RegExp(r'\D'), '') ?? '0');
      PermissionStatus status;
      // 如果设备的 Android 版本 >= 11（API 30），则请求 MANAGE_EXTERNAL_STORAGE 权限
      if (versionCode != null && versionCode >= 30) {
        // 请求 MANAGE_EXTERNAL_STORAGE 权限
        status = await Permission.manageExternalStorage.request();
      } else {
        // 对于 Android 10 及以下版本，使用传统的存储权限
        status = await Permission.storage.request();
      }
      return status.isGranted;
    }
    return true; // iOS 无需特殊权限
  }

  // 获取文件存储路径
  static Future<String?> getStoragePath() async {
    if (Platform.isAndroid) {
      var list = await getExternalStorageDirectories();
      print('List--------:$list');
      Directory dir = Directory(
          '/storage/emulated/0/Android/media/com.ftxapp.arm_chair_quarterback/file');
      if (!await dir.exists()) await dir.create(recursive: true);
      return dir.path;
    } else if (Platform.isIOS) {
      Directory dir = await getApplicationSupportDirectory();
      return dir.path;
    }
    return null;
  }

  // 保存文件
  static Future<void> saveFile(String fileName, String content) async {
    // 检查权限
    bool hasPermission = await requestPermission();
    if (!hasPermission) {
      print('存储权限未授予');
      return;
    }

    // 获取存储路径
    String? path = await getStoragePath();
    if (path == null) {
      print('无法获取存储路径');
      return;
    }

    // 写入文件
    File file = File('$path/$fileName');
    var encryptString = StringEncryptor(defaultEncryptorKey, defaultEncryptorIV)
        .encryptString(content);
    await file.writeAsString(encryptString);
    print('文件已保存: $file');
  }

  static Future<String?> readFile(String fileName) async {
    if (kIsWeb) {
      print('Web 不支持文件读取');
      return null;
    }

    // 检查权限
    bool hasPermission = await requestPermission();
    if (!hasPermission) {
      print('存储权限未授予');
      return null;
    }

    String? path = await getStoragePath();
    if (path == null) {
      print('无法获取存储路径');
      return null;
    }

    File file = File('$path/$fileName');
    if (await file.exists()) {
      var s = await file.readAsString();
      var decryptString =
          StringEncryptor(defaultEncryptorKey, defaultEncryptorIV)
              .decryptString(s);
      return decryptString;
    } else {
      print('文件不存在');
      return null;
    }
  }

  /// 从文件中读取
  static Future<String?> readUuid() async {
    return await readFile(defaultFileName);
  }

  /// 持久化到文件中
  static Future<void> saveUuid(String uuid) async {
    await saveFile(defaultFileName, uuid);
  }
}
