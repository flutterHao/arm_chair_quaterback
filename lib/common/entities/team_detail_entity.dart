import 'package:arm_chair_quaterback/common/entities/last5_avg_entity.dart';
import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_detail_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_detail_entity.g.dart';

@JsonSerializable()
class TeamDetailEntity {
  late List<TeamDetailGameSchedules> gameSchedules = [];
  @JSONField(name: "RegularSeasonData")
  late TeamDetailSeasonData regularSeasonData = TeamDetailSeasonData();
  late ScoresEntity recentPick = ScoresEntity();
  late TeamDetailLast5GameSchedule last5GameSchedule =
      TeamDetailLast5GameSchedule();
  late TeamDetailLast5GameSchedule guessL5GameList =
      TeamDetailLast5GameSchedule();
  @JSONField(name: "PreSeasonData")
  TeamDetailSeasonData? preSeasonData;
  @JSONField(name: "PlayoffsData")
  TeamDetailSeasonData? playoffsData;
  late TeamDetailTotalL5Data totalL5Data = TeamDetailTotalL5Data();
  late List<TeamDetailOutcome> outcome = [];

  TeamDetailEntity();

  factory TeamDetailEntity.fromJson(Map<String, dynamic> json) =>
      $TeamDetailEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailGameSchedules {
  late int gameId = 0;
  late int gameType = 0;
  late int gameTime = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late int homeTeamId = 0;
  late int awayTeamId = 0;
  late int status = 0;

  TeamDetailGameSchedules();

  factory TeamDetailGameSchedules.fromJson(Map<String, dynamic> json) =>
      $TeamDetailGameSchedulesFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailGameSchedulesToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailSeasonData {
  @JSONField(name: "PFD_RANK")
  late int pfdRank = 0;
  @JSONField(name: "FG3_PCT")
  late double fg3Pct = 0;
  @JSONField(name: "OREB_RANK")
  late int orebRank = 0;
  @JSONField(name: "STL")
  late double sTL = 0;
  @JSONField(name: "DREB")
  late double dREB = 0;
  @JSONField(name: "FG_PCT_RANK")
  late int fgPctRank = 0;
  @JSONField(name: "PLUS_MINUS_RANK")
  late int plusMinusRank = 0;
  @JSONField(name: "PFD")
  late double pFD = 0;
  @JSONField(name: "PF_RANK")
  late int pfRank = 0;
  @JSONField(name: "DREB_RANK")
  late int drebRank = 0;
  @JSONField(name: "TOV_RANK")
  late int tovRank = 0;
  @JSONField(name: "FGA")
  late double fGA = 0;
  @JSONField(name: "FG3_PCT_RANK")
  late int fg3PctRank = 0;
  @JSONField(name: "BLK_RANK")
  late int blkRank = 0;
  @JSONField(name: "FGM")
  late double fGM = 0;
  @JSONField(name: "L_RANK")
  late int lRank = 0;
  @JSONField(name: "W_PCT")
  late double wPct = 0;
  @JSONField(name: "FG3A_RANK")
  late int fg3aRank = 0;
  @JSONField(name: "FTA")
  late double fTA = 0;
  @JSONField(name: "MIN")
  late double mIN = 0;
  @JSONField(name: "TOV")
  late double tOV = 0;
  @JSONField(name: "FG3M_RANK")
  late int fg3mRank = 0;
  @JSONField(name: "FTM")
  late double fTM = 0;
  @JSONField(name: "TEAM_ID")
  late int teamId = 0;
  @JSONField(name: "BLKA")
  late double bLKA = 0;
  @JSONField(name: "BLK")
  late double bLK = 0;
  @JSONField(name: "PLUS_MINUS")
  late double plusMinus;
  @JSONField(name: "W_RANK")
  late int wRank = 0;
  @JSONField(name: "MIN_RANK")
  late int minRank = 0;
  @JSONField(name: "FG_PCT")
  late double fgPct = 0;
  @JSONField(name: "L")
  late int l = 0;
  @JSONField(name: "PTS")
  late double pTS = 0;
  @JSONField(name: "FG3A")
  late double fG3A = 0;
  @JSONField(name: "FTM_RANK")
  late int ftmRank = 0;
  @JSONField(name: "FTA_RANK")
  late int ftaRank = 0;
  @JSONField(name: "FGA_RANK")
  late int fgaRank = 0;
  @JSONField(name: "REB_RANK")
  late int rebRank = 0;
  @JSONField(name: "BLKA_RANK")
  late int blkaRank = 0;
  @JSONField(name: "W")
  late int w = 0;
  @JSONField(name: "FG3M")
  late double fG3M = 0;
  @JSONField(name: "W_PCT_RANK")
  late int wPctRank = 0;
  @JSONField(name: "AST_RANK")
  late int astRank = 0;
  @JSONField(name: "AST")
  late double aST = 0;
  @JSONField(name: "OREB")
  late double oREB = 0;
  @JSONField(name: "FT_PCT_RANK")
  late int ftPctRank = 0;
  @JSONField(name: "GP")
  late double gP = 0;
  @JSONField(name: "FGM_RANK")
  late int fgmRank = 0;
  @JSONField(name: "REB")
  late double rEB = 0;
  @JSONField(name: "FT_PCT")
  late double ftPct = 0;
  @JSONField(name: "PTS_RANK")
  late int ptsRank = 0;
  @JSONField(name: "TEAM_NAME")
  late String teamName = '';
  @JSONField(name: "PF")
  late double pF = 0;
  @JSONField(name: "GP_RANK")
  late int gpRank = 0;
  @JSONField(name: "STL_RANK")
  late int stlRank = 0;

  TeamDetailSeasonData();

  factory TeamDetailSeasonData.fromJson(Map<String, dynamic> json) =>
      $TeamDetailSeasonDataFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailSeasonDataToJson(this);

  double getRankValue(String type, TeamDetailSeasonData item) {
    double value = 0;
    switch (type) {
      case "PPG": //场均PTS
        value = item.pTS;
      case "PTS":
        value = item.pTS;
      case "FGM":
        value = item.fGM;
      case "FGA":
        value = item.fGA;
      // case "3PM":
      //   value = item.threePM;
      case "3PA":
        value = item.fGA;
      case "FTM":
        value = item.fTM;
      case "FTA":
        value = item.fTA;
      case "FG%":
        value = item.fgPct * 100;
      case "3P%":
        value = item.fg3Pct * 100;
      case "FT%":
        value = item.ftPct * 100;
      case "APG": //场均AST
        value = item.aST;
      case "AST":
        value = item.aST;
      case "TPG": //场均TO
        value = item.tOV;
      case "TO":
        value = item.tOV;
      case "RPG":
        value = item.rEB;
      case "REB": //场均RPG
        value = item.rEB;
      case "BPG": //场均blk
        value = item.bLK;
      case "BLK":
        value = item.bLK;
      case "GP":
        value = item.gP;
      case "MIN":
        value = item.mIN;
      case "FOUL":
        value = item.pF;
      case "STL":
        value = item.sTL;
      default:
        value = 0.0;
    }
    return (value * 10).roundToDouble() / 10;
  }

  String getRank(String type, TeamDetailSeasonData item) {
    int value = 0;
    switch (type) {
      case "PPG": //场均PTS
        value = item.ptsRank;
      case "APG": //场均AST
        value = item.astRank;
      case "RPG":
        value = item.rebRank;
      case "BPG": //场均blk
        value = item.blkRank;
      default:
        value = 1;
    }
    // 处理序数词后缀
    String suffix;
    if (value == 1) {
      suffix = "st";
    } else if (value == 2) {
      suffix = "nd";
    } else if (value == 3) {
      suffix = "rd";
    } else {
      suffix = "th";
    }

    return "$value$suffix";
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailRecentPick {
  late int gameId = 0;
  late int gameType = 0;
  late int isGuess = 0;
  late int awayTeamWins = 0;
  late int gameTime = 0;
  late int guessStatus = 0;
  late int homeTeamWins = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late String homeTeamWL = '';
  late String awayTeamWL = '';
  late int homeTeamId = 0;
  late int awayTeamId = 0;
  late int status = 0;

  TeamDetailRecentPick();

  factory TeamDetailRecentPick.fromJson(Map<String, dynamic> json) =>
      $TeamDetailRecentPickFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailRecentPickToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailLast5GameSchedule {
  late List<TeamDetailGameSchedules> schedule = [];
  late List<Last5AvgEntity> scoreAvg = [];
  late List<Last5AvgEntity> totalScore = [];

  TeamDetailLast5GameSchedule();

  factory TeamDetailLast5GameSchedule.fromJson(Map<String, dynamic> json) =>
      $TeamDetailLast5GameScheduleFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailLast5GameScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailLast5GameScheduleSchedule {
  late int gameId = 0;
  late int gameType = 0;
  late int gameTime = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late int homeTeamId = 0;
  late int awayTeamId = 0;
  late int status = 0;

  TeamDetailLast5GameScheduleSchedule();

  factory TeamDetailLast5GameScheduleSchedule.fromJson(
          Map<String, dynamic> json) =>
      $TeamDetailLast5GameScheduleScheduleFromJson(json);

  Map<String, dynamic> toJson() =>
      $TeamDetailLast5GameScheduleScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailLast5GameScheduleScoreAvg {
  late double blk;
  late int gameId = 0;
  late double fga;
  late double ast;
  late double dreb;
  late int starterCount = 0;
  late double stl;
  late double fgm;
  late double pts;
  late double threePa;
  late int playCount = 0;
  late double fta;
  late double min;
  late double oreb;
  late int seasonId = 0;
  late double pf;
  late double threePm;
  late double to;
  late double ftm;
  late int playerId = 0;

  TeamDetailLast5GameScheduleScoreAvg();

  factory TeamDetailLast5GameScheduleScoreAvg.fromJson(
          Map<String, dynamic> json) =>
      $TeamDetailLast5GameScheduleScoreAvgFromJson(json);

  Map<String, dynamic> toJson() =>
      $TeamDetailLast5GameScheduleScoreAvgToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailPreSeasonData {
  @JSONField(name: "PFD_RANK")
  late int pfdRank = 0;
  @JSONField(name: "FG3_PCT")
  late double fg3Pct;
  @JSONField(name: "OREB_RANK")
  late int orebRank = 0;
  @JSONField(name: "STL")
  late double sTL;
  @JSONField(name: "DREB")
  late double dREB;
  @JSONField(name: "FG_PCT_RANK")
  late int fgPctRank = 0;
  @JSONField(name: "PLUS_MINUS_RANK")
  late int plusMinusRank = 0;
  @JSONField(name: "PFD")
  late double pFD;
  @JSONField(name: "PF_RANK")
  late int pfRank = 0;
  @JSONField(name: "DREB_RANK")
  late int drebRank = 0;
  @JSONField(name: "TOV_RANK")
  late int tovRank = 0;
  @JSONField(name: "FGA")
  late double fGA;
  @JSONField(name: "FG3_PCT_RANK")
  late int fg3PctRank = 0;
  @JSONField(name: "BLK_RANK")
  late int blkRank = 0;
  @JSONField(name: "FGM")
  late double fGM;
  @JSONField(name: "L_RANK")
  late int lRank = 0;
  @JSONField(name: "W_PCT")
  late double wPct;
  @JSONField(name: "FG3A_RANK")
  late int fg3aRank = 0;
  @JSONField(name: "FTA")
  late double fTA;
  @JSONField(name: "MIN")
  late double mIN;
  @JSONField(name: "TOV")
  late double tOV;
  @JSONField(name: "FG3M_RANK")
  late int fg3mRank = 0;
  @JSONField(name: "FTM")
  late double fTM;
  @JSONField(name: "TEAM_ID")
  late int teamId = 0;
  @JSONField(name: "BLKA")
  late double bLKA;
  @JSONField(name: "BLK")
  late double bLK;
  @JSONField(name: "PLUS_MINUS")
  late double plusMinus;
  @JSONField(name: "W_RANK")
  late int wRank = 0;
  @JSONField(name: "MIN_RANK")
  late int minRank = 0;
  @JSONField(name: "FG_PCT")
  late double fgPct;
  @JSONField(name: "L")
  late int l = 0;
  @JSONField(name: "PTS")
  late double pTS;
  @JSONField(name: "FG3A")
  late double fG3A;
  @JSONField(name: "FTM_RANK")
  late int ftmRank = 0;
  @JSONField(name: "FTA_RANK")
  late int ftaRank = 0;
  @JSONField(name: "FGA_RANK")
  late int fgaRank = 0;
  @JSONField(name: "REB_RANK")
  late int rebRank = 0;
  @JSONField(name: "BLKA_RANK")
  late int blkaRank = 0;
  @JSONField(name: "W")
  late int w = 0;
  @JSONField(name: "FG3M")
  late double fG3M;
  @JSONField(name: "W_PCT_RANK")
  late int wPctRank = 0;
  @JSONField(name: "AST_RANK")
  late int astRank = 0;
  @JSONField(name: "AST")
  late double aST;
  @JSONField(name: "OREB")
  late double oREB;
  @JSONField(name: "FT_PCT_RANK")
  late int ftPctRank = 0;
  @JSONField(name: "GP")
  late int gP = 0;
  @JSONField(name: "FGM_RANK")
  late int fgmRank = 0;
  @JSONField(name: "REB")
  late double rEB;
  @JSONField(name: "FT_PCT")
  late double ftPct;
  @JSONField(name: "PTS_RANK")
  late int ptsRank = 0;
  @JSONField(name: "TEAM_NAME")
  late String teamName = '';
  @JSONField(name: "PF")
  late double pF;
  @JSONField(name: "GP_RANK")
  late int gpRank = 0;
  @JSONField(name: "STL_RANK")
  late int stlRank = 0;

  TeamDetailPreSeasonData();

  factory TeamDetailPreSeasonData.fromJson(Map<String, dynamic> json) =>
      $TeamDetailPreSeasonDataFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailPreSeasonDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailTotalL5Data {
  late int blk = 0;
  late int gameId = 0;
  late int fga = 0;
  late int ast = 0;
  late int dreb = 0;
  late int espnId = 0;
  late int stl = 0;
  late int fgm = 0;
  late int pts = 0;
  late int reb = 0;
  late int threePa = 0;
  late int fta = 0;
  late int min = 0;
  late int oreb = 0;
  late int pf = 0;
  late int teamId = 0;
  late bool isStarter = false;
  late int threePm = 0;
  late int to = 0;
  late int awayTeamId = 0;
  late int ftm = 0;
  late int playerId = 0;

  TeamDetailTotalL5Data();

  factory TeamDetailTotalL5Data.fromJson(Map<String, dynamic> json) =>
      $TeamDetailTotalL5DataFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailTotalL5DataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailOutcome {
  late int reviewsCount = 0;
  late TeamDetailGameSchedules gameSchedule;

  TeamDetailOutcome();

  factory TeamDetailOutcome.fromJson(Map<String, dynamic> json) =>
      $TeamDetailOutcomeFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailOutcomeToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamDetailOutcomeGameSchedule {
  late int gameId = 0;
  late int gameType = 0;
  late int gameTime = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late int homeTeamId = 0;
  late int awayTeamId = 0;
  late int status = 0;

  TeamDetailOutcomeGameSchedule();

  factory TeamDetailOutcomeGameSchedule.fromJson(Map<String, dynamic> json) =>
      $TeamDetailOutcomeGameScheduleFromJson(json);

  Map<String, dynamic> toJson() => $TeamDetailOutcomeGameScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
