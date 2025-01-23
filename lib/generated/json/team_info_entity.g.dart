import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';

TeamInfoEntity $TeamInfoEntityFromJson(Map<String, dynamic> json) {
  final TeamInfoEntity teamInfoEntity = TeamInfoEntity();
  final int? joinLeagueTime = jsonConvert.convert<int>(json['joinLeagueTime']);
  if (joinLeagueTime != null) {
    teamInfoEntity.joinLeagueTime = joinLeagueTime;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    teamInfoEntity.teamName = teamName;
  }
  final int? leagueRole = jsonConvert.convert<int>(json['leagueRole']);
  if (leagueRole != null) {
    teamInfoEntity.leagueRole = leagueRole;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    teamInfoEntity.salary = salary;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    teamInfoEntity.serverId = serverId;
  }
  final int? totalOnlineTime = jsonConvert.convert<int>(
      json['totalOnlineTime']);
  if (totalOnlineTime != null) {
    teamInfoEntity.totalOnlineTime = totalOnlineTime;
  }
  final String? leagueName = jsonConvert.convert<String>(json['leagueName']);
  if (leagueName != null) {
    teamInfoEntity.leagueName = leagueName;
  }
  final int? leagueId = jsonConvert.convert<int>(json['leagueId']);
  if (leagueId != null) {
    teamInfoEntity.leagueId = leagueId;
  }
  final int? maxGuessWinningStreak = jsonConvert.convert<int>(
      json['maxGuessWinningStreak']);
  if (maxGuessWinningStreak != null) {
    teamInfoEntity.maxGuessWinningStreak = maxGuessWinningStreak;
  }
  final int? totalLoginDays = jsonConvert.convert<int>(json['totalLoginDays']);
  if (totalLoginDays != null) {
    teamInfoEntity.totalLoginDays = totalLoginDays;
  }
  final int? dailyLeagueContributValue = jsonConvert.convert<int>(
      json['dailyLeagueContributValue']);
  if (dailyLeagueContributValue != null) {
    teamInfoEntity.dailyLeagueContributValue = dailyLeagueContributValue;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    teamInfoEntity.teamLogo = teamLogo;
  }
  final int? powerReplyTime = jsonConvert.convert<int>(json['powerReplyTime']);
  if (powerReplyTime != null) {
    teamInfoEntity.powerReplyTime = powerReplyTime;
  }
  final int? currentGuessWinningStreak = jsonConvert.convert<int>(
      json['currentGuessWinningStreak']);
  if (currentGuessWinningStreak != null) {
    teamInfoEntity.currentGuessWinningStreak = currentGuessWinningStreak;
  }
  final int? currentGameWinningStreak = jsonConvert.convert<int>(
      json['currentGameWinningStreak']);
  if (currentGameWinningStreak != null) {
    teamInfoEntity.currentGameWinningStreak = currentGameWinningStreak;
  }
  final int? playerReadiness = jsonConvert.convert<int>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    teamInfoEntity.playerReadiness = playerReadiness;
  }
  final int? accountId = jsonConvert.convert<int>(json['accountId']);
  if (accountId != null) {
    teamInfoEntity.accountId = accountId;
  }
  final int? firstLoginTime = jsonConvert.convert<int>(json['firstLoginTime']);
  if (firstLoginTime != null) {
    teamInfoEntity.firstLoginTime = firstLoginTime;
  }
  final int? secretaryId = jsonConvert.convert<int>(json['secretaryId']);
  if (secretaryId != null) {
    teamInfoEntity.secretaryId = secretaryId;
  }
  final int? teamExp = jsonConvert.convert<int>(json['teamExp']);
  if (teamExp != null) {
    teamInfoEntity.teamExp = teamExp;
  }
  final TeamInfoTeamPreference? teamPreference = jsonConvert.convert<
      TeamInfoTeamPreference>(json['teamPreference']);
  if (teamPreference != null) {
    teamInfoEntity.teamPreference = teamPreference;
  }
  final int? logoBoxId = jsonConvert.convert<int>(json['logoBoxId']);
  if (logoBoxId != null) {
    teamInfoEntity.logoBoxId = logoBoxId;
  }
  final int? lastOffLineTime = jsonConvert.convert<int>(
      json['lastOffLineTime']);
  if (lastOffLineTime != null) {
    teamInfoEntity.lastOffLineTime = lastOffLineTime;
  }
  final int? beforeGuessWinningStreak = jsonConvert.convert<int>(
      json['beforeGuessWinningStreak']);
  if (beforeGuessWinningStreak != null) {
    teamInfoEntity.beforeGuessWinningStreak = beforeGuessWinningStreak;
  }
  final int? totalChargeNum = jsonConvert.convert<int>(json['totalChargeNum']);
  if (totalChargeNum != null) {
    teamInfoEntity.totalChargeNum = totalChargeNum;
  }
  final int? helpStep = jsonConvert.convert<int>(json['helpStep']);
  if (helpStep != null) {
    teamInfoEntity.helpStep = helpStep;
  }
  final String? createIp = jsonConvert.convert<String>(json['createIp']);
  if (createIp != null) {
    teamInfoEntity.createIp = createIp;
  }
  final int? totalGames = jsonConvert.convert<int>(json['totalGames']);
  if (totalGames != null) {
    teamInfoEntity.totalGames = totalGames;
  }
  final String? accountName = jsonConvert.convert<String>(json['accountName']);
  if (accountName != null) {
    teamInfoEntity.accountName = accountName;
  }
  final String? signature = jsonConvert.convert<String>(json['signature']);
  if (signature != null) {
    teamInfoEntity.signature = signature;
  }
  final int? teamGrade = jsonConvert.convert<int>(json['teamGrade']);
  if (teamGrade != null) {
    teamInfoEntity.teamGrade = teamGrade;
  }
  final int? businessCardId = jsonConvert.convert<int>(json['businessCardId']);
  if (businessCardId != null) {
    teamInfoEntity.businessCardId = businessCardId;
  }
  final String? lastLoginIp = jsonConvert.convert<String>(json['lastLoginIp']);
  if (lastLoginIp != null) {
    teamInfoEntity.lastLoginIp = lastLoginIp;
  }
  final int? vipGrade = jsonConvert.convert<int>(json['vipGrade']);
  if (vipGrade != null) {
    teamInfoEntity.vipGrade = vipGrade;
  }
  final int? leagueContributValue = jsonConvert.convert<int>(
      json['leagueContributValue']);
  if (leagueContributValue != null) {
    teamInfoEntity.leagueContributValue = leagueContributValue;
  }
  final int? maxGameWinningStreak = jsonConvert.convert<int>(
      json['maxGameWinningStreak']);
  if (maxGameWinningStreak != null) {
    teamInfoEntity.maxGameWinningStreak = maxGameWinningStreak;
  }
  final int? serviceId = jsonConvert.convert<int>(json['serviceId']);
  if (serviceId != null) {
    teamInfoEntity.serviceId = serviceId;
  }
  final int? unforBidTime = jsonConvert.convert<int>(json['unforBidTime']);
  if (unforBidTime != null) {
    teamInfoEntity.unforBidTime = unforBidTime;
  }
  final int? currentWinGames = jsonConvert.convert<int>(
      json['currentWinGames']);
  if (currentWinGames != null) {
    teamInfoEntity.currentWinGames = currentWinGames;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    teamInfoEntity.updateTime = updateTime;
  }
  final String? systemSteps = jsonConvert.convert<String>(json['systemSteps']);
  if (systemSteps != null) {
    teamInfoEntity.systemSteps = systemSteps;
  }
  final int? lastLoginTime = jsonConvert.convert<int>(json['lastLoginTime']);
  if (lastLoginTime != null) {
    teamInfoEntity.lastLoginTime = lastLoginTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamInfoEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamInfoEntity.teamId = teamId;
  }
  final int? currTeamStrength = jsonConvert.convert<int>(
      json['currTeamStrength']);
  if (currTeamStrength != null) {
    teamInfoEntity.currTeamStrength = currTeamStrength;
  }
  final bool? online = jsonConvert.convert<bool>(json['online']);
  if (online != null) {
    teamInfoEntity.online = online;
  }
  final int? wearNicknameId = jsonConvert.convert<int>(json['wearNicknameId']);
  if (wearNicknameId != null) {
    teamInfoEntity.wearNicknameId = wearNicknameId;
  }
  final int? lastAreaId = jsonConvert.convert<int>(json['lastAreaId']);
  if (lastAreaId != null) {
    teamInfoEntity.lastAreaId = lastAreaId;
  }
  final int? gameWinRate = jsonConvert.convert<int>(json['gameWinRate']);
  if (gameWinRate != null) {
    teamInfoEntity.gameWinRate = gameWinRate;
  }
  final int? benchCount = jsonConvert.convert<int>(json['benchCount']);
  if (benchCount != null) {
    teamInfoEntity.benchCount = benchCount;
  }
  return teamInfoEntity;
}

