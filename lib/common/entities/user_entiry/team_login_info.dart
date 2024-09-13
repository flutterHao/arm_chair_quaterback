import 'dart:convert';

import 'team.dart';
import 'team_player_list.dart';
import 'team_record_list.dart';
import 'zone_info.dart';

class TeamLoginInfo {
  bool? firstLogin;
  String? loginWay;
  List<dynamic>? offLineMessageList;
  int? offlineMinute;
  bool? setSecondPassword;
  Team? team;
  List<TeamPlayerList>? teamPlayerList;
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
    this.teamRecordList,
    this.timerServiceList,
    this.zoneInfo,
  });

  factory TeamLoginInfo.fromMap(Map<String, dynamic> data) => TeamLoginInfo(
        firstLogin: data['firstLogin'] as bool?,
        loginWay: data['loginWay'] as String?,
        offLineMessageList: data['offLineMessageList'] as List<dynamic>?,
        offlineMinute: data['offlineMinute'] as int?,
        setSecondPassword: data['setSecondPassword'] as bool?,
        team: data['team'] == null
            ? null
            : Team.fromMap(data['team'] as Map<String, dynamic>),
        teamPlayerList: (data['teamPlayerList'] as List<dynamic>?)
            ?.map((e) => TeamPlayerList.fromMap(e as Map<String, dynamic>))
            .toList(),
        teamRecordList: (data['teamRecordList'] as List<dynamic>?)
            ?.map((e) => TeamRecordList.fromMap(e as Map<String, dynamic>))
            .toList(),
        timerServiceList: data['timerServiceList'] as List<dynamic>?,
        zoneInfo: data['zoneInfo'] == null
            ? null
            : ZoneInfo.fromMap(data['zoneInfo'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'firstLogin': firstLogin,
        'loginWay': loginWay,
        'offLineMessageList': offLineMessageList,
        'offlineMinute': offlineMinute,
        'setSecondPassword': setSecondPassword,
        'team': team?.toMap(),
        'teamPlayerList': teamPlayerList?.map((e) => e.toMap()).toList(),
        'teamRecordList': teamRecordList?.map((e) => e.toMap()).toList(),
        'timerServiceList': timerServiceList,
        'zoneInfo': zoneInfo?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TeamLoginInfo].
  factory TeamLoginInfo.fromJson(String data) {
    return TeamLoginInfo.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TeamLoginInfo] to a JSON string.
  String toJson() => json.encode(toMap());
}
