/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 20:20:49
 * @LastEditTime: 2024-10-21 21:42:46
 */
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';

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

  static String numFormat(int num) {
    if (num >= 0 && num <= 999) {
      return "$num";
    } else {
      return "${(num / 1000).toStringAsFixed(1)}k";
    }
  }
}
