import 'dart:convert';

import 'team_preference.dart';
import 'tencent_blue.dart';

class Team {
  int? accountId;
  String? accountName;
  int? activity209Grade;
  int? activity231Grade;
  int? benchCount;
  int? bindGradeAwardStatus;
  int? businessCardId;
  List<dynamic>? buyGiftIds;
  int? coachStrength;
  String? createIp;
  int? createTime;
  int? crossMatchGamePoint;
  int? currTeamStrength;
  int? dailyLeagueContributValue;
  int? equipmentSmeltValue;
  int? firstLoginTime;
  int? fourDayChargeNum;
  String? healCenterAwardStatus1;
  String? healCenterAwardStatus2;
  int? helpStep;
  int? homePlayerId;
  bool? joinGameBattle;
  int? joinLeagueTime;
  int? kingStrength;
  int? lastAreaId;
  String? lastLoginIp;
  int? lastLoginTime;
  int? lastOffLineTime;
  int? lastShootTime;
  int? leagueContributValue;
  int? leagueId;
  String? leagueName;
  int? leagueRole;
  int? logoBoxId;
  int? mascotBagCount;
  int? mascotGrooveCount;
  bool? online;
  int? openCoachPositionStatus;
  int? palaceHallExp;
  int? palaceHallGrade;
  int? redPlayerStrength;
  int? rookieSupportStatus;
  int? secretaryId;
  String? serverId;
  int? serviceId;
  int? sixDayConsumeNum;
  int? stadiumSkinId;
  bool? streetsTrainingAwardState;
  int? streetsTrainingEndTime;
  int? streetsTrainingStartTime;
  String? systemSteps;
  int? teamExp;
  int? teamGrade;
  int? teamGradeAwardState;
  int? teamId;
  int? teamLogo;
  String? teamName;
  TeamPreference? teamPreference;
  int? teamRapportGrade;
  TencentBlue? tencentBlue;
  int? totalChargeNum;
  int? totalLoginDays;
  int? totalOnlineTime;
  int? totalTourMatchStar;
  int? totalTourMatchStarAwardStatus;
  String? tourMatchCopyAwardState;
  String? tourMatchCopyUnlockAwardState;
  String? tourMatchStarAwardState;
  int? unforBidTime;
  int? updateTime;
  int? vipGrade;
  int? wearNicknameId;

  Team({
    this.accountId,
    this.accountName,
    this.activity209Grade,
    this.activity231Grade,
    this.benchCount,
    this.bindGradeAwardStatus,
    this.businessCardId,
    this.buyGiftIds,
    this.coachStrength,
    this.createIp,
    this.createTime,
    this.crossMatchGamePoint,
    this.currTeamStrength,
    this.dailyLeagueContributValue,
    this.equipmentSmeltValue,
    this.firstLoginTime,
    this.fourDayChargeNum,
    this.healCenterAwardStatus1,
    this.healCenterAwardStatus2,
    this.helpStep,
    this.homePlayerId,
    this.joinGameBattle,
    this.joinLeagueTime,
    this.kingStrength,
    this.lastAreaId,
    this.lastLoginIp,
    this.lastLoginTime,
    this.lastOffLineTime,
    this.lastShootTime,
    this.leagueContributValue,
    this.leagueId,
    this.leagueName,
    this.leagueRole,
    this.logoBoxId,
    this.mascotBagCount,
    this.mascotGrooveCount,
    this.online,
    this.openCoachPositionStatus,
    this.palaceHallExp,
    this.palaceHallGrade,
    this.redPlayerStrength,
    this.rookieSupportStatus,
    this.secretaryId,
    this.serverId,
    this.serviceId,
    this.sixDayConsumeNum,
    this.stadiumSkinId,
    this.streetsTrainingAwardState,
    this.streetsTrainingEndTime,
    this.streetsTrainingStartTime,
    this.systemSteps,
    this.teamExp,
    this.teamGrade,
    this.teamGradeAwardState,
    this.teamId,
    this.teamLogo,
    this.teamName,
    this.teamPreference,
    this.teamRapportGrade,
    this.tencentBlue,
    this.totalChargeNum,
    this.totalLoginDays,
    this.totalOnlineTime,
    this.totalTourMatchStar,
    this.totalTourMatchStarAwardStatus,
    this.tourMatchCopyAwardState,
    this.tourMatchCopyUnlockAwardState,
    this.tourMatchStarAwardState,
    this.unforBidTime,
    this.updateTime,
    this.vipGrade,
    this.wearNicknameId,
  });

