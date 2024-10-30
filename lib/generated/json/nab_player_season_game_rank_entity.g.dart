import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';

NabPlayerSeasonGameRankEntity $NabPlayerSeasonGameRankEntityFromJson(
    Map<String, dynamic> json) {
  final NabPlayerSeasonGameRankEntity nabPlayerSeasonGameRankEntity = NabPlayerSeasonGameRankEntity();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    nabPlayerSeasonGameRankEntity.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    nabPlayerSeasonGameRankEntity.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    nabPlayerSeasonGameRankEntity.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    nabPlayerSeasonGameRankEntity.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    nabPlayerSeasonGameRankEntity.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    nabPlayerSeasonGameRankEntity.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    nabPlayerSeasonGameRankEntity.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    nabPlayerSeasonGameRankEntity.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    nabPlayerSeasonGameRankEntity.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    nabPlayerSeasonGameRankEntity.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    nabPlayerSeasonGameRankEntity.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    nabPlayerSeasonGameRankEntity.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    nabPlayerSeasonGameRankEntity.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    nabPlayerSeasonGameRankEntity.blkRank = blkRank;
  }
  final String? teamAbbreviation = jsonConvert.convert<String>(
      json['TEAM_ABBREVIATION']);
  if (teamAbbreviation != null) {
    nabPlayerSeasonGameRankEntity.teamAbbreviation = teamAbbreviation;
  }
  final double? nbaFantasyPts = jsonConvert.convert<double>(
      json['NBA_FANTASY_PTS']);
  if (nbaFantasyPts != null) {
    nabPlayerSeasonGameRankEntity.nbaFantasyPts = nbaFantasyPts;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    nabPlayerSeasonGameRankEntity.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    nabPlayerSeasonGameRankEntity.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    nabPlayerSeasonGameRankEntity.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    nabPlayerSeasonGameRankEntity.fg3aRank = fg3aRank;
  }
  final String? nICKNAME = jsonConvert.convert<String>(json['NICKNAME']);
  if (nICKNAME != null) {
    nabPlayerSeasonGameRankEntity.nICKNAME = nICKNAME;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    nabPlayerSeasonGameRankEntity.fTA = fTA;
  }
  final int? nbaFantasyPtsRank = jsonConvert.convert<int>(
      json['NBA_FANTASY_PTS_RANK']);
  if (nbaFantasyPtsRank != null) {
    nabPlayerSeasonGameRankEntity.nbaFantasyPtsRank = nbaFantasyPtsRank;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    nabPlayerSeasonGameRankEntity.mIN = mIN;
  }
  final int? dD2 = jsonConvert.convert<int>(json['DD2']);
  if (dD2 != null) {
    nabPlayerSeasonGameRankEntity.dD2 = dD2;
  }
  final int? dd2Rank = jsonConvert.convert<int>(json['DD2_RANK']);
  if (dd2Rank != null) {
    nabPlayerSeasonGameRankEntity.dd2Rank = dd2Rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    nabPlayerSeasonGameRankEntity.playerId = playerId;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    nabPlayerSeasonGameRankEntity.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    nabPlayerSeasonGameRankEntity.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    nabPlayerSeasonGameRankEntity.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    nabPlayerSeasonGameRankEntity.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    nabPlayerSeasonGameRankEntity.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    nabPlayerSeasonGameRankEntity.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    nabPlayerSeasonGameRankEntity.plusMinus = plusMinus;
  }
  final int? tD3 = jsonConvert.convert<int>(json['TD3']);
  if (tD3 != null) {
    nabPlayerSeasonGameRankEntity.tD3 = tD3;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    nabPlayerSeasonGameRankEntity.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    nabPlayerSeasonGameRankEntity.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    nabPlayerSeasonGameRankEntity.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    nabPlayerSeasonGameRankEntity.l = l;
  }
  final double? wnbaFantasyPts = jsonConvert.convert<double>(
      json['WNBA_FANTASY_PTS']);
  if (wnbaFantasyPts != null) {
    nabPlayerSeasonGameRankEntity.wnbaFantasyPts = wnbaFantasyPts;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    nabPlayerSeasonGameRankEntity.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    nabPlayerSeasonGameRankEntity.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    nabPlayerSeasonGameRankEntity.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    nabPlayerSeasonGameRankEntity.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    nabPlayerSeasonGameRankEntity.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    nabPlayerSeasonGameRankEntity.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    nabPlayerSeasonGameRankEntity.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    nabPlayerSeasonGameRankEntity.w = w;
  }
  final int? td3Rank = jsonConvert.convert<int>(json['TD3_RANK']);
  if (td3Rank != null) {
    nabPlayerSeasonGameRankEntity.td3Rank = td3Rank;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    nabPlayerSeasonGameRankEntity.fG3M = fG3M;
  }
  final double? aGE = jsonConvert.convert<double>(json['AGE']);
  if (aGE != null) {
    nabPlayerSeasonGameRankEntity.aGE = aGE;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    nabPlayerSeasonGameRankEntity.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    nabPlayerSeasonGameRankEntity.astRank = astRank;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    nabPlayerSeasonGameRankEntity.playerName = playerName;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    nabPlayerSeasonGameRankEntity.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    nabPlayerSeasonGameRankEntity.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    nabPlayerSeasonGameRankEntity.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    nabPlayerSeasonGameRankEntity.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    nabPlayerSeasonGameRankEntity.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    nabPlayerSeasonGameRankEntity.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    nabPlayerSeasonGameRankEntity.ftPct = ftPct;
  }
  final int? wnbaFantasyPtsRank = jsonConvert.convert<int>(
      json['WNBA_FANTASY_PTS_RANK']);
  if (wnbaFantasyPtsRank != null) {
    nabPlayerSeasonGameRankEntity.wnbaFantasyPtsRank = wnbaFantasyPtsRank;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    nabPlayerSeasonGameRankEntity.ptsRank = ptsRank;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    nabPlayerSeasonGameRankEntity.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    nabPlayerSeasonGameRankEntity.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    nabPlayerSeasonGameRankEntity.stlRank = stlRank;
  }
  return nabPlayerSeasonGameRankEntity;
}

