/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-14 17:34:35
 * @LastEditTime: 2024-12-05 16:18:55
 */
import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:arm_chair_quaterback/common/utils/platform_file_manager.dart';
import 'dart:async';
import 'package:uuid/uuid.dart';

class DeviceUtils {
  // 获取设备 ID，如果没有则生成唯一标识
  static Future<String> getDeviceId() async {
    String? deviceId;

    // 获取设备 ID  ---由于出现不唯一情况k ，暂时先用uuid代替
    // switch (defaultTargetPlatform) {
    //   case TargetPlatform.android:
    //     AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    //     deviceId = androidInfo.id; // Android 设备 ID
    //     // String? fingerprint = androidInfo.fingerprint.split(":user").first;
    //     // deviceId = fingerprint;
    //     break;
    //   case TargetPlatform.iOS:
    //     IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
    //     deviceId = iosInfo.identifierForVendor; // iOS 设备唯一标识符
    //     break;
    //   default:
    //     deviceId = null; // 处理其他平台，Web 平台上 deviceId 可能为 null
    // }

    // 如果设备 ID 为空，生成并保存一个唯一标识符
    deviceId ??= const Uuid().v4();
    StorageService.to.setString(
        Constant.deviceId, deviceId); // 将生成的 ID 存储到 SharedPreferences
    PlatformFileManager.saveUuid(deviceId);
    return deviceId;
  }
}
