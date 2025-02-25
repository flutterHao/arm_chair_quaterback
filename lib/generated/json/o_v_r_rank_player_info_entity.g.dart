import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/o_v_r_rank_player_info_entity.dart';

OVRRankPlayerInfoEntity $OVRRankPlayerInfoEntityFromJson(
    Map<String, dynamic> json) {
  final OVRRankPlayerInfoEntity oVRRankPlayerInfoEntity = OVRRankPlayerInfoEntity();
  final List<OVRRankPlayerInfoOVRTrend>? oVRTrend = (json['OVRTrend'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OVRRankPlayerInfoOVRTrend>(
          e) as OVRRankPlayerInfoOVRTrend).toList();
  if (oVRTrend != null) {
    oVRRankPlayerInfoEntity.oVRTrend = oVRTrend;
  }
  final OVRRankPlayerInfoSeasonStats? seasonStats = jsonConvert.convert<
      OVRRankPlayerInfoSeasonStats>(json['seasonStats']);
  if (seasonStats != null) {
    oVRRankPlayerInfoEntity.seasonStats = seasonStats;
  }
  final List<
      OVRRankPlayerInfoGameStats>? gameStats = (json['gameStats'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<OVRRankPlayerInfoGameStats>(
          e) as OVRRankPlayerInfoGameStats).toList();
  if (gameStats != null) {
    oVRRankPlayerInfoEntity.gameStats = gameStats;
  }
  return oVRRankPlayerInfoEntity;
}

Map<String, dynamic> $OVRRankPlayerInfoEntityToJson(
    OVRRankPlayerInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['OVRTrend'] = entity.oVRTrend.map((v) => v.toJson()).toList();
  data['seasonStats'] = entity.seasonStats.toJson();
  data['gameStats'] = entity.gameStats.map((v) => v.toJson()).toList();
  return data;
}

extension OVRRankPlayerInfoEntityExtension on OVRRankPlayerInfoEntity {
  OVRRankPlayerInfoEntity copyWith({
    List<OVRRankPlayerInfoOVRTrend>? oVRTrend,
    OVRRankPlayerInfoSeasonStats? seasonStats,
    List<OVRRankPlayerInfoGameStats>? gameStats,
  }) {
    return OVRRankPlayerInfoEntity()
      ..oVRTrend = oVRTrend ?? this.oVRTrend
      ..seasonStats = seasonStats ?? this.seasonStats
      ..gameStats = gameStats ?? this.gameStats;
  }
}

OVRRankPlayerInfoOVRTrend $OVRRankPlayerInfoOVRTrendFromJson(
    Map<String, dynamic> json) {
  final OVRRankPlayerInfoOVRTrend oVRRankPlayerInfoOVRTrend = OVRRankPlayerInfoOVRTrend();
  final int? playerMarketPrice = jsonConvert.convert<int>(
      json['playerMarketPrice']);
  if (playerMarketPrice != null) {
    oVRRankPlayerInfoOVRTrend.playerMarketPrice = playerMarketPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    oVRRankPlayerInfoOVRTrend.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    oVRRankPlayerInfoOVRTrend.playerScore = playerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    oVRRankPlayerInfoOVRTrend.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    oVRRankPlayerInfoOVRTrend.playerStrength = playerStrength;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    oVRRankPlayerInfoOVRTrend.playerId = playerId;
  }
  return oVRRankPlayerInfoOVRTrend;
}

Map<String, dynamic> $OVRRankPlayerInfoOVRTrendToJson(
    OVRRankPlayerInfoOVRTrend entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerMarketPrice'] = entity.playerMarketPrice;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['playerId'] = entity.playerId;
  return data;
}

extension OVRRankPlayerInfoOVRTrendExtension on OVRRankPlayerInfoOVRTrend {
  OVRRankPlayerInfoOVRTrend copyWith({
    int? playerMarketPrice,
    int? createTime,
    int? playerScore,
    int? updateTime,
    int? playerStrength,
    int? playerId,
  }) {
    return OVRRankPlayerInfoOVRTrend()
      ..playerMarketPrice = playerMarketPrice ?? this.playerMarketPrice
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..playerId = playerId ?? this.playerId;
  }
}

OVRRankPlayerInfoSeasonStats $OVRRankPlayerInfoSeasonStatsFromJson(
    Map<String, dynamic> json) {
  final OVRRankPlayerInfoSeasonStats oVRRankPlayerInfoSeasonStats = OVRRankPlayerInfoSeasonStats();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    oVRRankPlayerInfoSeasonStats.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    oVRRankPlayerInfoSeasonStats.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    oVRRankPlayerInfoSeasonStats.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    oVRRankPlayerInfoSeasonStats.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    oVRRankPlayerInfoSeasonStats.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    oVRRankPlayerInfoSeasonStats.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    oVRRankPlayerInfoSeasonStats.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    oVRRankPlayerInfoSeasonStats.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    oVRRankPlayerInfoSeasonStats.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    oVRRankPlayerInfoSeasonStats.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    oVRRankPlayerInfoSeasonStats.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    oVRRankPlayerInfoSeasonStats.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    oVRRankPlayerInfoSeasonStats.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    oVRRankPlayerInfoSeasonStats.blkRank = blkRank;
  }
  final String? teamAbbreviation = jsonConvert.convert<String>(
      json['TEAM_ABBREVIATION']);
  if (teamAbbreviation != null) {
    oVRRankPlayerInfoSeasonStats.teamAbbreviation = teamAbbreviation;
  }
  final double? nbaFantasyPts = jsonConvert.convert<double>(
      json['NBA_FANTASY_PTS']);
  if (nbaFantasyPts != null) {
    oVRRankPlayerInfoSeasonStats.nbaFantasyPts = nbaFantasyPts;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    oVRRankPlayerInfoSeasonStats.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    oVRRankPlayerInfoSeasonStats.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    oVRRankPlayerInfoSeasonStats.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    oVRRankPlayerInfoSeasonStats.fg3aRank = fg3aRank;
  }
  final String? nICKNAME = jsonConvert.convert<String>(json['NICKNAME']);
  if (nICKNAME != null) {
    oVRRankPlayerInfoSeasonStats.nICKNAME = nICKNAME;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    oVRRankPlayerInfoSeasonStats.fTA = fTA;
  }
  final int? nbaFantasyPtsRank = jsonConvert.convert<int>(
      json['NBA_FANTASY_PTS_RANK']);
  if (nbaFantasyPtsRank != null) {
    oVRRankPlayerInfoSeasonStats.nbaFantasyPtsRank = nbaFantasyPtsRank;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    oVRRankPlayerInfoSeasonStats.mIN = mIN;
  }
  final int? dD2 = jsonConvert.convert<int>(json['DD2']);
  if (dD2 != null) {
    oVRRankPlayerInfoSeasonStats.dD2 = dD2;
  }
  final int? dd2Rank = jsonConvert.convert<int>(json['DD2_RANK']);
  if (dd2Rank != null) {
    oVRRankPlayerInfoSeasonStats.dd2Rank = dd2Rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    oVRRankPlayerInfoSeasonStats.playerId = playerId;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    oVRRankPlayerInfoSeasonStats.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    oVRRankPlayerInfoSeasonStats.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    oVRRankPlayerInfoSeasonStats.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    oVRRankPlayerInfoSeasonStats.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    oVRRankPlayerInfoSeasonStats.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    oVRRankPlayerInfoSeasonStats.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    oVRRankPlayerInfoSeasonStats.plusMinus = plusMinus;
  }
  final int? tD3 = jsonConvert.convert<int>(json['TD3']);
  if (tD3 != null) {
    oVRRankPlayerInfoSeasonStats.tD3 = tD3;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    oVRRankPlayerInfoSeasonStats.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    oVRRankPlayerInfoSeasonStats.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    oVRRankPlayerInfoSeasonStats.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    oVRRankPlayerInfoSeasonStats.l = l;
  }
  final double? wnbaFantasyPts = jsonConvert.convert<double>(
      json['WNBA_FANTASY_PTS']);
  if (wnbaFantasyPts != null) {
    oVRRankPlayerInfoSeasonStats.wnbaFantasyPts = wnbaFantasyPts;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    oVRRankPlayerInfoSeasonStats.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    oVRRankPlayerInfoSeasonStats.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    oVRRankPlayerInfoSeasonStats.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    oVRRankPlayerInfoSeasonStats.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    oVRRankPlayerInfoSeasonStats.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    oVRRankPlayerInfoSeasonStats.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    oVRRankPlayerInfoSeasonStats.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    oVRRankPlayerInfoSeasonStats.w = w;
  }
  final int? td3Rank = jsonConvert.convert<int>(json['TD3_RANK']);
  if (td3Rank != null) {
    oVRRankPlayerInfoSeasonStats.td3Rank = td3Rank;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    oVRRankPlayerInfoSeasonStats.fG3M = fG3M;
  }
  final double? aGE = jsonConvert.convert<double>(json['AGE']);
  if (aGE != null) {
    oVRRankPlayerInfoSeasonStats.aGE = aGE;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    oVRRankPlayerInfoSeasonStats.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    oVRRankPlayerInfoSeasonStats.astRank = astRank;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    oVRRankPlayerInfoSeasonStats.playerName = playerName;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    oVRRankPlayerInfoSeasonStats.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    oVRRankPlayerInfoSeasonStats.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    oVRRankPlayerInfoSeasonStats.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    oVRRankPlayerInfoSeasonStats.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    oVRRankPlayerInfoSeasonStats.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    oVRRankPlayerInfoSeasonStats.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    oVRRankPlayerInfoSeasonStats.ftPct = ftPct;
  }
  final int? wnbaFantasyPtsRank = jsonConvert.convert<int>(
      json['WNBA_FANTASY_PTS_RANK']);
  if (wnbaFantasyPtsRank != null) {
    oVRRankPlayerInfoSeasonStats.wnbaFantasyPtsRank = wnbaFantasyPtsRank;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    oVRRankPlayerInfoSeasonStats.ptsRank = ptsRank;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    oVRRankPlayerInfoSeasonStats.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    oVRRankPlayerInfoSeasonStats.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    oVRRankPlayerInfoSeasonStats.stlRank = stlRank;
  }
  return oVRRankPlayerInfoSeasonStats;
}

Map<String, dynamic> $OVRRankPlayerInfoSeasonStatsToJson(
    OVRRankPlayerInfoSeasonStats entity) {
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

extension OVRRankPlayerInfoSeasonStatsExtension on OVRRankPlayerInfoSeasonStats {
  OVRRankPlayerInfoSeasonStats copyWith({
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
    return OVRRankPlayerInfoSeasonStats()
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

OVRRankPlayerInfoGameStats $OVRRankPlayerInfoGameStatsFromJson(
    Map<String, dynamic> json) {
  final OVRRankPlayerInfoGameStats oVRRankPlayerInfoGameStats = OVRRankPlayerInfoGameStats();
  final int? afterPower = jsonConvert.convert<int>(json['afterPower']);
  if (afterPower != null) {
    oVRRankPlayerInfoGameStats.afterPower = afterPower;
  }
  final int? playerTeamId = jsonConvert.convert<int>(json['playerTeamId']);
  if (playerTeamId != null) {
    oVRRankPlayerInfoGameStats.playerTeamId = playerTeamId;
  }
  final OVRRankPlayerInfoGameStatsSchedule? schedule = jsonConvert.convert<
      OVRRankPlayerInfoGameStatsSchedule>(json['schedule']);
  if (schedule != null) {
    oVRRankPlayerInfoGameStats.schedule = schedule;
  }
  final int? oVR = jsonConvert.convert<int>(json['OVR']);
  if (oVR != null) {
    oVRRankPlayerInfoGameStats.oVR = oVR;
  }
  final int? afterOVR = jsonConvert.convert<int>(json['afterOVR']);
  if (afterOVR != null) {
    oVRRankPlayerInfoGameStats.afterOVR = afterOVR;
  }
  final int? power = jsonConvert.convert<int>(json['power']);
  if (power != null) {
    oVRRankPlayerInfoGameStats.power = power;
  }
  return oVRRankPlayerInfoGameStats;
}

Map<String, dynamic> $OVRRankPlayerInfoGameStatsToJson(
    OVRRankPlayerInfoGameStats entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['afterPower'] = entity.afterPower;
  data['playerTeamId'] = entity.playerTeamId;
  data['schedule'] = entity.schedule.toJson();
  data['OVR'] = entity.oVR;
  data['afterOVR'] = entity.afterOVR;
  data['power'] = entity.power;
  return data;
}

extension OVRRankPlayerInfoGameStatsExtension on OVRRankPlayerInfoGameStats {
  OVRRankPlayerInfoGameStats copyWith({
    int? afterPower,
    int? playerTeamId,
    OVRRankPlayerInfoGameStatsSchedule? schedule,
    int? oVR,
    int? afterOVR,
    int? power,
  }) {
    return OVRRankPlayerInfoGameStats()
      ..afterPower = afterPower ?? this.afterPower
      ..playerTeamId = playerTeamId ?? this.playerTeamId
      ..schedule = schedule ?? this.schedule
      ..oVR = oVR ?? this.oVR
      ..afterOVR = afterOVR ?? this.afterOVR
      ..power = power ?? this.power;
  }
}

OVRRankPlayerInfoGameStatsSchedule $OVRRankPlayerInfoGameStatsScheduleFromJson(
    Map<String, dynamic> json) {
  final OVRRankPlayerInfoGameStatsSchedule oVRRankPlayerInfoGameStatsSchedule = OVRRankPlayerInfoGameStatsSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    oVRRankPlayerInfoGameStatsSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    oVRRankPlayerInfoGameStatsSchedule.gameType = gameType;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    oVRRankPlayerInfoGameStatsSchedule.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    oVRRankPlayerInfoGameStatsSchedule.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    oVRRankPlayerInfoGameStatsSchedule.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    oVRRankPlayerInfoGameStatsSchedule.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    oVRRankPlayerInfoGameStatsSchedule.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    oVRRankPlayerInfoGameStatsSchedule.awayTeamScore = awayTeamScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    oVRRankPlayerInfoGameStatsSchedule.updateTime = updateTime;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    oVRRankPlayerInfoGameStatsSchedule.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    oVRRankPlayerInfoGameStatsSchedule.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    oVRRankPlayerInfoGameStatsSchedule.status = status;
  }
  return oVRRankPlayerInfoGameStatsSchedule;
}

Map<String, dynamic> $OVRRankPlayerInfoGameStatsScheduleToJson(
    OVRRankPlayerInfoGameStatsSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['updateTime'] = entity.updateTime;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension OVRRankPlayerInfoGameStatsScheduleExtension on OVRRankPlayerInfoGameStatsSchedule {
  OVRRankPlayerInfoGameStatsSchedule copyWith({
    int? gameId,
    int? gameType,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? updateTime,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return OVRRankPlayerInfoGameStatsSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..updateTime = updateTime ?? this.updateTime
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}