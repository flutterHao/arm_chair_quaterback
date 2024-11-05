import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nab_player_season_game_rank_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nab_player_season_game_rank_entity.g.dart';

@JsonSerializable()
class NabPlayerSeasonGameRankEntity {
  @JSONField(name: "PFD_RANK")
  late int pfdRank;
  @JSONField(name: "FG3_PCT")
  late double fg3Pct;
  @JSONField(name: "OREB_RANK")
  late int orebRank;
  @JSONField(name: "STL")
  late double sTL;
  @JSONField(name: "DREB")
  late double dREB;
  @JSONField(name: "FG_PCT_RANK")
  late int fgPctRank;
  @JSONField(name: "PLUS_MINUS_RANK")
  late int plusMinusRank;
  @JSONField(name: "PFD")
  late double pFD;
  @JSONField(name: "PF_RANK")
  late int pfRank;
  @JSONField(name: "DREB_RANK")
  late int drebRank;
  @JSONField(name: "TOV_RANK")
  late int tovRank;
  @JSONField(name: "FGA")
  late double fGA;
  @JSONField(name: "FG3_PCT_RANK")
  late int fg3PctRank;
  @JSONField(name: "BLK_RANK")
  late int blkRank;
  @JSONField(name: "TEAM_ABBREVIATION")
  late String teamAbbreviation;
  @JSONField(name: "NBA_FANTASY_PTS")
  late double nbaFantasyPts;
  @JSONField(name: "FGM")
  late double fGM;
  @JSONField(name: "L_RANK")
  late int lRank;
  @JSONField(name: "W_PCT")
  late double wPct;
  @JSONField(name: "FG3A_RANK")
  late int fg3aRank;
  @JSONField(name: "NICKNAME")
  late String nICKNAME;
  @JSONField(name: "FTA")
  late double fTA;
  @JSONField(name: "NBA_FANTASY_PTS_RANK")
  late int nbaFantasyPtsRank;
  @JSONField(name: "MIN")
  late double mIN;
  @JSONField(name: "DD2")
  late int dD2;
  @JSONField(name: "DD2_RANK")
  late int dd2Rank;
  @JSONField(name: "PLAYER_ID")
  late int playerId;
  @JSONField(name: "TOV")
  late double tOV;
  @JSONField(name: "FG3M_RANK")
  late int fg3mRank;
  @JSONField(name: "FTM")
  late double fTM;
  @JSONField(name: "TEAM_ID")
  late int teamId;
  @JSONField(name: "BLKA")
  late double bLKA;
  @JSONField(name: "BLK")
  late double bLK;
  @JSONField(name: "PLUS_MINUS")
  late double plusMinus;
  @JSONField(name: "TD3")
  late int tD3;
  @JSONField(name: "W_RANK")
  late int wRank;
  @JSONField(name: "MIN_RANK")
  late int minRank;
  @JSONField(name: "FG_PCT")
  late double fgPct;
  @JSONField(name: "L")
  late int l;
  @JSONField(name: "WNBA_FANTASY_PTS")
  late double wnbaFantasyPts;
  @JSONField(name: "PTS")
  late double pTS;
  @JSONField(name: "FG3A")
  late double fG3A;
  @JSONField(name: "FTM_RANK")
  late int ftmRank;
  @JSONField(name: "FTA_RANK")
  late int ftaRank;
  @JSONField(name: "FGA_RANK")
  late int fgaRank;
  @JSONField(name: "REB_RANK")
  late int rebRank;
  @JSONField(name: "BLKA_RANK")
  late int blkaRank;
  @JSONField(name: "W")
  late int w;
  @JSONField(name: "TD3_RANK")
  late int td3Rank;
  @JSONField(name: "FG3M")
  late double fG3M;
  @JSONField(name: "AGE")
  late double aGE;
  @JSONField(name: "W_PCT_RANK")
  late int wPctRank;
  @JSONField(name: "AST_RANK")
  late int astRank;
  @JSONField(name: "PLAYER_NAME")
  late String playerName;
  @JSONField(name: "AST")
  late double aST;
  @JSONField(name: "OREB")
  late double oREB;
  @JSONField(name: "FT_PCT_RANK")
  late int ftPctRank;
  @JSONField(name: "GP")
  late int gP;
  @JSONField(name: "FGM_RANK")
  late int fgmRank;
  @JSONField(name: "REB")
  late double rEB;
  @JSONField(name: "FT_PCT")
  late double ftPct;
  @JSONField(name: "WNBA_FANTASY_PTS_RANK")
  late int wnbaFantasyPtsRank;
  @JSONField(name: "PTS_RANK")
  late int ptsRank;
  @JSONField(name: "PF")
  late double pF;
  @JSONField(name: "GP_RANK")
  late int gpRank;
  @JSONField(name: "STL_RANK")
  late int stlRank;

  NabPlayerSeasonGameRankEntity();

  factory NabPlayerSeasonGameRankEntity.fromJson(Map<String, dynamic> json) =>
      $NabPlayerSeasonGameRankEntityFromJson(json);

  Map<String, dynamic> toJson() => $NabPlayerSeasonGameRankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
