/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-14 17:34:35
 * @LastEditTime: 2024-09-14 18:22:32
 */
import 'package:arm_chair_quaterback/common/constant/user_constant.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:uuid/uuid.dart';

class DeviceUtils {
  // 获取设备 ID，如果没有则生成唯一标识
  static Future<String> getDeviceId() async {
    String? deviceId;

    // 获取设备 ID
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
        deviceId = androidInfo.id; // Android 设备 ID
        break;
      case TargetPlatform.iOS:
        IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
        deviceId = iosInfo.identifierForVendor; // iOS 设备唯一标识符
        break;
      default:
        deviceId = null; // 处理其他平台，Web 平台上 deviceId 可能为 null
    }

    // 如果设备 ID 为空，生成并保存一个唯一标识符
    if (deviceId == null) {
      // 生成一个唯一 ID（使用 UUID）
      deviceId = const Uuid().v4();
      StorageService.to.setString(
          UserConstant.deviceId, deviceId); // 将生成的 ID 存储到 SharedPreferences
    }

    return deviceId;
  }
}
