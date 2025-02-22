import 'dart:convert';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/o_v_r_rank_player_info_entity.g.dart';

export 'package:arm_chair_quaterback/generated/json/o_v_r_rank_player_info_entity.g.dart';

@JsonSerializable()
class OVRRankPlayerInfoEntity {
  @JSONField(name: 'OVRTrend')
  late List<OVRRankPlayerInfoOVRTrend> oVRTrend = [];
  late OVRRankPlayerInfoSeasonStats seasonStats;
  late List<OVRRankPlayerInfoGameStats> gameStats = [];

  OVRRankPlayerInfoEntity();

  factory OVRRankPlayerInfoEntity.fromJson(Map<String, dynamic> json) => $OVRRankPlayerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $OVRRankPlayerInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OVRRankPlayerInfoOVRTrend {
  late int playerMarketPrice = 0;
  late int createTime = 0;
  late int playerScore = 0;
  late int updateTime = 0;
  late int playerStrength = 0;
  late int playerId = 0;

  OVRRankPlayerInfoOVRTrend();

  factory OVRRankPlayerInfoOVRTrend.fromJson(Map<String, dynamic> json) => $OVRRankPlayerInfoOVRTrendFromJson(json);

  Map<String, dynamic> toJson() => $OVRRankPlayerInfoOVRTrendToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OVRRankPlayerInfoSeasonStats {
  @JSONField(name: 'PFD_RANK')
  late int pfdRank = 0;
  @JSONField(name: 'FG3_PCT')
  late double fg3Pct = 0.0;
  @JSONField(name: 'OREB_RANK')
  late int orebRank = 0;
  @JSONField(name: 'STL')
  late double sTL = 0.0;
  @JSONField(name: 'DREB')
  late double dREB = 0.0;
  @JSONField(name: 'FG_PCT_RANK')
  late int fgPctRank = 0;
  @JSONField(name: 'PLUS_MINUS_RANK')
  late int plusMinusRank = 0;
  @JSONField(name: 'PFD')
  late double pFD = 0.0;
  @JSONField(name: 'PF_RANK')
  late int pfRank = 0;
  @JSONField(name: 'DREB_RANK')
  late int drebRank = 0;
  @JSONField(name: 'TOV_RANK')
  late int tovRank = 0;
  @JSONField(name: 'FGA')
  late double fGA = 0.0;
  @JSONField(name: 'FG3_PCT_RANK')
  late int fg3PctRank = 0;
  @JSONField(name: 'BLK_RANK')
  late int blkRank = 0;
  @JSONField(name: 'TEAM_ABBREVIATION')
  late String teamAbbreviation = '';
  @JSONField(name: 'NBA_FANTASY_PTS')
  late double nbaFantasyPts = 0.0;
  @JSONField(name: 'FGM')
  late double fGM = 0.0;
  @JSONField(name: 'L_RANK')
  late int lRank = 0;
  @JSONField(name: 'W_PCT')
  late double wPct = 0.0;
  @JSONField(name: 'FG3A_RANK')
  late int fg3aRank = 0;
  @JSONField(name: 'NICKNAME')
  late String nICKNAME = '';
  @JSONField(name: 'FTA')
  late double fTA = 0.0;
  @JSONField(name: 'NBA_FANTASY_PTS_RANK')
  late int nbaFantasyPtsRank = 0;
  @JSONField(name: 'MIN')
  late double mIN = 0.0;
  @JSONField(name: 'DD2')
  late int dD2 = 0;
  @JSONField(name: 'DD2_RANK')
  late int dd2Rank = 0;
  @JSONField(name: 'PLAYER_ID')
  late int playerId = 0;
  @JSONField(name: 'TOV')
  late double tOV = 0.0;
  @JSONField(name: 'FG3M_RANK')
  late int fg3mRank = 0;
  @JSONField(name: 'FTM')
  late double fTM = 0.0;
  @JSONField(name: 'TEAM_ID')
  late int teamId = 0;
  @JSONField(name: 'BLKA')
  late double bLKA = 0.0;
  @JSONField(name: 'BLK')
  late double bLK = 0.0;
  @JSONField(name: 'PLUS_MINUS')
  late double plusMinus = 0.0;
  @JSONField(name: 'TD3')
  late int tD3 = 0;
  @JSONField(name: 'W_RANK')
  late int wRank = 0;
  @JSONField(name: 'MIN_RANK')
  late int minRank = 0;
  @JSONField(name: 'FG_PCT')
  late double fgPct = 0.0;
  @JSONField(name: 'L')
  late int l = 0;
  @JSONField(name: 'WNBA_FANTASY_PTS')
  late double wnbaFantasyPts = 0.0;
  @JSONField(name: 'PTS')
  late double pTS = 0.0;
  @JSONField(name: 'FG3A')
  late double fG3A = 0.0;
  @JSONField(name: 'FTM_RANK')
  late int ftmRank = 0;
  @JSONField(name: 'FTA_RANK')
  late int ftaRank = 0;
  @JSONField(name: 'FGA_RANK')
  late int fgaRank = 0;
  @JSONField(name: 'REB_RANK')
  late int rebRank = 0;
  @JSONField(name: 'BLKA_RANK')
  late int blkaRank = 0;
  @JSONField(name: 'W')
  late int w = 0;
  @JSONField(name: 'TD3_RANK')
  late int td3Rank = 0;
  @JSONField(name: 'FG3M')
  late double fG3M = 0;
  @JSONField(name: 'AGE')
  late double aGE = 0;
  @JSONField(name: 'W_PCT_RANK')
  late int wPctRank = 0;
  @JSONField(name: 'AST_RANK')
  late int astRank = 0;
  @JSONField(name: 'PLAYER_NAME')
  late String playerName = '';
  @JSONField(name: 'AST')
  late double aST = 0.0;
  @JSONField(name: 'OREB')
  late double oREB = 0.0;
  @JSONField(name: 'FT_PCT_RANK')
  late int ftPctRank = 0;
  @JSONField(name: 'GP')
  late int gP = 0;
  @JSONField(name: 'FGM_RANK')
  late int fgmRank = 0;
  @JSONField(name: 'REB')
  late double rEB = 0.0;
  @JSONField(name: 'FT_PCT')
  late double ftPct = 0.0;
  @JSONField(name: 'WNBA_FANTASY_PTS_RANK')
  late int wnbaFantasyPtsRank = 0;
  @JSONField(name: 'PTS_RANK')
  late int ptsRank = 0;
  @JSONField(name: 'PF')
  late double pF = 0.0;
  @JSONField(name: 'GP_RANK')
  late int gpRank = 0;
  @JSONField(name: 'STL_RANK')
  late int stlRank = 0;

  OVRRankPlayerInfoSeasonStats();

  factory OVRRankPlayerInfoSeasonStats.fromJson(Map<String, dynamic> json) =>
      $OVRRankPlayerInfoSeasonStatsFromJson(json);

  Map<String, dynamic> toJson() => $OVRRankPlayerInfoSeasonStatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OVRRankPlayerInfoGameStats {
  late int afterPower = 0;
  late OVRRankPlayerInfoGameStatsSchedule schedule;
  @JSONField(name: 'OVR')
  late int oVR = 0;
  late int afterOVR = 0;
  late int power = 0;

  OVRRankPlayerInfoGameStats();

  factory OVRRankPlayerInfoGameStats.fromJson(Map<String, dynamic> json) => $OVRRankPlayerInfoGameStatsFromJson(json);

  Map<String, dynamic> toJson() => $OVRRankPlayerInfoGameStatsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class OVRRankPlayerInfoGameStatsSchedule {
  late int gameId = 0;
  late int gameType = 0;
  late int gameTime = 0;
  late int createTime = 0;
  late int gameStartTime = 0;
  late int homeTeamScore = 0;
  late int seasonId = 0;
  late int awayTeamScore = 0;
  late int updateTime = 0;
  late int homeTeamId = 0;
  late int awayTeamId = 0;
  late int status = 0;

  OVRRankPlayerInfoGameStatsSchedule();

  factory OVRRankPlayerInfoGameStatsSchedule.fromJson(Map<String, dynamic> json) =>
      $OVRRankPlayerInfoGameStatsScheduleFromJson(json);

  Map<String, dynamic> toJson() => $OVRRankPlayerInfoGameStatsScheduleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
