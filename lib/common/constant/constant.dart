/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-06 15:16:54
 * @LastEditTime: 2024-11-26 12:33:52
 */
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

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

  static String wsServiceUrl = "web_socket_serviceUrl";

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

  /// 队伍颜色表
  static Map<int, Map<String, Color>> teamColorMap = {
    114: {"light": AppColors.c008348, "dart": AppColors.c000000},
    128: {"light": AppColors.c595959, "dart": AppColors.c000000},
    109: {"light": AppColors.c00438C, "dart": AppColors.c000000},
    120: {"light": AppColors.c003DA6, "dart": AppColors.c000000},
    129: {"light": AppColors.cBD1B21, "dart": AppColors.c000000},
    101: {"light": AppColors.c99152F, "dart": AppColors.c000000},
    119: {"light": AppColors.c72253D, "dart": AppColors.c000000},
    117: {"light": AppColors.c0B336D, "dart": AppColors.c000000},
    118: {"light": AppColors.c091F40, "dart": AppColors.c000000},
    110: {"light": AppColors.c00471C, "dart": AppColors.c000000},
    113: {"light": AppColors.c800A1E, "dart": AppColors.c000000},
    116: {"light": AppColors.c00788C, "dart": AppColors.c000000},
    107: {"light": AppColors.c961A31, "dart": AppColors.c000000},
    108: {"light": AppColors.c00568B, "dart": AppColors.c000000},
    130: {"light": AppColors.c0E2240, "dart": AppColors.c000000},
    124: {"light": AppColors.c0D2240, "dart": AppColors.c000000},
    126: {"light": AppColors.c002D62, "dart": AppColors.c000000},
    125: {"light": AppColors.c800E20, "dart": AppColors.c000000},
    127: {"light": AppColors.c335787, "dart": AppColors.c000000},
    112: {"light": AppColors.c1D428A, "dart": AppColors.c000000},
    104: {"light": AppColors.c0B2241, "dart": AppColors.c000000},
    105: {"light": AppColors.c552C81, "dart": AppColors.c000000},
    123: {"light": AppColors.c873522, "dart": AppColors.c000000},
    106: {"light": AppColors.c592C82, "dart": AppColors.c000000},
    121: {"light": AppColors.c004880, "dart": AppColors.c000000},
    111: {"light": AppColors.c67040C, "dart": AppColors.c000000},
    103: {"light": AppColors.c2F4A80, "dart": AppColors.c000000},
    122: {"light": AppColors.c1D4374, "dart": AppColors.c000000},
    102: {"light": AppColors.c4D4D4D, "dart": AppColors.c000000},
    115: {"light": AppColors.c002B5C, "dart": AppColors.c000000},
  };
}
