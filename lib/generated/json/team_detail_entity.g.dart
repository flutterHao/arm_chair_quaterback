import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_detail_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';


TeamDetailEntity $TeamDetailEntityFromJson(Map<String, dynamic> json) {
  final TeamDetailEntity teamDetailEntity = TeamDetailEntity();
  final List<
      TeamDetailGameSchedules>? gameSchedules = (json['gameSchedules'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamDetailGameSchedules>(
          e) as TeamDetailGameSchedules).toList();
  if (gameSchedules != null) {
    teamDetailEntity.gameSchedules = gameSchedules;
  }
  final TeamDetailRegularSeasonData? regularSeasonData = jsonConvert.convert<
      TeamDetailRegularSeasonData>(json['RegularSeasonData']);
  if (regularSeasonData != null) {
    teamDetailEntity.regularSeasonData = regularSeasonData;
  }
  final TeamDetailRecentPick? recentPick = jsonConvert.convert<
      TeamDetailRecentPick>(json['recentPick']);
  if (recentPick != null) {
    teamDetailEntity.recentPick = recentPick;
  }
  final TeamDetailLast5GameSchedule? last5GameSchedule = jsonConvert.convert<
      TeamDetailLast5GameSchedule>(json['last5GameSchedule']);
  if (last5GameSchedule != null) {
    teamDetailEntity.last5GameSchedule = last5GameSchedule;
  }
  final TeamDetailLast5GameSchedule? guessL5GameList = jsonConvert.convert<
      TeamDetailLast5GameSchedule>(json['guessL5GameList']);
  if (guessL5GameList != null) {
    teamDetailEntity.guessL5GameList = guessL5GameList;
  }
  final TeamDetailPreSeasonData? preSeasonData = jsonConvert.convert<
      TeamDetailPreSeasonData>(json['PreSeasonData']);
  if (preSeasonData != null) {
    teamDetailEntity.preSeasonData = preSeasonData;
  }
  final TeamDetailTotalL5Data? totalL5Data = jsonConvert.convert<
      TeamDetailTotalL5Data>(json['totalL5Data']);
  if (totalL5Data != null) {
    teamDetailEntity.totalL5Data = totalL5Data;
  }
  final List<TeamDetailOutcome>? outcome = (json['outcome'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TeamDetailOutcome>(e) as TeamDetailOutcome)
      .toList();
  if (outcome != null) {
    teamDetailEntity.outcome = outcome;
  }
  return teamDetailEntity;
}

Map<String, dynamic> $TeamDetailEntityToJson(TeamDetailEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameSchedules'] = entity.gameSchedules.map((v) => v.toJson()).toList();
  data['RegularSeasonData'] = entity.regularSeasonData.toJson();
  data['recentPick'] = entity.recentPick.toJson();
  data['last5GameSchedule'] = entity.last5GameSchedule.toJson();
  data['guessL5GameList'] = entity.guessL5GameList.toJson();
  data['PreSeasonData'] = entity.preSeasonData.toJson();
  data['totalL5Data'] = entity.totalL5Data.toJson();
  data['outcome'] = entity.outcome.map((v) => v.toJson()).toList();
  return data;
}

extension TeamDetailEntityExtension on TeamDetailEntity {
  TeamDetailEntity copyWith({
    List<TeamDetailGameSchedules>? gameSchedules,
    TeamDetailRegularSeasonData? regularSeasonData,
    TeamDetailRecentPick? recentPick,
    TeamDetailLast5GameSchedule? last5GameSchedule,
    TeamDetailLast5GameSchedule? guessL5GameList,
    TeamDetailPreSeasonData? preSeasonData,
    TeamDetailTotalL5Data? totalL5Data,
    List<TeamDetailOutcome>? outcome,
  }) {
    return TeamDetailEntity()
      ..gameSchedules = gameSchedules ?? this.gameSchedules
      ..regularSeasonData = regularSeasonData ?? this.regularSeasonData
      ..recentPick = recentPick ?? this.recentPick
      ..last5GameSchedule = last5GameSchedule ?? this.last5GameSchedule
      ..guessL5GameList = guessL5GameList ?? this.guessL5GameList
      ..preSeasonData = preSeasonData ?? this.preSeasonData
      ..totalL5Data = totalL5Data ?? this.totalL5Data
      ..outcome = outcome ?? this.outcome;
  }
}

TeamDetailGameSchedules $TeamDetailGameSchedulesFromJson(
    Map<String, dynamic> json) {
  final TeamDetailGameSchedules teamDetailGameSchedules = TeamDetailGameSchedules();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailGameSchedules.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamDetailGameSchedules.gameType = gameType;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamDetailGameSchedules.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamDetailGameSchedules.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamDetailGameSchedules.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamDetailGameSchedules.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailGameSchedules.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamDetailGameSchedules.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamDetailGameSchedules.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailGameSchedules.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamDetailGameSchedules.status = status;
  }
  return teamDetailGameSchedules;
}

Map<String, dynamic> $TeamDetailGameSchedulesToJson(
    TeamDetailGameSchedules entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamDetailGameSchedulesExtension on TeamDetailGameSchedules {
  TeamDetailGameSchedules copyWith({
    int? gameId,
    int? gameType,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamDetailGameSchedules()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}

TeamDetailRegularSeasonData $TeamDetailRegularSeasonDataFromJson(
    Map<String, dynamic> json) {
  final TeamDetailRegularSeasonData teamDetailRegularSeasonData = TeamDetailRegularSeasonData();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    teamDetailRegularSeasonData.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    teamDetailRegularSeasonData.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    teamDetailRegularSeasonData.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    teamDetailRegularSeasonData.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    teamDetailRegularSeasonData.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    teamDetailRegularSeasonData.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    teamDetailRegularSeasonData.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    teamDetailRegularSeasonData.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    teamDetailRegularSeasonData.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    teamDetailRegularSeasonData.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    teamDetailRegularSeasonData.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    teamDetailRegularSeasonData.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    teamDetailRegularSeasonData.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    teamDetailRegularSeasonData.blkRank = blkRank;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    teamDetailRegularSeasonData.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    teamDetailRegularSeasonData.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    teamDetailRegularSeasonData.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    teamDetailRegularSeasonData.fg3aRank = fg3aRank;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    teamDetailRegularSeasonData.fTA = fTA;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    teamDetailRegularSeasonData.mIN = mIN;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    teamDetailRegularSeasonData.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    teamDetailRegularSeasonData.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    teamDetailRegularSeasonData.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    teamDetailRegularSeasonData.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    teamDetailRegularSeasonData.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    teamDetailRegularSeasonData.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    teamDetailRegularSeasonData.plusMinus = plusMinus;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    teamDetailRegularSeasonData.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    teamDetailRegularSeasonData.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    teamDetailRegularSeasonData.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    teamDetailRegularSeasonData.l = l;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    teamDetailRegularSeasonData.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    teamDetailRegularSeasonData.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    teamDetailRegularSeasonData.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    teamDetailRegularSeasonData.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    teamDetailRegularSeasonData.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    teamDetailRegularSeasonData.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    teamDetailRegularSeasonData.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    teamDetailRegularSeasonData.w = w;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    teamDetailRegularSeasonData.fG3M = fG3M;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    teamDetailRegularSeasonData.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    teamDetailRegularSeasonData.astRank = astRank;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    teamDetailRegularSeasonData.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    teamDetailRegularSeasonData.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    teamDetailRegularSeasonData.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    teamDetailRegularSeasonData.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    teamDetailRegularSeasonData.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    teamDetailRegularSeasonData.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    teamDetailRegularSeasonData.ftPct = ftPct;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    teamDetailRegularSeasonData.ptsRank = ptsRank;
  }
  final String? teamName = jsonConvert.convert<String>(json['TEAM_NAME']);
  if (teamName != null) {
    teamDetailRegularSeasonData.teamName = teamName;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    teamDetailRegularSeasonData.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    teamDetailRegularSeasonData.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    teamDetailRegularSeasonData.stlRank = stlRank;
  }
  return teamDetailRegularSeasonData;
}

Map<String, dynamic> $TeamDetailRegularSeasonDataToJson(
    TeamDetailRegularSeasonData entity) {
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
  data['FGM'] = entity.fGM;
  data['L_RANK'] = entity.lRank;
  data['W_PCT'] = entity.wPct;
  data['FG3A_RANK'] = entity.fg3aRank;
  data['FTA'] = entity.fTA;
  data['MIN'] = entity.mIN;
  data['TOV'] = entity.tOV;
  data['FG3M_RANK'] = entity.fg3mRank;
  data['FTM'] = entity.fTM;
  data['TEAM_ID'] = entity.teamId;
  data['BLKA'] = entity.bLKA;
  data['BLK'] = entity.bLK;
  data['PLUS_MINUS'] = entity.plusMinus;
  data['W_RANK'] = entity.wRank;
  data['MIN_RANK'] = entity.minRank;
  data['FG_PCT'] = entity.fgPct;
  data['L'] = entity.l;
  data['PTS'] = entity.pTS;
  data['FG3A'] = entity.fG3A;
  data['FTM_RANK'] = entity.ftmRank;
  data['FTA_RANK'] = entity.ftaRank;
  data['FGA_RANK'] = entity.fgaRank;
  data['REB_RANK'] = entity.rebRank;
  data['BLKA_RANK'] = entity.blkaRank;
  data['W'] = entity.w;
  data['FG3M'] = entity.fG3M;
  data['W_PCT_RANK'] = entity.wPctRank;
  data['AST_RANK'] = entity.astRank;
  data['AST'] = entity.aST;
  data['OREB'] = entity.oREB;
  data['FT_PCT_RANK'] = entity.ftPctRank;
  data['GP'] = entity.gP;
  data['FGM_RANK'] = entity.fgmRank;
  data['REB'] = entity.rEB;
  data['FT_PCT'] = entity.ftPct;
  data['PTS_RANK'] = entity.ptsRank;
  data['TEAM_NAME'] = entity.teamName;
  data['PF'] = entity.pF;
  data['GP_RANK'] = entity.gpRank;
  data['STL_RANK'] = entity.stlRank;
  return data;
}

extension TeamDetailRegularSeasonDataExtension on TeamDetailRegularSeasonData {
  TeamDetailRegularSeasonData copyWith({
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
    double? fGM,
    int? lRank,
    double? wPct,
    int? fg3aRank,
    double? fTA,
    double? mIN,
    double? tOV,
    int? fg3mRank,
    double? fTM,
    int? teamId,
    double? bLKA,
    double? bLK,
    double? plusMinus,
    int? wRank,
    int? minRank,
    double? fgPct,
    int? l,
    double? pTS,
    double? fG3A,
    int? ftmRank,
    int? ftaRank,
    int? fgaRank,
    int? rebRank,
    int? blkaRank,
    int? w,
    double? fG3M,
    int? wPctRank,
    int? astRank,
    double? aST,
    double? oREB,
    int? ftPctRank,
    int? gP,
    int? fgmRank,
    double? rEB,
    double? ftPct,
    int? ptsRank,
    String? teamName,
    double? pF,
    int? gpRank,
    int? stlRank,
  }) {
    return TeamDetailRegularSeasonData()
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
      ..fGM = fGM ?? this.fGM
      ..lRank = lRank ?? this.lRank
      ..wPct = wPct ?? this.wPct
      ..fg3aRank = fg3aRank ?? this.fg3aRank
      ..fTA = fTA ?? this.fTA
      ..mIN = mIN ?? this.mIN
      ..tOV = tOV ?? this.tOV
      ..fg3mRank = fg3mRank ?? this.fg3mRank
      ..fTM = fTM ?? this.fTM
      ..teamId = teamId ?? this.teamId
      ..bLKA = bLKA ?? this.bLKA
      ..bLK = bLK ?? this.bLK
      ..plusMinus = plusMinus ?? this.plusMinus
      ..wRank = wRank ?? this.wRank
      ..minRank = minRank ?? this.minRank
      ..fgPct = fgPct ?? this.fgPct
      ..l = l ?? this.l
      ..pTS = pTS ?? this.pTS
      ..fG3A = fG3A ?? this.fG3A
      ..ftmRank = ftmRank ?? this.ftmRank
      ..ftaRank = ftaRank ?? this.ftaRank
      ..fgaRank = fgaRank ?? this.fgaRank
      ..rebRank = rebRank ?? this.rebRank
      ..blkaRank = blkaRank ?? this.blkaRank
      ..w = w ?? this.w
      ..fG3M = fG3M ?? this.fG3M
      ..wPctRank = wPctRank ?? this.wPctRank
      ..astRank = astRank ?? this.astRank
      ..aST = aST ?? this.aST
      ..oREB = oREB ?? this.oREB
      ..ftPctRank = ftPctRank ?? this.ftPctRank
      ..gP = gP ?? this.gP
      ..fgmRank = fgmRank ?? this.fgmRank
      ..rEB = rEB ?? this.rEB
      ..ftPct = ftPct ?? this.ftPct
      ..ptsRank = ptsRank ?? this.ptsRank
      ..teamName = teamName ?? this.teamName
      ..pF = pF ?? this.pF
      ..gpRank = gpRank ?? this.gpRank
      ..stlRank = stlRank ?? this.stlRank;
  }
}

TeamDetailRecentPick $TeamDetailRecentPickFromJson(Map<String, dynamic> json) {
  final TeamDetailRecentPick teamDetailRecentPick = TeamDetailRecentPick();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailRecentPick.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamDetailRecentPick.gameType = gameType;
  }
  final int? isGuess = jsonConvert.convert<int>(json['isGuess']);
  if (isGuess != null) {
    teamDetailRecentPick.isGuess = isGuess;
  }
  final int? awayTeamWins = jsonConvert.convert<int>(json['awayTeamWins']);
  if (awayTeamWins != null) {
    teamDetailRecentPick.awayTeamWins = awayTeamWins;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamDetailRecentPick.gameTime = gameTime;
  }
  final int? guessStatus = jsonConvert.convert<int>(json['guessStatus']);
  if (guessStatus != null) {
    teamDetailRecentPick.guessStatus = guessStatus;
  }
  final int? homeTeamWins = jsonConvert.convert<int>(json['homeTeamWins']);
  if (homeTeamWins != null) {
    teamDetailRecentPick.homeTeamWins = homeTeamWins;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamDetailRecentPick.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamDetailRecentPick.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamDetailRecentPick.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailRecentPick.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamDetailRecentPick.awayTeamScore = awayTeamScore;
  }
  final String? homeTeamWL = jsonConvert.convert<String>(json['homeTeamWL']);
  if (homeTeamWL != null) {
    teamDetailRecentPick.homeTeamWL = homeTeamWL;
  }
  final String? awayTeamWL = jsonConvert.convert<String>(json['awayTeamWL']);
  if (awayTeamWL != null) {
    teamDetailRecentPick.awayTeamWL = awayTeamWL;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamDetailRecentPick.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailRecentPick.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamDetailRecentPick.status = status;
  }
  return teamDetailRecentPick;
}

Map<String, dynamic> $TeamDetailRecentPickToJson(TeamDetailRecentPick entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['isGuess'] = entity.isGuess;
  data['awayTeamWins'] = entity.awayTeamWins;
  data['gameTime'] = entity.gameTime;
  data['guessStatus'] = entity.guessStatus;
  data['homeTeamWins'] = entity.homeTeamWins;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamWL'] = entity.homeTeamWL;
  data['awayTeamWL'] = entity.awayTeamWL;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamDetailRecentPickExtension on TeamDetailRecentPick {
  TeamDetailRecentPick copyWith({
    int? gameId,
    int? gameType,
    int? isGuess,
    int? awayTeamWins,
    int? gameTime,
    int? guessStatus,
    int? homeTeamWins,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    String? homeTeamWL,
    String? awayTeamWL,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamDetailRecentPick()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..isGuess = isGuess ?? this.isGuess
      ..awayTeamWins = awayTeamWins ?? this.awayTeamWins
      ..gameTime = gameTime ?? this.gameTime
      ..guessStatus = guessStatus ?? this.guessStatus
      ..homeTeamWins = homeTeamWins ?? this.homeTeamWins
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamWL = homeTeamWL ?? this.homeTeamWL
      ..awayTeamWL = awayTeamWL ?? this.awayTeamWL
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}

TeamDetailLast5GameSchedule $TeamDetailLast5GameScheduleFromJson(
    Map<String, dynamic> json) {
  final TeamDetailLast5GameSchedule teamDetailLast5GameSchedule = TeamDetailLast5GameSchedule();
  final List<
      TeamDetailLast5GameScheduleSchedule>? schedule = (json['schedule'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamDetailLast5GameScheduleSchedule>(
          e) as TeamDetailLast5GameScheduleSchedule).toList();
  if (schedule != null) {
    teamDetailLast5GameSchedule.schedule = schedule;
  }
  final List<
      TeamDetailLast5GameScheduleScoreAvg>? scoreAvg = (json['scoreAvg'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamDetailLast5GameScheduleScoreAvg>(
          e) as TeamDetailLast5GameScheduleScoreAvg).toList();
  if (scoreAvg != null) {
    teamDetailLast5GameSchedule.scoreAvg = scoreAvg;
  }
  return teamDetailLast5GameSchedule;
}

Map<String, dynamic> $TeamDetailLast5GameScheduleToJson(
    TeamDetailLast5GameSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['schedule'] = entity.schedule.map((v) => v.toJson()).toList();
  data['scoreAvg'] = entity.scoreAvg.map((v) => v.toJson()).toList();
  return data;
}

extension TeamDetailLast5GameScheduleExtension on TeamDetailLast5GameSchedule {
  TeamDetailLast5GameSchedule copyWith({
    List<TeamDetailLast5GameScheduleSchedule>? schedule,
    List<TeamDetailLast5GameScheduleScoreAvg>? scoreAvg,
  }) {
    return TeamDetailLast5GameSchedule()
      ..schedule = schedule ?? this.schedule
      ..scoreAvg = scoreAvg ?? this.scoreAvg;
  }
}

TeamDetailLast5GameScheduleSchedule $TeamDetailLast5GameScheduleScheduleFromJson(
    Map<String, dynamic> json) {
  final TeamDetailLast5GameScheduleSchedule teamDetailLast5GameScheduleSchedule = TeamDetailLast5GameScheduleSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailLast5GameScheduleSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamDetailLast5GameScheduleSchedule.gameType = gameType;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamDetailLast5GameScheduleSchedule.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamDetailLast5GameScheduleSchedule.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamDetailLast5GameScheduleSchedule.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamDetailLast5GameScheduleSchedule.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailLast5GameScheduleSchedule.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamDetailLast5GameScheduleSchedule.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamDetailLast5GameScheduleSchedule.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailLast5GameScheduleSchedule.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamDetailLast5GameScheduleSchedule.status = status;
  }
  return teamDetailLast5GameScheduleSchedule;
}

Map<String, dynamic> $TeamDetailLast5GameScheduleScheduleToJson(
    TeamDetailLast5GameScheduleSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamDetailLast5GameScheduleScheduleExtension on TeamDetailLast5GameScheduleSchedule {
  TeamDetailLast5GameScheduleSchedule copyWith({
    int? gameId,
    int? gameType,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamDetailLast5GameScheduleSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}

TeamDetailLast5GameScheduleScoreAvg $TeamDetailLast5GameScheduleScoreAvgFromJson(
    Map<String, dynamic> json) {
  final TeamDetailLast5GameScheduleScoreAvg teamDetailLast5GameScheduleScoreAvg = TeamDetailLast5GameScheduleScoreAvg();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    teamDetailLast5GameScheduleScoreAvg.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailLast5GameScheduleScoreAvg.gameId = gameId;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    teamDetailLast5GameScheduleScoreAvg.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    teamDetailLast5GameScheduleScoreAvg.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    teamDetailLast5GameScheduleScoreAvg.dreb = dreb;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    teamDetailLast5GameScheduleScoreAvg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    teamDetailLast5GameScheduleScoreAvg.stl = stl;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    teamDetailLast5GameScheduleScoreAvg.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    teamDetailLast5GameScheduleScoreAvg.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    teamDetailLast5GameScheduleScoreAvg.threePa = threePa;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    teamDetailLast5GameScheduleScoreAvg.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    teamDetailLast5GameScheduleScoreAvg.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    teamDetailLast5GameScheduleScoreAvg.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    teamDetailLast5GameScheduleScoreAvg.oreb = oreb;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailLast5GameScheduleScoreAvg.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    teamDetailLast5GameScheduleScoreAvg.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    teamDetailLast5GameScheduleScoreAvg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    teamDetailLast5GameScheduleScoreAvg.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    teamDetailLast5GameScheduleScoreAvg.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamDetailLast5GameScheduleScoreAvg.playerId = playerId;
  }
  return teamDetailLast5GameScheduleScoreAvg;
}

Map<String, dynamic> $TeamDetailLast5GameScheduleScoreAvgToJson(
    TeamDetailLast5GameScheduleScoreAvg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['playCount'] = entity.playCount;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['seasonId'] = entity.seasonId;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension TeamDetailLast5GameScheduleScoreAvgExtension on TeamDetailLast5GameScheduleScoreAvg {
  TeamDetailLast5GameScheduleScoreAvg copyWith({
    double? blk,
    int? gameId,
    double? fga,
    double? ast,
    double? dreb,
    int? starterCount,
    double? stl,
    double? fgm,
    double? pts,
    double? threePa,
    int? playCount,
    double? fta,
    double? min,
    double? oreb,
    int? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    int? playerId,
  }) {
    return TeamDetailLast5GameScheduleScoreAvg()
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..playCount = playCount ?? this.playCount
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..seasonId = seasonId ?? this.seasonId
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

TeamDetailGuessL5GameList $TeamDetailGuessL5GameListFromJson(
    Map<String, dynamic> json) {
  final TeamDetailGuessL5GameList teamDetailGuessL5GameList = TeamDetailGuessL5GameList();
  final List<
      TeamDetailGuessL5GameListSchedule>? schedule = (json['schedule'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamDetailGuessL5GameListSchedule>(
          e) as TeamDetailGuessL5GameListSchedule).toList();
  if (schedule != null) {
    teamDetailGuessL5GameList.schedule = schedule;
  }
  final List<
      TeamDetailGuessL5GameListTotalScore>? totalScore = (json['totalScore'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<TeamDetailGuessL5GameListTotalScore>(
          e) as TeamDetailGuessL5GameListTotalScore).toList();
  if (totalScore != null) {
    teamDetailGuessL5GameList.totalScore = totalScore;
  }
  return teamDetailGuessL5GameList;
}

Map<String, dynamic> $TeamDetailGuessL5GameListToJson(
    TeamDetailGuessL5GameList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['schedule'] = entity.schedule.map((v) => v.toJson()).toList();
  data['totalScore'] = entity.totalScore.map((v) => v.toJson()).toList();
  return data;
}

extension TeamDetailGuessL5GameListExtension on TeamDetailGuessL5GameList {
  TeamDetailGuessL5GameList copyWith({
    List<TeamDetailGuessL5GameListSchedule>? schedule,
    List<TeamDetailGuessL5GameListTotalScore>? totalScore,
  }) {
    return TeamDetailGuessL5GameList()
      ..schedule = schedule ?? this.schedule
      ..totalScore = totalScore ?? this.totalScore;
  }
}

TeamDetailGuessL5GameListSchedule $TeamDetailGuessL5GameListScheduleFromJson(
    Map<String, dynamic> json) {
  final TeamDetailGuessL5GameListSchedule teamDetailGuessL5GameListSchedule = TeamDetailGuessL5GameListSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailGuessL5GameListSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamDetailGuessL5GameListSchedule.gameType = gameType;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamDetailGuessL5GameListSchedule.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamDetailGuessL5GameListSchedule.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamDetailGuessL5GameListSchedule.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamDetailGuessL5GameListSchedule.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailGuessL5GameListSchedule.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamDetailGuessL5GameListSchedule.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamDetailGuessL5GameListSchedule.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailGuessL5GameListSchedule.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamDetailGuessL5GameListSchedule.status = status;
  }
  return teamDetailGuessL5GameListSchedule;
}

Map<String, dynamic> $TeamDetailGuessL5GameListScheduleToJson(
    TeamDetailGuessL5GameListSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamDetailGuessL5GameListScheduleExtension on TeamDetailGuessL5GameListSchedule {
  TeamDetailGuessL5GameListSchedule copyWith({
    int? gameId,
    int? gameType,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamDetailGuessL5GameListSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}

TeamDetailGuessL5GameListTotalScore $TeamDetailGuessL5GameListTotalScoreFromJson(
    Map<String, dynamic> json) {
  final TeamDetailGuessL5GameListTotalScore teamDetailGuessL5GameListTotalScore = TeamDetailGuessL5GameListTotalScore();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    teamDetailGuessL5GameListTotalScore.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailGuessL5GameListTotalScore.gameId = gameId;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    teamDetailGuessL5GameListTotalScore.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    teamDetailGuessL5GameListTotalScore.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    teamDetailGuessL5GameListTotalScore.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    teamDetailGuessL5GameListTotalScore.espnId = espnId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    teamDetailGuessL5GameListTotalScore.stl = stl;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    teamDetailGuessL5GameListTotalScore.fgm = fgm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    teamDetailGuessL5GameListTotalScore.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    teamDetailGuessL5GameListTotalScore.reb = reb;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    teamDetailGuessL5GameListTotalScore.threePa = threePa;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    teamDetailGuessL5GameListTotalScore.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    teamDetailGuessL5GameListTotalScore.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    teamDetailGuessL5GameListTotalScore.oreb = oreb;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    teamDetailGuessL5GameListTotalScore.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamDetailGuessL5GameListTotalScore.teamId = teamId;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    teamDetailGuessL5GameListTotalScore.isStarter = isStarter;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    teamDetailGuessL5GameListTotalScore.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    teamDetailGuessL5GameListTotalScore.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailGuessL5GameListTotalScore.awayTeamId = awayTeamId;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    teamDetailGuessL5GameListTotalScore.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamDetailGuessL5GameListTotalScore.playerId = playerId;
  }
  return teamDetailGuessL5GameListTotalScore;
}

Map<String, dynamic> $TeamDetailGuessL5GameListTotalScoreToJson(
    TeamDetailGuessL5GameListTotalScore entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['stl'] = entity.stl;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['threePa'] = entity.threePa;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['isStarter'] = entity.isStarter;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension TeamDetailGuessL5GameListTotalScoreExtension on TeamDetailGuessL5GameListTotalScore {
  TeamDetailGuessL5GameListTotalScore copyWith({
    int? blk,
    int? gameId,
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? stl,
    int? fgm,
    int? pts,
    int? reb,
    int? threePa,
    int? fta,
    int? min,
    int? oreb,
    int? pf,
    int? teamId,
    bool? isStarter,
    int? threePm,
    int? to,
    int? awayTeamId,
    int? ftm,
    int? playerId,
  }) {
    return TeamDetailGuessL5GameListTotalScore()
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..stl = stl ?? this.stl
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..threePa = threePa ?? this.threePa
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..isStarter = isStarter ?? this.isStarter
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

TeamDetailPreSeasonData $TeamDetailPreSeasonDataFromJson(
    Map<String, dynamic> json) {
  final TeamDetailPreSeasonData teamDetailPreSeasonData = TeamDetailPreSeasonData();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    teamDetailPreSeasonData.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    teamDetailPreSeasonData.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    teamDetailPreSeasonData.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    teamDetailPreSeasonData.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    teamDetailPreSeasonData.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    teamDetailPreSeasonData.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    teamDetailPreSeasonData.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    teamDetailPreSeasonData.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    teamDetailPreSeasonData.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    teamDetailPreSeasonData.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    teamDetailPreSeasonData.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    teamDetailPreSeasonData.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    teamDetailPreSeasonData.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    teamDetailPreSeasonData.blkRank = blkRank;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    teamDetailPreSeasonData.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    teamDetailPreSeasonData.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    teamDetailPreSeasonData.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    teamDetailPreSeasonData.fg3aRank = fg3aRank;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    teamDetailPreSeasonData.fTA = fTA;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    teamDetailPreSeasonData.mIN = mIN;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    teamDetailPreSeasonData.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    teamDetailPreSeasonData.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    teamDetailPreSeasonData.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    teamDetailPreSeasonData.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    teamDetailPreSeasonData.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    teamDetailPreSeasonData.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    teamDetailPreSeasonData.plusMinus = plusMinus;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    teamDetailPreSeasonData.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    teamDetailPreSeasonData.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    teamDetailPreSeasonData.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    teamDetailPreSeasonData.l = l;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    teamDetailPreSeasonData.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    teamDetailPreSeasonData.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    teamDetailPreSeasonData.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    teamDetailPreSeasonData.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    teamDetailPreSeasonData.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    teamDetailPreSeasonData.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    teamDetailPreSeasonData.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    teamDetailPreSeasonData.w = w;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    teamDetailPreSeasonData.fG3M = fG3M;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    teamDetailPreSeasonData.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    teamDetailPreSeasonData.astRank = astRank;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    teamDetailPreSeasonData.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    teamDetailPreSeasonData.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    teamDetailPreSeasonData.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    teamDetailPreSeasonData.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    teamDetailPreSeasonData.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    teamDetailPreSeasonData.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    teamDetailPreSeasonData.ftPct = ftPct;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    teamDetailPreSeasonData.ptsRank = ptsRank;
  }
  final String? teamName = jsonConvert.convert<String>(json['TEAM_NAME']);
  if (teamName != null) {
    teamDetailPreSeasonData.teamName = teamName;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    teamDetailPreSeasonData.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    teamDetailPreSeasonData.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    teamDetailPreSeasonData.stlRank = stlRank;
  }
  return teamDetailPreSeasonData;
}

Map<String, dynamic> $TeamDetailPreSeasonDataToJson(
    TeamDetailPreSeasonData entity) {
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
  data['FGM'] = entity.fGM;
  data['L_RANK'] = entity.lRank;
  data['W_PCT'] = entity.wPct;
  data['FG3A_RANK'] = entity.fg3aRank;
  data['FTA'] = entity.fTA;
  data['MIN'] = entity.mIN;
  data['TOV'] = entity.tOV;
  data['FG3M_RANK'] = entity.fg3mRank;
  data['FTM'] = entity.fTM;
  data['TEAM_ID'] = entity.teamId;
  data['BLKA'] = entity.bLKA;
  data['BLK'] = entity.bLK;
  data['PLUS_MINUS'] = entity.plusMinus;
  data['W_RANK'] = entity.wRank;
  data['MIN_RANK'] = entity.minRank;
  data['FG_PCT'] = entity.fgPct;
  data['L'] = entity.l;
  data['PTS'] = entity.pTS;
  data['FG3A'] = entity.fG3A;
  data['FTM_RANK'] = entity.ftmRank;
  data['FTA_RANK'] = entity.ftaRank;
  data['FGA_RANK'] = entity.fgaRank;
  data['REB_RANK'] = entity.rebRank;
  data['BLKA_RANK'] = entity.blkaRank;
  data['W'] = entity.w;
  data['FG3M'] = entity.fG3M;
  data['W_PCT_RANK'] = entity.wPctRank;
  data['AST_RANK'] = entity.astRank;
  data['AST'] = entity.aST;
  data['OREB'] = entity.oREB;
  data['FT_PCT_RANK'] = entity.ftPctRank;
  data['GP'] = entity.gP;
  data['FGM_RANK'] = entity.fgmRank;
  data['REB'] = entity.rEB;
  data['FT_PCT'] = entity.ftPct;
  data['PTS_RANK'] = entity.ptsRank;
  data['TEAM_NAME'] = entity.teamName;
  data['PF'] = entity.pF;
  data['GP_RANK'] = entity.gpRank;
  data['STL_RANK'] = entity.stlRank;
  return data;
}

extension TeamDetailPreSeasonDataExtension on TeamDetailPreSeasonData {
  TeamDetailPreSeasonData copyWith({
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
    double? fGM,
    int? lRank,
    double? wPct,
    int? fg3aRank,
    double? fTA,
    double? mIN,
    double? tOV,
    int? fg3mRank,
    double? fTM,
    int? teamId,
    double? bLKA,
    double? bLK,
    double? plusMinus,
    int? wRank,
    int? minRank,
    double? fgPct,
    int? l,
    double? pTS,
    double? fG3A,
    int? ftmRank,
    int? ftaRank,
    int? fgaRank,
    int? rebRank,
    int? blkaRank,
    int? w,
    double? fG3M,
    int? wPctRank,
    int? astRank,
    double? aST,
    double? oREB,
    int? ftPctRank,
    int? gP,
    int? fgmRank,
    double? rEB,
    double? ftPct,
    int? ptsRank,
    String? teamName,
    double? pF,
    int? gpRank,
    int? stlRank,
  }) {
    return TeamDetailPreSeasonData()
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
      ..fGM = fGM ?? this.fGM
      ..lRank = lRank ?? this.lRank
      ..wPct = wPct ?? this.wPct
      ..fg3aRank = fg3aRank ?? this.fg3aRank
      ..fTA = fTA ?? this.fTA
      ..mIN = mIN ?? this.mIN
      ..tOV = tOV ?? this.tOV
      ..fg3mRank = fg3mRank ?? this.fg3mRank
      ..fTM = fTM ?? this.fTM
      ..teamId = teamId ?? this.teamId
      ..bLKA = bLKA ?? this.bLKA
      ..bLK = bLK ?? this.bLK
      ..plusMinus = plusMinus ?? this.plusMinus
      ..wRank = wRank ?? this.wRank
      ..minRank = minRank ?? this.minRank
      ..fgPct = fgPct ?? this.fgPct
      ..l = l ?? this.l
      ..pTS = pTS ?? this.pTS
      ..fG3A = fG3A ?? this.fG3A
      ..ftmRank = ftmRank ?? this.ftmRank
      ..ftaRank = ftaRank ?? this.ftaRank
      ..fgaRank = fgaRank ?? this.fgaRank
      ..rebRank = rebRank ?? this.rebRank
      ..blkaRank = blkaRank ?? this.blkaRank
      ..w = w ?? this.w
      ..fG3M = fG3M ?? this.fG3M
      ..wPctRank = wPctRank ?? this.wPctRank
      ..astRank = astRank ?? this.astRank
      ..aST = aST ?? this.aST
      ..oREB = oREB ?? this.oREB
      ..ftPctRank = ftPctRank ?? this.ftPctRank
      ..gP = gP ?? this.gP
      ..fgmRank = fgmRank ?? this.fgmRank
      ..rEB = rEB ?? this.rEB
      ..ftPct = ftPct ?? this.ftPct
      ..ptsRank = ptsRank ?? this.ptsRank
      ..teamName = teamName ?? this.teamName
      ..pF = pF ?? this.pF
      ..gpRank = gpRank ?? this.gpRank
      ..stlRank = stlRank ?? this.stlRank;
  }
}

TeamDetailTotalL5Data $TeamDetailTotalL5DataFromJson(
    Map<String, dynamic> json) {
  final TeamDetailTotalL5Data teamDetailTotalL5Data = TeamDetailTotalL5Data();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    teamDetailTotalL5Data.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailTotalL5Data.gameId = gameId;
  }
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    teamDetailTotalL5Data.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    teamDetailTotalL5Data.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    teamDetailTotalL5Data.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    teamDetailTotalL5Data.espnId = espnId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    teamDetailTotalL5Data.stl = stl;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    teamDetailTotalL5Data.fgm = fgm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    teamDetailTotalL5Data.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    teamDetailTotalL5Data.reb = reb;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    teamDetailTotalL5Data.threePa = threePa;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    teamDetailTotalL5Data.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    teamDetailTotalL5Data.min = min;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    teamDetailTotalL5Data.oreb = oreb;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    teamDetailTotalL5Data.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamDetailTotalL5Data.teamId = teamId;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    teamDetailTotalL5Data.isStarter = isStarter;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    teamDetailTotalL5Data.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    teamDetailTotalL5Data.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailTotalL5Data.awayTeamId = awayTeamId;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    teamDetailTotalL5Data.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    teamDetailTotalL5Data.playerId = playerId;
  }
  return teamDetailTotalL5Data;
}

Map<String, dynamic> $TeamDetailTotalL5DataToJson(
    TeamDetailTotalL5Data entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['stl'] = entity.stl;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['threePa'] = entity.threePa;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['isStarter'] = entity.isStarter;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension TeamDetailTotalL5DataExtension on TeamDetailTotalL5Data {
  TeamDetailTotalL5Data copyWith({
    int? blk,
    int? gameId,
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? stl,
    int? fgm,
    int? pts,
    int? reb,
    int? threePa,
    int? fta,
    int? min,
    int? oreb,
    int? pf,
    int? teamId,
    bool? isStarter,
    int? threePm,
    int? to,
    int? awayTeamId,
    int? ftm,
    int? playerId,
  }) {
    return TeamDetailTotalL5Data()
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..stl = stl ?? this.stl
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..threePa = threePa ?? this.threePa
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..isStarter = isStarter ?? this.isStarter
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

TeamDetailOutcome $TeamDetailOutcomeFromJson(Map<String, dynamic> json) {
  final TeamDetailOutcome teamDetailOutcome = TeamDetailOutcome();
  final int? reviewsCount = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCount != null) {
    teamDetailOutcome.reviewsCount = reviewsCount;
  }
  final TeamDetailOutcomeGameSchedule? gameSchedule = jsonConvert.convert<
      TeamDetailOutcomeGameSchedule>(json['gameSchedule']);
  if (gameSchedule != null) {
    teamDetailOutcome.gameSchedule = gameSchedule;
  }
  return teamDetailOutcome;
}

Map<String, dynamic> $TeamDetailOutcomeToJson(TeamDetailOutcome entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['reviewsCount'] = entity.reviewsCount;
  data['gameSchedule'] = entity.gameSchedule.toJson();
  return data;
}

extension TeamDetailOutcomeExtension on TeamDetailOutcome {
  TeamDetailOutcome copyWith({
    int? reviewsCount,
    TeamDetailOutcomeGameSchedule? gameSchedule,
  }) {
    return TeamDetailOutcome()
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..gameSchedule = gameSchedule ?? this.gameSchedule;
  }
}

TeamDetailOutcomeGameSchedule $TeamDetailOutcomeGameScheduleFromJson(
    Map<String, dynamic> json) {
  final TeamDetailOutcomeGameSchedule teamDetailOutcomeGameSchedule = TeamDetailOutcomeGameSchedule();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    teamDetailOutcomeGameSchedule.gameId = gameId;
  }
  final int? gameType = jsonConvert.convert<int>(json['gameType']);
  if (gameType != null) {
    teamDetailOutcomeGameSchedule.gameType = gameType;
  }
  final int? gameTime = jsonConvert.convert<int>(json['gameTime']);
  if (gameTime != null) {
    teamDetailOutcomeGameSchedule.gameTime = gameTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    teamDetailOutcomeGameSchedule.createTime = createTime;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    teamDetailOutcomeGameSchedule.gameStartTime = gameStartTime;
  }
  final int? homeTeamScore = jsonConvert.convert<int>(json['homeTeamScore']);
  if (homeTeamScore != null) {
    teamDetailOutcomeGameSchedule.homeTeamScore = homeTeamScore;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    teamDetailOutcomeGameSchedule.seasonId = seasonId;
  }
  final int? awayTeamScore = jsonConvert.convert<int>(json['awayTeamScore']);
  if (awayTeamScore != null) {
    teamDetailOutcomeGameSchedule.awayTeamScore = awayTeamScore;
  }
  final int? homeTeamId = jsonConvert.convert<int>(json['homeTeamId']);
  if (homeTeamId != null) {
    teamDetailOutcomeGameSchedule.homeTeamId = homeTeamId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    teamDetailOutcomeGameSchedule.awayTeamId = awayTeamId;
  }
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    teamDetailOutcomeGameSchedule.status = status;
  }
  return teamDetailOutcomeGameSchedule;
}

Map<String, dynamic> $TeamDetailOutcomeGameScheduleToJson(
    TeamDetailOutcomeGameSchedule entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['gameType'] = entity.gameType;
  data['gameTime'] = entity.gameTime;
  data['createTime'] = entity.createTime;
  data['gameStartTime'] = entity.gameStartTime;
  data['homeTeamScore'] = entity.homeTeamScore;
  data['seasonId'] = entity.seasonId;
  data['awayTeamScore'] = entity.awayTeamScore;
  data['homeTeamId'] = entity.homeTeamId;
  data['awayTeamId'] = entity.awayTeamId;
  data['status'] = entity.status;
  return data;
}

extension TeamDetailOutcomeGameScheduleExtension on TeamDetailOutcomeGameSchedule {
  TeamDetailOutcomeGameSchedule copyWith({
    int? gameId,
    int? gameType,
    int? gameTime,
    int? createTime,
    int? gameStartTime,
    int? homeTeamScore,
    int? seasonId,
    int? awayTeamScore,
    int? homeTeamId,
    int? awayTeamId,
    int? status,
  }) {
    return TeamDetailOutcomeGameSchedule()
      ..gameId = gameId ?? this.gameId
      ..gameType = gameType ?? this.gameType
      ..gameTime = gameTime ?? this.gameTime
      ..createTime = createTime ?? this.createTime
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..homeTeamScore = homeTeamScore ?? this.homeTeamScore
      ..seasonId = seasonId ?? this.seasonId
      ..awayTeamScore = awayTeamScore ?? this.awayTeamScore
      ..homeTeamId = homeTeamId ?? this.homeTeamId
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..status = status ?? this.status;
  }
}