Map<String, dynamic> $NabPlayerSeasonGameRankEntityToJson(
    NabPlayerSeasonGameRankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['PFD_RANK'] = entity.pfdRank;
  data['FG3_PCT'] = entity.fg3Pct;
  data['OREB_RANK'] = entity.orebRank;
  data['STL'] = entity.sTL;
  data['DREB'] = entity.dREB;
  data['FG_PCT_RANK'] = entity.fgPctRank;
  data['PLUS_MINUS_RANK'] = entity.plusMinusRank;
  data['PFD'] = entity.pFD;
  data['PF_RANK'] = entity.pfRank;
  data['DREB_RANK'] = entity.drebRank;
  data['TOV_RANK'] = entity.tovRank;
  data['FGA'] = entity.fGA;
  data['FG3_PCT_RANK'] = entity.fg3PctRank;
  data['BLK_RANK'] = entity.blkRank;
  data['TEAM_ABBREVIATION'] = entity.teamAbbreviation;
  data['NBA_FANTASY_PTS'] = entity.nbaFantasyPts;
  data['FGM'] = entity.fGM;
  data['L_RANK'] = entity.lRank;
  data['W_PCT'] = entity.wPct;
  data['FG3A_RANK'] = entity.fg3aRank;
  data['NICKNAME'] = entity.nICKNAME;
  data['FTA'] = entity.fTA;
  data['NBA_FANTASY_PTS_RANK'] = entity.nbaFantasyPtsRank;
  data['MIN'] = entity.mIN;
  data['DD2'] = entity.dD2;
  data['DD2_RANK'] = entity.dd2Rank;
  data['PLAYER_ID'] = entity.playerId;
  data['TOV'] = entity.tOV;
  data['FG3M_RANK'] = entity.fg3mRank;
  data['FTM'] = entity.fTM;
  data['TEAM_ID'] = entity.teamId;
  data['BLKA'] = entity.bLKA;
  data['BLK'] = entity.bLK;
  data['PLUS_MINUS'] = entity.plusMinus;
  data['TD3'] = entity.tD3;
  data['W_RANK'] = entity.wRank;
  data['MIN_RANK'] = entity.minRank;
  data['FG_PCT'] = entity.fgPct;
  data['L'] = entity.l;
  data['WNBA_FANTASY_PTS'] = entity.wnbaFantasyPts;
  data['PTS'] = entity.pTS;
  data['FG3A'] = entity.fG3A;
  data['FTM_RANK'] = entity.ftmRank;
  data['FTA_RANK'] = entity.ftaRank;
  data['FGA_RANK'] = entity.fgaRank;
  data['REB_RANK'] = entity.rebRank;
  data['BLKA_RANK'] = entity.blkaRank;
  data['W'] = entity.w;
  data['TD3_RANK'] = entity.td3Rank;
  data['FG3M'] = entity.fG3M;
  data['AGE'] = entity.aGE;
  data['W_PCT_RANK'] = entity.wPctRank;
  data['AST_RANK'] = entity.astRank;
  data['PLAYER_NAME'] = entity.playerName;
  data['AST'] = entity.aST;
  data['OREB'] = entity.oREB;
  data['FT_PCT_RANK'] = entity.ftPctRank;
  data['GP'] = entity.gP;
  data['FGM_RANK'] = entity.fgmRank;
  data['REB'] = entity.rEB;
  data['FT_PCT'] = entity.ftPct;
  data['WNBA_FANTASY_PTS_RANK'] = entity.wnbaFantasyPtsRank;
  data['PTS_RANK'] = entity.ptsRank;
  data['PF'] = entity.pF;
  data['GP_RANK'] = entity.gpRank;
  data['STL_RANK'] = entity.stlRank;
  return data;
}