  factory Team.fromMap(Map<String, dynamic> data) => Team(
        accountId: data['accountId'] as int?,
        accountName: data['accountName'] as String?,
        activity209Grade: data['activity209Grade'] as int?,
        activity231Grade: data['activity231Grade'] as int?,
        benchCount: data['benchCount'] as int?,
        bindGradeAwardStatus: data['bindGradeAwardStatus'] as int?,
        businessCardId: data['businessCardId'] as int?,
        buyGiftIds: data['buyGiftIds'] as List<dynamic>?,
        coachStrength: data['coachStrength'] as int?,
        createIp: data['createIp'] as String?,
        createTime: data['createTime'] as int?,
        crossMatchGamePoint: data['crossMatchGamePoint'] as int?,
        currTeamStrength: data['currTeamStrength'] as int?,
        dailyLeagueContributValue: data['dailyLeagueContributValue'] as int?,
        equipmentSmeltValue: data['equipmentSmeltValue'] as int?,
        firstLoginTime: data['firstLoginTime'] as int?,
        fourDayChargeNum: data['fourDayChargeNum'] as int?,
        healCenterAwardStatus1: data['healCenterAwardStatus1'] as String?,
        healCenterAwardStatus2: data['healCenterAwardStatus2'] as String?,
        helpStep: data['helpStep'] as int?,
        homePlayerId: data['homePlayerId'] as int?,
        joinGameBattle: data['joinGameBattle'] as bool?,
        joinLeagueTime: data['joinLeagueTime'] as int?,
        kingStrength: data['kingStrength'] as int?,
        lastAreaId: data['lastAreaId'] as int?,
        lastLoginIp: data['lastLoginIp'] as String?,
        lastLoginTime: data['lastLoginTime'] as int?,
        lastOffLineTime: data['lastOffLineTime'] as int?,
        lastShootTime: data['lastShootTime'] as int?,
        leagueContributValue: data['leagueContributValue'] as int?,
        leagueId: data['leagueId'] as int?,
        leagueName: data['leagueName'] as String?,
        leagueRole: data['leagueRole'] as int?,
        logoBoxId: data['logoBoxId'] as int?,
        mascotBagCount: data['mascotBagCount'] as int?,
        mascotGrooveCount: data['mascotGrooveCount'] as int?,
        online: data['online'] as bool?,
        openCoachPositionStatus: data['openCoachPositionStatus'] as int?,
        palaceHallExp: data['palaceHallExp'] as int?,
        palaceHallGrade: data['palaceHallGrade'] as int?,
        redPlayerStrength: data['redPlayerStrength'] as int?,
        rookieSupportStatus: data['rookieSupportStatus'] as int?,
        secretaryId: data['secretaryId'] as int?,
        serverId: data['serverId'] as String?,
        serviceId: data['serviceId'] as int?,
        sixDayConsumeNum: data['sixDayConsumeNum'] as int?,
        stadiumSkinId: data['stadiumSkinId'] as int?,
        streetsTrainingAwardState: data['streetsTrainingAwardState'] as bool?,
        streetsTrainingEndTime: data['streetsTrainingEndTime'] as int?,
        streetsTrainingStartTime: data['streetsTrainingStartTime'] as int?,
        systemSteps: data['systemSteps'] as String?,
        teamExp: data['teamExp'] as int?,
        teamGrade: data['teamGrade'] as int?,
        teamGradeAwardState: data['teamGradeAwardState'] as int?,
        teamId: data['teamId'] as int?,
        teamLogo: data['teamLogo'] as int?,
        teamName: data['teamName'] as String?,
        teamPreference: data['teamPreference'] == null
            ? null
            : TeamPreference.fromMap(
                data['teamPreference'] as Map<String, dynamic>),
        teamRapportGrade: data['teamRapportGrade'] as int?,
        tencentBlue: data['tencentBlue'] == null
            ? null
            : TencentBlue.fromMap(data['tencentBlue'] as Map<String, dynamic>),
        totalChargeNum: data['totalChargeNum'] as int?,
        totalLoginDays: data['totalLoginDays'] as int?,
        totalOnlineTime: data['totalOnlineTime'] as int?,
        totalTourMatchStar: data['totalTourMatchStar'] as int?,
        totalTourMatchStarAwardStatus:
            data['totalTourMatchStarAwardStatus'] as int?,
        tourMatchCopyAwardState: data['tourMatchCopyAwardState'] as String?,
        tourMatchCopyUnlockAwardState:
            data['tourMatchCopyUnlockAwardState'] as String?,
        tourMatchStarAwardState: data['tourMatchStarAwardState'] as String?,
        unforBidTime: data['unforBidTime'] as int?,
        updateTime: data['updateTime'] as int?,
        vipGrade: data['vipGrade'] as int?,
        wearNicknameId: data['wearNicknameId'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'accountId': accountId,
        'accountName': accountName,
        'activity209Grade': activity209Grade,
        'activity231Grade': activity231Grade,
        'benchCount': benchCount,
        'bindGradeAwardStatus': bindGradeAwardStatus,
        'businessCardId': businessCardId,
        'buyGiftIds': buyGiftIds,
        'coachStrength': coachStrength,
        'createIp': createIp,
        'createTime': createTime,
        'crossMatchGamePoint': crossMatchGamePoint,
        'currTeamStrength': currTeamStrength,
        'dailyLeagueContributValue': dailyLeagueContributValue,
        'equipmentSmeltValue': equipmentSmeltValue,
        'firstLoginTime': firstLoginTime,
        'fourDayChargeNum': fourDayChargeNum,
        'healCenterAwardStatus1': healCenterAwardStatus1,
        'healCenterAwardStatus2': healCenterAwardStatus2,
        'helpStep': helpStep,
        'homePlayerId': homePlayerId,
        'joinGameBattle': joinGameBattle,
        'joinLeagueTime': joinLeagueTime,
        'kingStrength': kingStrength,
        'lastAreaId': lastAreaId,
        'lastLoginIp': lastLoginIp,
        'lastLoginTime': lastLoginTime,
        'lastOffLineTime': lastOffLineTime,
        'lastShootTime': lastShootTime,
        'leagueContributValue': leagueContributValue,
        'leagueId': leagueId,
        'leagueName': leagueName,
        'leagueRole': leagueRole,
        'logoBoxId': logoBoxId,
        'mascotBagCount': mascotBagCount,
        'mascotGrooveCount': mascotGrooveCount,
        'online': online,
        'openCoachPositionStatus': openCoachPositionStatus,
        'palaceHallExp': palaceHallExp,
        'palaceHallGrade': palaceHallGrade,
        'redPlayerStrength': redPlayerStrength,
        'rookieSupportStatus': rookieSupportStatus,
        'secretaryId': secretaryId,
        'serverId': serverId,
        'serviceId': serviceId,
        'sixDayConsumeNum': sixDayConsumeNum,
        'stadiumSkinId': stadiumSkinId,
        'streetsTrainingAwardState': streetsTrainingAwardState,
        'streetsTrainingEndTime': streetsTrainingEndTime,
        'streetsTrainingStartTime': streetsTrainingStartTime,
        'systemSteps': systemSteps,
        'teamExp': teamExp,
        'teamGrade': teamGrade,
        'teamGradeAwardState': teamGradeAwardState,
        'teamId': teamId,
        'teamLogo': teamLogo,
        'teamName': teamName,
        'teamPreference': teamPreference?.toMap(),
        'teamRapportGrade': teamRapportGrade,
        'tencentBlue': tencentBlue?.toMap(),
        'totalChargeNum': totalChargeNum,
        'totalLoginDays': totalLoginDays,
        'totalOnlineTime': totalOnlineTime,
        'totalTourMatchStar': totalTourMatchStar,
        'totalTourMatchStarAwardStatus': totalTourMatchStarAwardStatus,
        'tourMatchCopyAwardState': tourMatchCopyAwardState,
        'tourMatchCopyUnlockAwardState': tourMatchCopyUnlockAwardState,
        'tourMatchStarAwardState': tourMatchStarAwardState,
        'unforBidTime': unforBidTime,
        'updateTime': updateTime,
        'vipGrade': vipGrade,
        'wearNicknameId': wearNicknameId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Team].
  factory Team.fromJson(String data) {
    return Team.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Team] to a JSON string.
  String toJson() => json.encode(toMap());
}
