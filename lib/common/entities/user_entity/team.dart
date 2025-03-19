import 'package:arm_chair_quaterback/common/utils/utils.dart';

import 'team_preference.dart';

class Team {
  int? accountId;
  String? accountName;
  int? benchCount;
  int? businessCardId;
  String? createIp;
  int? ct;
  int? currTeamStrength;
  int? dailyLeagueContributValue;
  int? firstLoginTime;
  int? helpStep;
  int? joinLeagueTime;
  int? lastAreaId;
  String? lastLoginIp;
  int? lastLoginTime;
  int? lastOffLineTime;
  int? leagueContributValue;
  int? leagueId;
  String? leagueName;
  int? leagueRole;
  int? logoBoxId;
  bool? online;
  int? secretaryId;
  String? serverId;
  int? serviceId;
  String? systemSteps;
  int? teamExp;
  int? teamGrade;
  int? teamId;
  int? teamLogo;
  String? teamName;
  TeamPreference? teamPreference;
  int? totalChargeNum;
  int? totalLoginDays;
  int? totalOnlineTime;
  int? unforBidTime;
  int? ut;
  int? vipGrade;
  int? wearNicknameId;
  String? signature;
  int? birthday;
  Team(
      {this.accountId,
      this.accountName,
      this.benchCount,
      this.businessCardId,
      this.createIp,
      this.ct,
      this.currTeamStrength,
      this.dailyLeagueContributValue,
      this.firstLoginTime,
      this.helpStep,
      this.joinLeagueTime,
      this.lastAreaId,
      this.lastLoginIp,
      this.lastLoginTime,
      this.lastOffLineTime,
      this.leagueContributValue,
      this.leagueId,
      this.leagueName,
      this.leagueRole,
      this.logoBoxId,
      this.online,
      this.secretaryId,
      this.serverId,
      this.serviceId,
      this.systemSteps,
      this.teamExp,
      this.teamGrade,
      this.teamId,
      this.teamLogo,
      this.teamName,
      this.teamPreference,
      this.totalChargeNum,
      this.totalLoginDays,
      this.totalOnlineTime,
      this.unforBidTime,
      this.ut,
      this.vipGrade,
      this.wearNicknameId,
      this.signature,
      this.birthday});

  int get createTime => (ct ?? 0) + Utils.getTimeZoneOffset().inMilliseconds;

  int get updateTime => (ut ?? 0) + Utils.getTimeZoneOffset().inMilliseconds;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        accountId: json['accountId'] as int?,
        accountName: json['accountName'] as String?,
        benchCount: json['benchCount'] as int?,
        businessCardId: json['businessCardId'] as int?,
        createIp: json['createIp'] as String?,
        ct: json['createTime'] as int?,
        currTeamStrength: json['currTeamStrength'] as int?,
        dailyLeagueContributValue: json['dailyLeagueContributValue'] as int?,
        firstLoginTime: json['firstLoginTime'] as int?,
        helpStep: json['helpStep'] as int?,
        joinLeagueTime: json['joinLeagueTime'] as int?,
        lastAreaId: json['lastAreaId'] as int?,
        lastLoginIp: json['lastLoginIp'] as String?,
        lastLoginTime: json['lastLoginTime'] as int?,
        lastOffLineTime: json['lastOffLineTime'] as int?,
        leagueContributValue: json['leagueContributValue'] as int?,
        leagueId: json['leagueId'] as int?,
        leagueName: json['leagueName'] as String?,
        leagueRole: json['leagueRole'] as int?,
        logoBoxId: json['logoBoxId'] as int?,
        online: json['online'] as bool?,
        secretaryId: json['secretaryId'] as int?,
        serverId: json['serverId'] as String?,
        serviceId: json['serviceId'] as int?,
        systemSteps: json['systemSteps'] as String?,
        teamExp: json['teamExp'] as int?,
        teamGrade: json['teamGrade'] as int?,
        teamId: json['teamId'] as int?,
        teamLogo: json['teamLogo'] as int?,
        teamName: json['teamName'] as String?,
        teamPreference: json['teamPreference'] == null
            ? null
            : TeamPreference.fromJson(
                json['teamPreference'] as Map<String, dynamic>),
        totalChargeNum: json['totalChargeNum'] as int?,
        totalLoginDays: json['totalLoginDays'] as int?,
        totalOnlineTime: json['totalOnlineTime'] as int?,
        unforBidTime: json['unforBidTime'] as int?,
        ut: json['updateTime'] as int?,
        vipGrade: json['vipGrade'] as int?,
        wearNicknameId: json['wearNicknameId'] as int?,
        signature: json['signature'] as String?,
        birthday: json['birthday'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'accountId': accountId,
        'accountName': accountName,
        'benchCount': benchCount,
        'businessCardId': businessCardId,
        'createIp': createIp,
        'createTime': ct,
        'currTeamStrength': currTeamStrength,
        'dailyLeagueContributValue': dailyLeagueContributValue,
        'firstLoginTime': firstLoginTime,
        'helpStep': helpStep,
        'joinLeagueTime': joinLeagueTime,
        'lastAreaId': lastAreaId,
        'lastLoginIp': lastLoginIp,
        'lastLoginTime': lastLoginTime,
        'lastOffLineTime': lastOffLineTime,
        'leagueContributValue': leagueContributValue,
        'leagueId': leagueId,
        'leagueName': leagueName,
        'leagueRole': leagueRole,
        'logoBoxId': logoBoxId,
        'online': online,
        'secretaryId': secretaryId,
        'serverId': serverId,
        'serviceId': serviceId,
        'systemSteps': systemSteps,
        'teamExp': teamExp,
        'teamGrade': teamGrade,
        'teamId': teamId,
        'teamLogo': teamLogo,
        'teamName': teamName,
        'teamPreference': teamPreference?.toJson(),
        'totalChargeNum': totalChargeNum,
        'totalLoginDays': totalLoginDays,
        'totalOnlineTime': totalOnlineTime,
        'unforBidTime': unforBidTime,
        'updateTime': ut,
        'vipGrade': vipGrade,
        'wearNicknameId': wearNicknameId,
      };
}