Map<String, dynamic> $TeamInfoEntityToJson(TeamInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['joinLeagueTime'] = entity.joinLeagueTime;
  data['teamName'] = entity.teamName;
  data['leagueRole'] = entity.leagueRole;
  data['salary'] = entity.salary;
  data['serverId'] = entity.serverId;
  data['totalOnlineTime'] = entity.totalOnlineTime;
  data['leagueName'] = entity.leagueName;
  data['leagueId'] = entity.leagueId;
  data['maxGuessWinningStreak'] = entity.maxGuessWinningStreak;
  data['totalLoginDays'] = entity.totalLoginDays;
  data['dailyLeagueContributValue'] = entity.dailyLeagueContributValue;
  data['teamLogo'] = entity.teamLogo;
  data['powerReplyTime'] = entity.powerReplyTime;
  data['currentGuessWinningStreak'] = entity.currentGuessWinningStreak;
  data['currentGameWinningStreak'] = entity.currentGameWinningStreak;
  data['playerReadiness'] = entity.playerReadiness;
  data['accountId'] = entity.accountId;
  data['firstLoginTime'] = entity.firstLoginTime;
  data['secretaryId'] = entity.secretaryId;
  data['teamExp'] = entity.teamExp;
  data['teamPreference'] = entity.teamPreference.toJson();
  data['logoBoxId'] = entity.logoBoxId;
  data['lastOffLineTime'] = entity.lastOffLineTime;
  data['beforeGuessWinningStreak'] = entity.beforeGuessWinningStreak;
  data['totalChargeNum'] = entity.totalChargeNum;
  data['helpStep'] = entity.helpStep;
  data['createIp'] = entity.createIp;
  data['totalGames'] = entity.totalGames;
  data['accountName'] = entity.accountName;
  data['signature'] = entity.signature;
  data['teamGrade'] = entity.teamGrade;
  data['businessCardId'] = entity.businessCardId;
  data['lastLoginIp'] = entity.lastLoginIp;
  data['vipGrade'] = entity.vipGrade;
  data['leagueContributValue'] = entity.leagueContributValue;
  data['maxGameWinningStreak'] = entity.maxGameWinningStreak;
  data['serviceId'] = entity.serviceId;
  data['unforBidTime'] = entity.unforBidTime;
  data['currentWinGames'] = entity.currentWinGames;
  data['updateTime'] = entity.updateTime;
  data['systemSteps'] = entity.systemSteps;
  data['lastLoginTime'] = entity.lastLoginTime;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['currTeamStrength'] = entity.currTeamStrength;
  data['online'] = entity.online;
  data['wearNicknameId'] = entity.wearNicknameId;
  data['lastAreaId'] = entity.lastAreaId;
  data['gameWinRate'] = entity.gameWinRate;
  data['benchCount'] = entity.benchCount;
  return data;
}

