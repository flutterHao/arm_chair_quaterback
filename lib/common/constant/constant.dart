/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-11-26 12:33:52
 */
class Constant {
  /// 用户 - 配置信息
  static const String token = 'user_token';

  /// 设备是否第一次打开
  static const String firstOpen = 'device_first_open';

  /// 多语言
  static const String languge = 'language_code';

  static const String deviceId = "device_id";

  ///球员属性
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

  // 花色
  /// 黑桃
  static const int spade = 1;

  /// 方块
  static const int diamond = 2;

  /// 梅花
  static const int club = 3;

  /// 红桃
  static const int heart = 4;

  // 牌面
  static const int ten = 10;
  static const int j = 11;
  static const int q = 12;
  static const int k = 13;
  static const int ace = 14;
}
