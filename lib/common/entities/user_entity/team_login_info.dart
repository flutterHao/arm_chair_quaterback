import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:get/get.dart';

import 'team.dart';
import 'team_prop_list.dart';
import 'team_record_list.dart';
import 'zone_info.dart';

class TeamLoginInfo {
  bool? firstLogin;
  String? loginWay;
  List<dynamic>? offLineMessageList;
  int? offlineMinute;
  bool? setSecondPassword;
  Team? team;
  List<TeamPlayerInfoEntity>? teamPlayerList;
  List<TeamPropList>? teamPropList;
  List<TeamRecordList>? teamRecordList;
  List<dynamic>? timerServiceList;
  ZoneInfo? zoneInfo;

  TeamLoginInfo({
    this.firstLogin,
    this.loginWay,
    this.offLineMessageList,
    this.offlineMinute,
    this.setSecondPassword,
    this.team,
    this.teamPlayerList,
    this.teamPropList,
    this.teamRecordList,
    this.timerServiceList,
    this.zoneInfo,
  });

  num getCoin() {
    var firstWhere = teamPropList?.firstWhereOrNull((e) => e.propId == 103);
    return firstWhere?.num ?? 0;
  }

  num getMoney() {
    var firstWhere = teamPropList?.firstWhereOrNull((e) => e.propId == 102);
    return firstWhere?.num ?? 0;
  }

  factory TeamLoginInfo.fromJson(Map<String, dynamic> json) => TeamLoginInfo(
        firstLogin: json['firstLogin'] as bool?,
        loginWay: json['loginWay'] as String?,
        offLineMessageList: json['offLineMessageList'] as List<dynamic>?,
        offlineMinute: json['offlineMinute'] as int?,
        setSecondPassword: json['setSecondPassword'] as bool?,
        team: json['team'] == null
            ? null
            : Team.fromJson(json['team'] as Map<String, dynamic>),
        teamPlayerList: (json['teamPlayerList'] as List<dynamic>?)
            ?.map(
                (e) => TeamPlayerInfoEntity.fromJson(e as Map<String, dynamic>))
            .toList(),
        teamPropList: (json['teamPropList'] as List<dynamic>?)?.map((e) {
          Map<String, dynamic> json =
              e != null ? e as Map<String, dynamic> : {};
          return TeamPropList.fromJson(json);
        }).toList(),
        teamRecordList: (json['teamRecordList'] as List<dynamic>?)
            ?.map((e) => TeamRecordList.fromJson(e as Map<String, dynamic>))
            .toList(),
        timerServiceList: json['timerServiceList'] as List<dynamic>?,
        zoneInfo: json['zoneInfo'] == null
            ? null
            : ZoneInfo.fromJson(json['zoneInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'firstLogin': firstLogin,
        'loginWay': loginWay,
        'offLineMessageList': offLineMessageList,
        'offlineMinute': offlineMinute,
        'setSecondPassword': setSecondPassword,
        'team': team?.toJson(),
        'teamPlayerList': teamPlayerList?.map((e) => e.toJson()).toList(),
        'teamPropList': teamPropList?.map((e) => e.toJson()).toList(),
        'teamRecordList': teamRecordList?.map((e) => e.toJson()).toList(),
        'timerServiceList': timerServiceList,
        'zoneInfo': zoneInfo?.toJson(),
      };
}