extension NabPlayerSeasonGameRankEntityExtension on NabPlayerSeasonGameRankEntity {
  NabPlayerSeasonGameRankEntity copyWith({
    int? pfdRank,
    double? fg3Pct,
    int? orebRank,
    double? sTL,
    double? dREB,
    int? fgPctRank,
    int? plusMinusRank,
    double? pFD,
    int? pfRank,
    int? drebRank,
    int? tovRank,
    double? fGA,
    int? fg3PctRank,
    int? blkRank,
    String? teamAbbreviation,
    double? nbaFantasyPts,
    double? fGM,
    int? lRank,
    double? wPct,
    int? fg3aRank,
    String? nICKNAME,
    double? fTA,
    int? nbaFantasyPtsRank,
    double? mIN,
    int? dD2,
    int? dd2Rank,
    int? playerId,
    double? tOV,
    int? fg3mRank,
    double? fTM,
    int? teamId,
    double? bLKA,
    double? bLK,
    double? plusMinus,
    int? tD3,
    int? wRank,
    int? minRank,
    double? fgPct,
    int? l,
    double? wnbaFantasyPts,
    double? pTS,
    double? fG3A,
    int? ftmRank,
    int? ftaRank,
    int? fgaRank,
    int? rebRank,
    int? blkaRank,
    int? w,
    int? td3Rank,
    double? fG3M,
    double? aGE,
    int? wPctRank,
    int? astRank,
    String? playerName,
    double? aST,
    double? oREB,
    int? ftPctRank,
    int? gP,
    int? fgmRank,
    double? rEB,
    double? ftPct,
    int? wnbaFantasyPtsRank,
    int? ptsRank,
    double? pF,
    int? gpRank,
    int? stlRank,
  }) {
    return NabPlayerSeasonGameRankEntity()
      ..pfdRank = pfdRank ?? this.pfdRank
      ..fg3Pct = fg3Pct ?? this.fg3Pct
      ..orebRank = orebRank ?? this.orebRank
      ..sTL = sTL ?? this.sTL
      ..dREB = dREB ?? this.dREB
      ..fgPctRank = fgPctRank ?? this.fgPctRank
      ..plusMinusRank = plusMinusRank ?? this.plusMinusRank
      ..pFD = pFD ?? this.pFD
      ..pfRank = pfRank ?? this.pfRank
      ..drebRank = drebRank ?? this.drebRank
      ..tovRank = tovRank ?? this.tovRank
      ..fGA = fGA ?? this.fGA
      ..fg3PctRank = fg3PctRank ?? this.fg3PctRank
      ..blkRank = blkRank ?? this.blkRank
      ..teamAbbreviation = teamAbbreviation ?? this.teamAbbreviation
      ..nbaFantasyPts = nbaFantasyPts ?? this.nbaFantasyPts
      ..fGM = fGM ?? this.fGM
      ..lRank = lRank ?? this.lRank
      ..wPct = wPct ?? this.wPct
      ..fg3aRank = fg3aRank ?? this.fg3aRank
      ..nICKNAME = nICKNAME ?? this.nICKNAME
      ..fTA = fTA ?? this.fTA
      ..nbaFantasyPtsRank = nbaFantasyPtsRank ?? this.nbaFantasyPtsRank
      ..mIN = mIN ?? this.mIN
      ..dD2 = dD2 ?? this.dD2
      ..dd2Rank = dd2Rank ?? this.dd2Rank
      ..playerId = playerId ?? this.playerId
      ..tOV = tOV ?? this.tOV
      ..fg3mRank = fg3mRank ?? this.fg3mRank
      ..fTM = fTM ?? this.fTM
      ..teamId = teamId ?? this.teamId
      ..bLKA = bLKA ?? this.bLKA
      ..bLK = bLK ?? this.bLK
      ..plusMinus = plusMinus ?? this.plusMinus
      ..tD3 = tD3 ?? this.tD3
      ..wRank = wRank ?? this.wRank
      ..minRank = minRank ?? this.minRank
      ..fgPct = fgPct ?? this.fgPct
      ..l = l ?? this.l
      ..wnbaFantasyPts = wnbaFantasyPts ?? this.wnbaFantasyPts
      ..pTS = pTS ?? this.pTS
      ..fG3A = fG3A ?? this.fG3A
      ..ftmRank = ftmRank ?? this.ftmRank
      ..ftaRank = ftaRank ?? this.ftaRank
      ..fgaRank = fgaRank ?? this.fgaRank
      ..rebRank = rebRank ?? this.rebRank
      ..blkaRank = blkaRank ?? this.blkaRank
      ..w = w ?? this.w
      ..td3Rank = td3Rank ?? this.td3Rank
      ..fG3M = fG3M ?? this.fG3M
      ..aGE = aGE ?? this.aGE
      ..wPctRank = wPctRank ?? this.wPctRank
      ..astRank = astRank ?? this.astRank
      ..playerName = playerName ?? this.playerName
      ..aST = aST ?? this.aST
      ..oREB = oREB ?? this.oREB
      ..ftPctRank = ftPctRank ?? this.ftPctRank
      ..gP = gP ?? this.gP
      ..fgmRank = fgmRank ?? this.fgmRank
      ..rEB = rEB ?? this.rEB
      ..ftPct = ftPct ?? this.ftPct
      ..wnbaFantasyPtsRank = wnbaFantasyPtsRank ?? this.wnbaFantasyPtsRank
      ..ptsRank = ptsRank ?? this.ptsRank
      ..pF = pF ?? this.pF
      ..gpRank = gpRank ?? this.gpRank
      ..stlRank = stlRank ?? this.stlRank;
  }
}