extension TeamInfoEntityExtension on TeamInfoEntity {
  TeamInfoEntity copyWith({
    int? joinLeagueTime,
    String? teamName,
    int? leagueRole,
    int? salary,
    String? serverId,
    int? totalOnlineTime,
    String? leagueName,
    int? leagueId,
    int? maxGuessWinningStreak,
    int? totalLoginDays,
    int? dailyLeagueContributValue,
    int? teamLogo,
    int? powerReplyTime,
    int? currentGuessWinningStreak,
    int? currentGameWinningStreak,
    int? playerReadiness,
    int? accountId,
    int? firstLoginTime,
    int? secretaryId,
    int? teamExp,
    TeamInfoTeamPreference? teamPreference,
    int? logoBoxId,
    int? lastOffLineTime,
    int? beforeGuessWinningStreak,
    int? totalChargeNum,
    int? helpStep,
    String? createIp,
    int? totalGames,
    String? accountName,
    String? signature,
    int? teamGrade,
    int? businessCardId,
    String? lastLoginIp,
    int? vipGrade,
    int? leagueContributValue,
    int? maxGameWinningStreak,
    int? serviceId,
    int? unforBidTime,
    int? currentWinGames,
    int? updateTime,
    String? systemSteps,
    int? lastLoginTime,
    int? createTime,
    int? teamId,
    int? currTeamStrength,
    bool? online,
    int? wearNicknameId,
    int? lastAreaId,
    int? gameWinRate,
    int? benchCount,
  }) {
    return TeamInfoEntity()
      ..joinLeagueTime = joinLeagueTime ?? this.joinLeagueTime
      ..teamName = teamName ?? this.teamName
      ..leagueRole = leagueRole ?? this.leagueRole
      ..salary = salary ?? this.salary
      ..serverId = serverId ?? this.serverId
      ..totalOnlineTime = totalOnlineTime ?? this.totalOnlineTime
      ..leagueName = leagueName ?? this.leagueName
      ..leagueId = leagueId ?? this.leagueId
      ..maxGuessWinningStreak = maxGuessWinningStreak ??
          this.maxGuessWinningStreak
      ..totalLoginDays = totalLoginDays ?? this.totalLoginDays
      ..dailyLeagueContributValue = dailyLeagueContributValue ??
          this.dailyLeagueContributValue
      ..teamLogo = teamLogo ?? this.teamLogo
      ..powerReplyTime = powerReplyTime ?? this.powerReplyTime
      ..currentGuessWinningStreak = currentGuessWinningStreak ??
          this.currentGuessWinningStreak
      ..currentGameWinningStreak = currentGameWinningStreak ??
          this.currentGameWinningStreak
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..accountId = accountId ?? this.accountId
      ..firstLoginTime = firstLoginTime ?? this.firstLoginTime
      ..secretaryId = secretaryId ?? this.secretaryId
      ..teamExp = teamExp ?? this.teamExp
      ..teamPreference = teamPreference ?? this.teamPreference
      ..logoBoxId = logoBoxId ?? this.logoBoxId
      ..lastOffLineTime = lastOffLineTime ?? this.lastOffLineTime
      ..beforeGuessWinningStreak = beforeGuessWinningStreak ??
          this.beforeGuessWinningStreak
      ..totalChargeNum = totalChargeNum ?? this.totalChargeNum
      ..helpStep = helpStep ?? this.helpStep
      ..createIp = createIp ?? this.createIp
      ..totalGames = totalGames ?? this.totalGames
      ..accountName = accountName ?? this.accountName
      ..signature = signature ?? this.signature
      ..teamGrade = teamGrade ?? this.teamGrade
      ..businessCardId = businessCardId ?? this.businessCardId
      ..lastLoginIp = lastLoginIp ?? this.lastLoginIp
      ..vipGrade = vipGrade ?? this.vipGrade
      ..leagueContributValue = leagueContributValue ?? this.leagueContributValue
      ..maxGameWinningStreak = maxGameWinningStreak ?? this.maxGameWinningStreak
      ..serviceId = serviceId ?? this.serviceId
      ..unforBidTime = unforBidTime ?? this.unforBidTime
      ..currentWinGames = currentWinGames ?? this.currentWinGames
      ..updateTime = updateTime ?? this.updateTime
      ..systemSteps = systemSteps ?? this.systemSteps
      ..lastLoginTime = lastLoginTime ?? this.lastLoginTime
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..currTeamStrength = currTeamStrength ?? this.currTeamStrength
      ..online = online ?? this.online
      ..wearNicknameId = wearNicknameId ?? this.wearNicknameId
      ..lastAreaId = lastAreaId ?? this.lastAreaId
      ..gameWinRate = gameWinRate ?? this.gameWinRate
      ..benchCount = benchCount ?? this.benchCount;
  }
}

