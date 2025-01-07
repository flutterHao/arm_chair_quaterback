/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 20:20:49
 * @LastEditTime: 2025-01-07 15:47:56
 */
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:arm_chair_quaterback/common/constant/constant.dart';
import 'package:arm_chair_quaterback/common/entities/ColorString.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/services/storage.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:async' show Completer;
import 'dart:ui' show ImmutableBuffer, ImageDescriptor;
import 'package:flutter/widgets.dart';

class Utils {
  static String getAvaterUrl(avatarId) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/user_avatar/$avatarId.png";
  }

  static String getMessageIcon(String name) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/message/$name.png";
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
  static String getSlotIconUrl(id) {
    return "assets/images/Common/ui_common_prop_0$id.png";
  }

  static String getPropIconUrl(id) {
    if (id == 102) {
      return Assets.commonUiCommonProp05;
    } else if (id == 103) {
      return Assets.commonUiCommonIconCurrency02;
    }
    return Assets.managerUiManagerGift03;
  }

  static String getStatusUrl(id) {
    if (id == 106) {
      return Assets.commonUiCommonPlayerState06;
    } else if (id == 105) {
      return Assets.commonUiCommonPlayerState01;
    } else if (id == 104) {
      return Assets.commonUiCommonPlayerState02;
    } else if (id == 103) {
      return Assets.commonUiCommonPlayerState3;
    } else if (id == 102) {
      return Assets.commonUiCommonPlayerState04;
    }
    return Assets.commonUiCommonPlayerState05;
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

  ///根据Id获取球员平均数据
  static NbaPlayerInfosPlayerDataAvgList getPlayerDataAvg(int playerId) {
    var item = CacheApi.playerInfo?.dataAvgMap[playerId];
    return item ?? NbaPlayerInfosPlayerDataAvgList();
  }

  ///根据Id获取球员属性数据
  static NbaPlayerInfosPlayerDataCapList getPlayerCapData(int playerId) {
    var item = CacheApi.playerInfo?.dataCapMap[playerId];
    return item ?? NbaPlayerInfosPlayerDataCapList();
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
    return CacheApi.pickType
            ?.firstWhere((e) => e.pickTypeName == key)
            .pickTypeFullName ??
        "";
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
    return grade;
    // return grade.replaceAll("-", "").replaceAll("+", "");
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

  ///计算行数
  static int calculateActualLines(
      String text, double containerWidth, TextStyle textStyle) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: containerWidth);

    return textPainter.computeLineMetrics().length;
  }

  static double getDialogHeight() {
    return 465.w;
  }

  static Color getProgressColor(progress) {
    return (progress > 50
        ? AppColors.c10A86A
        : progress > 20
            ? AppColors.cDFB523
            : AppColors.cE72646);
  }

  /// 使用队伍id 获取队伍的颜色
  static Color getTeamColor(int teamId) {
    return Constant.teamColorMap[teamId]?['light'] ?? AppColors.c404040;
  }

  /// 正则获取需要改变颜色的字符串
  static List<ColorString> subColorString(String input) {
    RegExp regExp = RegExp(r'/c\s(.*?)\s/c');

    List<ColorString> results = [];
    int currentIndex = 0;

    for (var match in regExp.allMatches(input)) {
      // 添加非匹配部分
      if (match.start > currentIndex) {
        results.add(ColorString.fromJson({
          'text': input.substring(currentIndex, match.start).trim(),
          'isMatch': false,
        }));
      }

      // 添加匹配部分
      results.add(ColorString.fromJson({
        'text': match.group(1)!.trim(),
        'isMatch': true,
      }));

      currentIndex = match.end;
    }

    // 添加最后的非匹配部分
    if (currentIndex < input.length) {
      results.add(ColorString.fromJson({
        'text': input.substring(currentIndex).trim(),
        'isMatch': false,
      }));
    }
    return results;
  }

  static void saveNotTip(String type, {bool noTip = true}) {
    String date =
        DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d);
    StorageService.to.setBool("${type}noTip$date", noTip);
  }

  static bool getNoTip(String type) {
    String date =
        DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d);
    return StorageService.to.getBool("${type}noTip$date");
  }

  static String numberWithThousandths(int number) {
    String numberStr = number.toString();
    int length = numberStr.length;

    if (length <= 3) return numberStr;

    // 每次递归处理最后的三位
    return '${numberWithThousandths(int.parse(numberStr.substring(0, length - 3)))},${numberStr.substring(length - 3)}';
  }

  static String getRankText(int rank) {
    // 处理序数词后缀
    String suffix;
    if (rank == 1) {
      suffix = "st";
    } else if (rank == 2) {
      suffix = "nd";
    } else if (rank == 3) {
      suffix = "rd";
    } else {
      suffix = "th";
    }

    return "$rank$suffix";
  }
}
