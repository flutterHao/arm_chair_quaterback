/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 20:20:49
 * @LastEditTime: 2024-10-23 11:46:38
 */
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:arm_chair_quaterback/common/style/color.dart';
import 'package:flutter/material.dart';

class Utils {
  static String getPlayUrl(int? playerId) {
    String url = ConfigStore.to.getServiceUrl();
    String image = "$url/image/player/$playerId.png";
    // Log.d("球员头像:$image");
    return image;
  }

  static String getTeamUrl(int? teamId) {
    String url = ConfigStore.to.getServiceUrl();
    return "$url/image/team/$teamId.png";
  }

  static String getPropIconUrl(id) {
    // String url = ConfigStore.to.getServiceUrl();
    return "assets/images/icon/icon_$id.png";
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
    if (key == "blk") {
      return "Blocks";
    }
    if (key == "ast") {
      return "Assists";
    }
    if (key == "stl") {
      return "Steals";
    }
    if (key == "pts") {
      return "Points";
    }
    if (key == "reb") {
      return "Rebounds";
    }
    return "3 Points";
  }

  static Color getChartColor(value) {
    return value < 30
        ? AppColors.cE72646
        : value < 60
            ? AppColors.cE8B94C
            : AppColors.c10A86A;
  }

  ///金额格式化
  static String formatMoney(num amount) {
    // amount = 123456789;
    amount *= 1000;
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
}