TeamInfoTeamPreference $TeamInfoTeamPreferenceFromJson(
    Map<String, dynamic> json) {
  final TeamInfoTeamPreference teamInfoTeamPreference = TeamInfoTeamPreference();
  final int? speakOpenTime = jsonConvert.convert<int>(json['speakOpenTime']);
  if (speakOpenTime != null) {
    teamInfoTeamPreference.speakOpenTime = speakOpenTime;
  }
  final bool? startFirstQuarter = jsonConvert.convert<bool>(
      json['startFirstQuarter']);
  if (startFirstQuarter != null) {
    teamInfoTeamPreference.startFirstQuarter = startFirstQuarter;
  }
  final bool? closeFriendlyMessage = jsonConvert.convert<bool>(
      json['closeFriendlyMessage']);
  if (closeFriendlyMessage != null) {
    teamInfoTeamPreference.closeFriendlyMessage = closeFriendlyMessage;
  }
  final bool? changeTactics = jsonConvert.convert<bool>(json['changeTactics']);
  if (changeTactics != null) {
    teamInfoTeamPreference.changeTactics = changeTactics;
  }
  final bool? closeGuessStartRemind = jsonConvert.convert<bool>(
      json['closeGuessStartRemind']);
  if (closeGuessStartRemind != null) {
    teamInfoTeamPreference.closeGuessStartRemind = closeGuessStartRemind;
  }
  final String? version = jsonConvert.convert<String>(json['version']);
  if (version != null) {
    teamInfoTeamPreference.version = version;
  }
  final bool? closeGuessEndRemind = jsonConvert.convert<bool>(
      json['closeGuessEndRemind']);
  if (closeGuessEndRemind != null) {
    teamInfoTeamPreference.closeGuessEndRemind = closeGuessEndRemind;
  }
  final int? gameSpeedIndex = jsonConvert.convert<int>(json['gameSpeedIndex']);
  if (gameSpeedIndex != null) {
    teamInfoTeamPreference.gameSpeedIndex = gameSpeedIndex;
  }
  final bool? changePlayer = jsonConvert.convert<bool>(json['changePlayer']);
  if (changePlayer != null) {
    teamInfoTeamPreference.changePlayer = changePlayer;
  }
  final bool? useSkill = jsonConvert.convert<bool>(json['useSkill']);
  if (useSkill != null) {
    teamInfoTeamPreference.useSkill = useSkill;
  }
  final bool? closeFriendlyMatch = jsonConvert.convert<bool>(
      json['closeFriendlyMatch']);
  if (closeFriendlyMatch != null) {
    teamInfoTeamPreference.closeFriendlyMatch = closeFriendlyMatch;
  }
  final int? musicEffectVolume = jsonConvert.convert<int>(
      json['musicEffectVolume']);
  if (musicEffectVolume != null) {
    teamInfoTeamPreference.musicEffectVolume = musicEffectVolume;
  }
  final bool? closeSecondaryPass = jsonConvert.convert<bool>(
      json['closeSecondaryPass']);
  if (closeSecondaryPass != null) {
    teamInfoTeamPreference.closeSecondaryPass = closeSecondaryPass;
  }
  final int? musicVolume = jsonConvert.convert<int>(json['musicVolume']);
  if (musicVolume != null) {
    teamInfoTeamPreference.musicVolume = musicVolume;
  }
  return teamInfoTeamPreference;
}

