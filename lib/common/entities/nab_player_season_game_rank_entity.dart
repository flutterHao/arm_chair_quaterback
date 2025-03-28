import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nab_player_season_game_rank_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nab_player_season_game_rank_entity.g.dart';

@JsonSerializable()
class NabPlayerSeasonGameRankEntity {
  @JSONField(name: "PFD_RANK")
   int? pfdRank;
  @JSONField(name: "FG3_PCT")
   double? fg3Pct;
  @JSONField(name: "OREB_RANK")
   int? orebRank;
  @JSONField(name: "STL")
   double? sTL;
  @JSONField(name: "DREB")
   double? dREB;
  @JSONField(name: "FG_PCT_RANK")
   int? fgPctRank;
  @JSONField(name: "PLUS_MINUS_RANK")
   int? plusMinusRank;
  @JSONField(name: "PFD")
   double? pFD;
  @JSONField(name: "PF_RANK")
   int? pfRank;
  @JSONField(name: "DREB_RANK")
   int? drebRank;
  @JSONField(name: "TOV_RANK")
   int? tovRank;
  @JSONField(name: "FGA")
   double? fGA;
  @JSONField(name: "FG3_PCT_RANK")
   int? fg3PctRank;
  @JSONField(name: "BLK_RANK")
   int? blkRank;
  @JSONField(name: "TEAM_ABBREVIATION")
   String? teamAbbreviation;
  @JSONField(name: "NBA_FANTASY_PTS")
   double? nbaFantasyPts;
  @JSONField(name: "FGM")
   double? fGM;
  @JSONField(name: "L_RANK")
   int? lRank;
  @JSONField(name: "W_PCT")
   double? wPct;
  @JSONField(name: "FG3A_RANK")
   int? fg3aRank;
  @JSONField(name: "NICKNAME")
   String? nICKNAME;
  @JSONField(name: "FTA")
   double? fTA;
  @JSONField(name: "NBA_FANTASY_PTS_RANK")
   int? nbaFantasyPtsRank;
  @JSONField(name: "MIN")
   double? mIN;
  @JSONField(name: "DD2")
   int? dD2;
  @JSONField(name: "DD2_RANK")
   int? dd2Rank;
  @JSONField(name: "PLAYER_ID")
   int? playerId;
  @JSONField(name: "TOV")
   double? tOV;
  @JSONField(name: "FG3M_RANK")
   int? fg3mRank;
  @JSONField(name: "FTM")
   double? fTM;
  @JSONField(name: "TEAM_ID")
   int? teamId;
  @JSONField(name: "BLKA")
   double? bLKA;
  @JSONField(name: "BLK")
   double? bLK;
  @JSONField(name: "PLUS_MINUS")
   double? plusMinus;
  @JSONField(name: "TD3")
   int? tD3;
  @JSONField(name: "W_RANK")
   int? wRank;
  @JSONField(name: "MIN_RANK")
   int? minRank;
  @JSONField(name: "FG_PCT")
   double? fgPct;
  @JSONField(name: "L")
   int? l;
  @JSONField(name: "WNBA_FANTASY_PTS")
   double? wnbaFantasyPts;
  @JSONField(name: "PTS")
   double? pTS;
  @JSONField(name: "FG3A")
   double? fG3A;
  @JSONField(name: "FTM_RANK")
   int? ftmRank;
  @JSONField(name: "FTA_RANK")
   int? ftaRank;
  @JSONField(name: "FGA_RANK")
   int? fgaRank;
  @JSONField(name: "REB_RANK")
   int? rebRank;
  @JSONField(name: "BLKA_RANK")
   int? blkaRank;
  @JSONField(name: "W")
   int? w;
  @JSONField(name: "TD3_RANK")
   int? td3Rank;
  @JSONField(name: "FG3M")
   double? fG3M;
  @JSONField(name: "AGE")
   double? aGE;
  @JSONField(name: "W_PCT_RANK")
   int? wPctRank;
  @JSONField(name: "AST_RANK")
   int? astRank;
  @JSONField(name: "PLAYER_NAME")
   String? playerName;
  @JSONField(name: "AST")
   double? aST;
  @JSONField(name: "OREB")
   double? oREB;
  @JSONField(name: "FT_PCT_RANK")
   int? ftPctRank;
  @JSONField(name: "GP")
   int? gP;
  @JSONField(name: "FGM_RANK")
   int? fgmRank;
  @JSONField(name: "REB")
   double? rEB;
  @JSONField(name: "FT_PCT")
   double? ftPct;
  @JSONField(name: "WNBA_FANTASY_PTS_RANK")
   int? wnbaFantasyPtsRank;
  @JSONField(name: "PTS_RANK")
   int? ptsRank;
  @JSONField(name: "PF")
   double? pF;
  @JSONField(name: "GP_RANK")
   int? gpRank;
  @JSONField(name: "STL_RANK")
   int? stlRank;

  NabPlayerSeasonGameRankEntity();

  factory NabPlayerSeasonGameRankEntity.fromJson(Map<String, dynamic> json) =>
      $NabPlayerSeasonGameRankEntityFromJson(json);

  Map<String, dynamic> toJson() => $NabPlayerSeasonGameRankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
