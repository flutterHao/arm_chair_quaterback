/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 20:20:49
 * @LastEditTime: 2024-11-14 21:06:41
 */
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async' show Completer;
import 'dart:ui' show ImmutableBuffer, ImageDescriptor;
import 'package:flutter/widgets.dart';

class Utils {
  ///深色队徽
  static String getAvaterUrl(avatarId) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/user_avatar/$avatarId.png";
  }

  static String getPlayUrl(int? playerId) {
    String url = ConfigStore.to.getServiceUrl();
    String image = "$url/image/player/$playerId.png";
    // Log.d("球员头像:$image");
    return image;
  }

  ///深色队徽
  static String getTeamUrl(int? teamId) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/team/$teamId.png";
  }

  ///白色队徽
  static String getWhiteTeamUrl(int? teamId) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/team_white/$teamId.png";
  }

  ///道具
  static String getPropIconUrl(id) {
    return "assets/images/icon/prop_$id.png";
  }

  static String getStatusUrl(id) {
    return "assets/images/icon/status_$id.png";
  }

  static String getPosition(int position) {
    switch (position) {
      case 1:
        return "C";
      case 2:
        return "PF";
      case 3:
        return "SF";
      case 4:
        return "SG";
      case 5:
        return "PG";
      case 0:
        return "SUB";
      default:
        return "";
    }
  }

  ///根据Id获取球员基础信息
  static NbaPlayerInfosPlayerBaseInfoList getPlayBaseInfo(int playerId) {
    var item = CacheApi.playerInfo?.baseInfoMap[playerId];
    return item ?? NbaPlayerInfosPlayerBaseInfoList();
  }

  ///根据Id获取队伍基础信息
  static NbaTeamEntity getTeamInfo(int teamId) {
    var item = CacheApi.teamDefineMap?[teamId];
    return item ?? NbaTeamEntity();
  }

  static String getName(String key) {
    if (key == "blk") {
      return "BLK";
    }
    if (key == "ast") {
      return "AST";
    }
    if (key == "stl") {
      return "STL";
    }
    if (key == "3pm") {
      return "3PM";
    }
    if (key == "pts") {
      return "PTS";
    }
    if (key == "reb") {
      return "REB";
    }
    return "3PT";
  }

  static String getLongName(String key) {
    return CacheApi.pickType?.firstWhere((e) => e.pickTypeName == key).pickTypeFullName??"";
  }

  static Color getChartColor(value) {
    return value == 0
        ? AppColors.c666666
        : value < 30
            ? AppColors.cE72646
            : value < 60
                ? AppColors.cE8B94C
                : AppColors.c10A86A;
  }

  ///金额格式化
  static String formatMoney(num amount) {
    // amount = 123456789;
    amount *= 1000;
    return _formatNum(amount);
  }

  static String _formatNum(num amount) {
    if (amount >= 1e12) {
      return '${formatToThreeSignificantDigits(amount / 1e12)}T';
    } else if (amount >= 1e9) {
      return '${formatToThreeSignificantDigits(amount / 1e9)}B';
    } else if (amount >= 1e6) {
      return '${formatToThreeSignificantDigits(amount / 1e6)}M';
    } else if (amount >= 1e3) {
      return '${formatToThreeSignificantDigits(amount / 1e3)}K';
    } else {
      return formatToThreeSignificantDigits(amount);
    }
  }

  static String formatChip(num chip) {
    return _formatNum(chip);
  }

  static String formatToThreeSignificantDigits(num value) {
    // 使用科学记数法保留三位有效数字
    String exponential = value.toStringAsExponential(2);
    // 将科学记数法转换回普通数字
    double formattedValue = double.parse(exponential);
    // 去掉多余的零
    return formattedValue.toString().replaceAll(RegExp(r'\.0+$'), '');
  }

  static double getPTS(int playerId) {
    NbaPlayerInfosPlayerDataAvgList? firstWhere = getNBAPlayerInfo(playerId);
    return firstWhere?.pts ?? 0;
  }

  static NbaPlayerInfosPlayerDataAvgList? getNBAPlayerInfo(int playerId) {
    var playerInfo = CacheApi.playerInfo;
    var firstWhere =
        playerInfo?.playerDataAvgList.firstWhere((e) => e.playerId == playerId);
    return firstWhere;
  }

  static String formatGrade(String grade) {
    return grade.replaceAll("-", "").replaceAll("+", "");
  }

  static String getSortWithInt(int value) {
    var string = value.toString();
    if (string.endsWith("1")) {
      return "${string}st";
    }
    if (string.endsWith("2")) {
      return "${string}nd";
    }
    if (string.endsWith("3")) {
      return "${string}rd";
    }
    return "${string}th";
  }

  static generateAndShareImage(GlobalKey globalKey) async {
    try {
      // 使用RepaintBoundary生成widget的图像
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 3.0); // 设置图像像素密度
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List uint8List = byteData!.buffer.asUint8List();

      // 获取临时文件目录
      final directory = await getTemporaryDirectory();
      final filePath = '${directory.path}/shared_image.png';

      // 将图像保存为PNG文件
      File file = File(filePath)..writeAsBytesSync(uint8List);

      // 使用share_plus插件分享文件
      Share.shareXFiles(
        [XFile(filePath)],
        subject: "This is a share link from me",
        // text: 'This is a share link from me',
      );
    } catch (e) {
      print('Error generating image: $e');
    }
  }

  static String timeAgo(int inputTime) {
    // 将 int 时间戳转换为 DateTime
    final inputDateTime = DateTime.fromMillisecondsSinceEpoch(inputTime);
    final now = DateTime.now();
    final difference = now.difference(inputDateTime); // 计算时间差

    if (difference.inMinutes < 1) {
      return 'just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} h';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''}';
    } else if (difference.inDays < 365) {
      return '${(difference.inDays / 30).floor()} month${(difference.inDays / 30).floor() > 1 ? 's' : ''}';
    } else {
      return '${(difference.inDays / 365).floor()} year${(difference.inDays / 365).floor() > 1 ? 's' : ''}';
    }
  }

  ///
  ///事件间隔控制工具类（防止短时间内多次响应事件）
  ///
  static const int minClickDelayTime = 1000;
  static int lastClickTime = 0;

  static bool canOperate({int delayTime = minClickDelayTime}) {
    bool todo = false;
    int currentClickTime = DateTime.now().millisecondsSinceEpoch;
    if ((currentClickTime - lastClickTime) >= delayTime) {
      todo = true;
      lastClickTime = currentClickTime;
    }
    return todo;
  }
}
