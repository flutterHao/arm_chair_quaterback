/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-09-20 21:18:42
 */
class Constant {
  /// 用户 - 配置信息
  static const String token = 'user_token';

  /// 设备是否第一次打开
  static const String firstOpen = 'device_first_open';

  /// 多语言
  static const String languge = 'language_code';

  static const String deviceId = "device_id";

  ///球员类型
  static const List<String> statTypeList = [
    "PTS",
    "AST",
    "REB",
    "FGP",
    "BLK",
    "STL",
    "FTP",
    "3PA",
    "3PP",
    "TO"
  ];

  static String serviceUrl = "serviceUrl";
}