Map<String, dynamic> $TeamInfoTeamPreferenceToJson(
    TeamInfoTeamPreference entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['speakOpenTime'] = entity.speakOpenTime;
  data['startFirstQuarter'] = entity.startFirstQuarter;
  data['closeFriendlyMessage'] = entity.closeFriendlyMessage;
  data['changeTactics'] = entity.changeTactics;
  data['closeGuessStartRemind'] = entity.closeGuessStartRemind;
  data['version'] = entity.version;
  data['closeGuessEndRemind'] = entity.closeGuessEndRemind;
  data['gameSpeedIndex'] = entity.gameSpeedIndex;
  data['changePlayer'] = entity.changePlayer;
  data['useSkill'] = entity.useSkill;
  data['closeFriendlyMatch'] = entity.closeFriendlyMatch;
  data['musicEffectVolume'] = entity.musicEffectVolume;
  data['closeSecondaryPass'] = entity.closeSecondaryPass;
  data['musicVolume'] = entity.musicVolume;
  return data;
}

extension TeamInfoTeamPreferenceExtension on TeamInfoTeamPreference {
  TeamInfoTeamPreference copyWith({
    int? speakOpenTime,
    bool? startFirstQuarter,
    bool? closeFriendlyMessage,
    bool? changeTactics,
    bool? closeGuessStartRemind,
    String? version,
    bool? closeGuessEndRemind,
    int? gameSpeedIndex,
    bool? changePlayer,
    bool? useSkill,
    bool? closeFriendlyMatch,
    int? musicEffectVolume,
    bool? closeSecondaryPass,
    int? musicVolume,
  }) {
    return TeamInfoTeamPreference()
      ..speakOpenTime = speakOpenTime ?? this.speakOpenTime
      ..startFirstQuarter = startFirstQuarter ?? this.startFirstQuarter
      ..closeFriendlyMessage = closeFriendlyMessage ?? this.closeFriendlyMessage
      ..changeTactics = changeTactics ?? this.changeTactics
      ..closeGuessStartRemind = closeGuessStartRemind ??
          this.closeGuessStartRemind
      ..version = version ?? this.version
      ..closeGuessEndRemind = closeGuessEndRemind ?? this.closeGuessEndRemind
      ..gameSpeedIndex = gameSpeedIndex ?? this.gameSpeedIndex
      ..changePlayer = changePlayer ?? this.changePlayer
      ..useSkill = useSkill ?? this.useSkill
      ..closeFriendlyMatch = closeFriendlyMatch ?? this.closeFriendlyMatch
      ..musicEffectVolume = musicEffectVolume ?? this.musicEffectVolume
      ..closeSecondaryPass = closeSecondaryPass ?? this.closeSecondaryPass
      ..musicVolume = musicVolume ?? this.musicVolume;
  }
}