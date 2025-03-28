import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_player_stat_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_player_stat_entity.g.dart';

@JsonSerializable()
class NbaPlayerStatEntity {
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
  @JSONField(name: "TEAM_ABBREVIATION")
  late String teamAbbreviation = '';
  @JSONField(name: "NBA_FANTASY_PTS")
  late double nbaFantasyPts;
  @JSONField(name: "FGM")
  late double fGM;
  @JSONField(name: "L_RANK")
  late int lRank = 0;
  @JSONField(name: "W_PCT")
  late double wPct;
  @JSONField(name: "FG3A_RANK")
  late int fg3aRank = 0;
  @JSONField(name: "NICKNAME")
  late String nICKNAME = '';
  @JSONField(name: "FTA")
  late double fTA;
  @JSONField(name: "NBA_FANTASY_PTS_RANK")
  late int nbaFantasyPtsRank = 0;
  @JSONField(name: "MIN")
  late double mIN;
  @JSONField(name: "DD2")
  late int dD2 = 0;
  @JSONField(name: "DD2_RANK")
  late int dd2Rank = 0;
  @JSONField(name: "PLAYER_ID")
  late int playerId = 0;
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
  @JSONField(name: "TD3")
  late int tD3 = 0;
  @JSONField(name: "W_RANK")
  late int wRank = 0;
  @JSONField(name: "MIN_RANK")
  late int minRank = 0;
  @JSONField(name: "FG_PCT")
  late double fgPct;
  @JSONField(name: "L")
  late int l = 0;
  @JSONField(name: "WNBA_FANTASY_PTS")
  late double wnbaFantasyPts;
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
  @JSONField(name: "TD3_RANK")
  late int td3Rank = 0;
  @JSONField(name: "FG3M")
  late double fG3M;
  @JSONField(name: "AGE")
  late double aGE;
  @JSONField(name: "W_PCT_RANK")
  late int wPctRank = 0;
  @JSONField(name: "AST_RANK")
  late int astRank = 0;
  @JSONField(name: "PLAYER_NAME")
  late String playerName = '';
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
  @JSONField(name: "WNBA_FANTASY_PTS_RANK")
  late int wnbaFantasyPtsRank = 0;
  @JSONField(name: "PTS_RANK")
  late int ptsRank = 0;
  @JSONField(name: "PF")
  late double pF;
  @JSONField(name: "GP_RANK")
  late int gpRank = 0;
  @JSONField(name: "STL_RANK")
  late int stlRank = 0;

  NbaPlayerStatEntity();

  factory NbaPlayerStatEntity.fromJson(Map<String, dynamic> json) =>
      $NbaPlayerStatEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaPlayerStatEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
