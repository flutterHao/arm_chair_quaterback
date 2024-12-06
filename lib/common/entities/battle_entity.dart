import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/battle_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/battle_entity.g.dart';

@JsonSerializable()
class BattleEntity {
  late int awayTeamPower;
  BattleNew? news;
  late List<TeamPlayerList> homeTeamPlayerList;
  late BattleTeam awayTeam;
  late AbilityValue awayAbilityValue;
  late List<TeamPlayerList> awayTeamPlayerList;
  late List<TeamBuffer> awayTeamBuff;
  late int homeTeamPower;
  late List<TeamBuffer> homeTeamBuff;
  late BattleTeam homeTeam;
  late BattleGameData gameData;
  late AbilityValue homeAbilityValue;
  late double newsBuffAdd;
  late int newsBuffPlayerId;
  late double homeTeamReadiness;
  late double awayTeamReadiness;

  BattleEntity();

  factory BattleEntity.fromJson(Map<String, dynamic> json) =>
      $BattleEntityFromJson(json);

  Map<String, dynamic> toJson() => $BattleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BattleNew {
  late int isLike;
  late int isView;
  late String dataLabel;
  late int updateTime;
  late int reviewsCount;
  late String source;
  late String title;
  late int unLikes;
  late String content;
  late List<dynamic> reviewsList;
  late int postTime;
  late int award;
  late int createTime;
  late int id;
  late int views;
  late int likes;

  BattleNew();

  factory BattleNew.fromJson(Map<String, dynamic> json) =>
      $BattleNewFromJson(json);

  Map<String, dynamic> toJson() => $BattleNewToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamBuffer {
  late double buffValue;
  late int face;
  late int createTime;
  late int teamId;
  late int updateTime;
  late int id;
  late int color;
  late int takeEffectGameCount;

  TeamBuffer();

  factory TeamBuffer.fromJson(Map<String, dynamic> json) =>
      $TeamBufferFromJson(json);

  Map<String, dynamic> toJson() => $TeamBufferToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamPlayerList {
  late int buyPrice;
  late int buyPlayerScore;
  late int updateTime;
  late String uuid;
  late double playerReadiness;
  late int gradeExp;
  late int fromType;
  late int createTime;
  late int playerGrade;
  late int teamId;
  late int id;
  late int position;
  late int power;
  late int playerStatus;
  late Potential potential;
  late bool bindStatus;
  late int breakThroughGrade;
  late int playerId;
  late UpStarBase upStarBase;

  TeamPlayerList();

  factory TeamPlayerList.fromJson(Map<String, dynamic> json) =>
      $TeamPlayerListFromJson(json);

  Map<String, dynamic> toJson() => $TeamPlayerListToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Potential {
  late int blk;
  int? threePt;
  late int ast;
  late int stl;
  late int pts;
  late int reb;

  Potential();

  factory Potential.fromJson(Map<String, dynamic> json) =>
      $PotentialFromJson(json);

  Map<String, dynamic> toJson() => $PotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UpStarBase {
  late int blk;
  int? threePt;
  late int ast;
  late int stl;
  late int pts;
  late int reb;

  UpStarBase();

  factory UpStarBase.fromJson(Map<String, dynamic> json) =>
      $UpStarBaseFromJson(json);

  Map<String, dynamic> toJson() => $UpStarBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BattleTeam {
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
  late int maxCup;
  late int firstLoginTime;
  late int secretaryId;
  late int teamExp;
  late Preference teamPreference;
  late int logoBoxId;
  late int lastOffLineTime;
  late int beforeGuessWinningStreak;
  late int totalChargeNum;
  late int cup;
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
  late int cupRankId;
  late int serviceId;
  late int unforBidTime;
  late int currentWinGames;
  late int updateTime;
  late int currentContinuousLoss;
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
  late int rankProtect;

  BattleTeam();

  factory BattleTeam.fromJson(Map<String, dynamic> json) =>
      $BattleTeamFromJson(json);

  Map<String, dynamic> toJson() => $BattleTeamToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class Preference {
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

  Preference();

  factory Preference.fromJson(Map<String, dynamic> json) =>
      $PreferenceFromJson(json);

  Map<String, dynamic> toJson() => $PreferenceToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class AbilityValue {
  late int blk;
  late int threePt;
  late int ast;
  late int stl;
  late int pts;
  late int reb;

  AbilityValue();

  factory AbilityValue.fromJson(Map<String, dynamic> json) =>
      $AbilityValueFromJson(json);

  Map<String, dynamic> toJson() => $AbilityValueToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BattleGameData {
  late List<ScoreBoardDetails> awayScoreBoardDetails;
  late ScoreBoard homeScoreBoard;
  late List<ScoreBoardDetails> homeScoreBoardDetails;
  late ScoreBoard awayScoreBoard;
  late GameSchedule gameSchedule;
  late TestDataMap testDataMap;

  BattleGameData();

  factory BattleGameData.fromJson(Map<String, dynamic> json) =>
      $BattleGameDataFromJson(json);

  Map<String, dynamic> toJson() => $BattleGameDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ScoreBoardDetails {
  late int fga;
  late int ast;
  late int dreb;
  late int starterPos;
  late int fgm;
  late int ptsPoint;
  late int reb;
  late int mvpPoint;
  late int fta;
  late int min;
  late int property;
  late int ftm;
  late int playerId;
  late int blk;
  late int gameId;
  late int astPoint;
  late bool starter;
  late int blkPoint;
  late int stl;
  late int updateTime;
  late int pts;
  late int threePa;
  late int rebPoint;
  late int oreb;
  late int createTime;
  late int pf;
  late int teamId;
  late int threePm;
  late int to;

  ScoreBoardDetails();

  factory ScoreBoardDetails.fromJson(Map<String, dynamic> json) =>
      $ScoreBoardDetailsFromJson(json);

  Map<String, dynamic> toJson() => $ScoreBoardDetailsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ScoreBoard {
  late int gameId;
  late int quarter1;
  late int quarter2;
  late int quarter3;
  late int quarter4;
  late int updateTime;
  late int ot2;
  late int ot1;
  late int ot4;
  late int ot3;
  late int ot6;
  late int ot5;
  late int ot8;
  late int total;
  late int ot7;
  late int createTime;
  late int teamId;

  ScoreBoard();

  factory ScoreBoard.fromJson(Map<String, dynamic> json) =>
      $ScoreBoardFromJson(json);

  Map<String, dynamic> toJson() => $ScoreBoardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class GameSchedule {
  late int gameId;
  late int gameType;
  late int homeScore;
  late int updateTime;
  late int awayScore;
  late int createTime;
  late String awayTeamName;
  late int homeLeagueId;
  late int awayLeagueId;
  late int awayTeamLogo;
  late int homeTeamLogo;
  late String homeTeamName;
  late int homeTeamId;
  late String awayLeagueName;
  late int awayTeamId;
  late String homeLeagueName;

  GameSchedule();

  factory GameSchedule.fromJson(Map<String, dynamic> json) =>
      $GameScheduleFromJson(json);

  Map<String, dynamic> toJson() => $GameScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TestDataMap {
  late String awayTotalAttackRound;
  late String awayAttackCap;
  late String awayDefenseCap;
  late String homeRound;
  late String awayRound;
  late String homeAttackCap;
  late String homeTotalAttackRound;
  late String homeDefenseCap;

  TestDataMap();

  factory TestDataMap.fromJson(Map<String, dynamic> json) =>
      $TestDataMapFromJson(json);

  Map<String, dynamic> toJson() => $TestDataMapToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
