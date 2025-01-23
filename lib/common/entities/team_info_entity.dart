import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_info_entity.g.dart';

@JsonSerializable()
class TeamInfoEntity {
  late int joinLeagueTime;
  late String teamName;
  late int leagueRole;
  late int salary;
  late String serverId;
  late int totalOnlineTime;
  late String leagueName;
  late int leagueId;
  late int maxGuessWinningStreak;
  late int totalLoginDays;
  late int dailyLeagueContributValue;
  late int teamLogo;
  late int powerReplyTime;
  late int currentGuessWinningStreak;
  late int currentGameWinningStreak;
  late int playerReadiness;
  late int accountId;
  late int firstLoginTime;
  late int secretaryId;
  late int teamExp;
  late TeamInfoTeamPreference teamPreference;
  late int logoBoxId;
  late int lastOffLineTime;
  late int beforeGuessWinningStreak;
  late int totalChargeNum;
  late int cup;
  late int maxCup;
  late int cupRankId;
  late int helpStep;
  late String createIp;
  late int totalGames;
  late String accountName;
  late String signature;
  late int teamGrade;
  late int businessCardId;
  late String lastLoginIp;
  late int vipGrade;
  late int leagueContributValue;
  late int maxGameWinningStreak;
  late int serviceId;
  late int unforBidTime;
  late int currentWinGames;
  late int updateTime;
  late String systemSteps;
  late int lastLoginTime;
  late int createTime;
  late int teamId;
  late int currTeamStrength;
  late bool online;
  late int wearNicknameId;
  late int lastAreaId;
  late int gameWinRate;
  late int benchCount;

  TeamInfoEntity();

  factory TeamInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TeamInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamInfoTeamPreference {
  late int speakOpenTime;
  late bool startFirstQuarter;
  late bool closeFriendlyMessage;
  late bool changeTactics;
  late bool closeGuessStartRemind;
  late String version;
  late bool closeGuessEndRemind;
  late int gameSpeedIndex;
  late bool changePlayer;
  late bool useSkill;
  late bool closeFriendlyMatch;
  late int musicEffectVolume;
  late bool closeSecondaryPass;
  late int musicVolume;

  TeamInfoTeamPreference();

  factory TeamInfoTeamPreference.fromJson(Map<String, dynamic> json) =>
      $TeamInfoTeamPreferenceFromJson(json);

  Map<String, dynamic> toJson() => $TeamInfoTeamPreferenceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
