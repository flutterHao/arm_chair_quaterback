/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-21 20:20:49
 * @LastEditTime: 2024-09-23 17:16:27
 */
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/net/address.dart';
import 'package:arm_chair_quaterback/common/net/apis/config.dart';

class Utils {
  static String getPlayUrl(int? playerId) {
    return "${Address.httpBaseUrl}/image/player/head_$playerId.png";
  }

  static String getTeamUrl(int? teamId) {
    return "${Address.httpBaseUrl}/image/team/$teamId.png";
  }

  ///获取球员基础信息
  static NbaPlayerInfosPlayerBaseInfoList getPlayBaseInfo(int playerId) {
    var item = ConfigApi.playerInfo?.baseInfoMap[playerId];
    return item ?? NbaPlayerInfosPlayerBaseInfoList();
  }

  static NbaTeamEntity getTeamInfo(int teamId) {
    var item = ConfigApi.teamDefineMap?[teamId];
    return item ?? NbaTeamEntity();
  }
}
