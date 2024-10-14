import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';

NbaPlayerBaseInfoEntity $NbaPlayerBaseInfoEntityFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoEntity nbaPlayerBaseInfoEntity = NbaPlayerBaseInfoEntity();
  final NbaPlayerBaseInfoPlayerBaseInfo? playerBaseInfo = jsonConvert.convert<
      NbaPlayerBaseInfoPlayerBaseInfo>(json['playerBaseInfo']);
  if (playerBaseInfo != null) {
    nbaPlayerBaseInfoEntity.playerBaseInfo = playerBaseInfo;
  }
  final NbaPlayerBaseInfoPlayerRegularMap? playerRegularMap = jsonConvert
      .convert<NbaPlayerBaseInfoPlayerRegularMap>(json['playerRegularMap']);
  if (playerRegularMap != null) {
    nbaPlayerBaseInfoEntity.playerRegularMap = playerRegularMap;
  }
  final NbaPlayerBaseInfoPlayerPlayoffsMap? playerPlayoffsMap = jsonConvert
      .convert<NbaPlayerBaseInfoPlayerPlayoffsMap>(json['playerPlayoffsMap']);
  if (playerPlayoffsMap != null) {
    nbaPlayerBaseInfoEntity.playerPlayoffsMap = playerPlayoffsMap;
  }
  final List<
      NbaPlayerBaseInfoPlayerTrends>? playerTrends = (json['playerTrends'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerBaseInfoPlayerTrends>(
          e) as NbaPlayerBaseInfoPlayerTrends).toList();
  if (playerTrends != null) {
    nbaPlayerBaseInfoEntity.playerTrends = playerTrends;
  }
  final List<
      NbaPlayerBaseInfoPlayerNews>? playerNews = (json['playerNews'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerBaseInfoPlayerNews>(
          e) as NbaPlayerBaseInfoPlayerNews).toList();
  if (playerNews != null) {
    nbaPlayerBaseInfoEntity.playerNews = playerNews;
  }
  return nbaPlayerBaseInfoEntity;
}

Map<String, dynamic> $NbaPlayerBaseInfoEntityToJson(
    NbaPlayerBaseInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerBaseInfo'] = entity.playerBaseInfo.toJson();
  data['playerRegularMap'] = entity.playerRegularMap?.toJson();
  data['playerPlayoffsMap'] = entity.playerPlayoffsMap?.toJson();
  data['playerTrends'] = entity.playerTrends.map((v) => v.toJson()).toList();
  data['playerNews'] = entity.playerNews.map((v) => v.toJson()).toList();
  return data;
}

extension NbaPlayerBaseInfoEntityExtension on NbaPlayerBaseInfoEntity {
  NbaPlayerBaseInfoEntity copyWith({
    NbaPlayerBaseInfoPlayerBaseInfo? playerBaseInfo,
    NbaPlayerBaseInfoPlayerRegularMap? playerRegularMap,
    NbaPlayerBaseInfoPlayerPlayoffsMap? playerPlayoffsMap,
    List<NbaPlayerBaseInfoPlayerTrends>? playerTrends,
    List<NbaPlayerBaseInfoPlayerNews>? playerNews,
  }) {
    return NbaPlayerBaseInfoEntity()
      ..playerBaseInfo = playerBaseInfo ?? this.playerBaseInfo
      ..playerRegularMap = playerRegularMap ?? this.playerRegularMap
      ..playerPlayoffsMap = playerPlayoffsMap ?? this.playerPlayoffsMap
      ..playerTrends = playerTrends ?? this.playerTrends
      ..playerNews = playerNews ?? this.playerNews;
  }
}

NbaPlayerBaseInfoPlayerBaseInfo $NbaPlayerBaseInfoPlayerBaseInfoFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerBaseInfo nbaPlayerBaseInfoPlayerBaseInfo = NbaPlayerBaseInfoPlayerBaseInfo();
  final int? marketPrice = jsonConvert.convert<int>(json['marketPrice']);
  if (marketPrice != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.marketPrice = marketPrice;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.espnId = espnId;
  }
  final bool? injuries = jsonConvert.convert<bool>(json['injuries']);
  if (injuries != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.injuries = injuries;
  }
  final int? birthTime = jsonConvert.convert<int>(json['birthTime']);
  if (birthTime != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.birthTime = birthTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.playerStrength = playerStrength;
  }
  final String? elname = jsonConvert.convert<String>(json['elname']);
  if (elname != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.elname = elname;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.salary = salary;
  }
  final int? minPlayerScore = jsonConvert.convert<int>(json['minPlayerScore']);
  if (minPlayerScore != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.minPlayerScore = minPlayerScore;
  }
  final int? pos = jsonConvert.convert<int>(json['pos']);
  if (pos != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.pos = pos;
  }
  final int? property = jsonConvert.convert<int>(json['property']);
  if (property != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.property = property;
  }
  final List<int>? tag = (json['tag'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (tag != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.tag = tag;
  }
  final int? beforeMarketPrice = jsonConvert.convert<int>(
      json['beforeMarketPrice']);
  if (beforeMarketPrice != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.beforeMarketPrice = beforeMarketPrice;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.playerId = playerId;
  }
  final int? maxPlayerScore = jsonConvert.convert<int>(json['maxPlayerScore']);
  if (maxPlayerScore != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.maxPlayerScore = maxPlayerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.updateTime = updateTime;
  }
  final int? beforePlayerStrength = jsonConvert.convert<int>(
      json['beforePlayerStrength']);
  if (beforePlayerStrength != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.beforePlayerStrength = beforePlayerStrength;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.ename = ename;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.playerScore = playerScore;
  }
  final String? sname = jsonConvert.convert<String>(json['sname']);
  if (sname != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.sname = sname;
  }
  final String? grade = jsonConvert.convert<String>(json['grade']);
  if (grade != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.grade = grade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.teamId = teamId;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.name = name;
  }
  final int? basicMarketPrice = jsonConvert.convert<int>(
      json['basicMarketPrice']);
  if (basicMarketPrice != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.basicMarketPrice = basicMarketPrice;
  }
  final String? position = jsonConvert.convert<String>(json['position']);
  if (position != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.position = position;
  }
  return nbaPlayerBaseInfoPlayerBaseInfo;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerBaseInfoToJson(
    NbaPlayerBaseInfoPlayerBaseInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['marketPrice'] = entity.marketPrice;
  data['espnId'] = entity.espnId;
  data['injuries'] = entity.injuries;
  data['birthTime'] = entity.birthTime;
  data['playerStrength'] = entity.playerStrength;
  data['elname'] = entity.elname;
  data['salary'] = entity.salary;
  data['minPlayerScore'] = entity.minPlayerScore;
  data['pos'] = entity.pos;
  data['property'] = entity.property;
  data['tag'] = entity.tag;
  data['beforeMarketPrice'] = entity.beforeMarketPrice;
  data['playerId'] = entity.playerId;
  data['maxPlayerScore'] = entity.maxPlayerScore;
  data['updateTime'] = entity.updateTime;
  data['beforePlayerStrength'] = entity.beforePlayerStrength;
  data['ename'] = entity.ename;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['sname'] = entity.sname;
  data['grade'] = entity.grade;
  data['teamId'] = entity.teamId;
  data['name'] = entity.name;
  data['basicMarketPrice'] = entity.basicMarketPrice;
  data['position'] = entity.position;
  return data;
}

extension NbaPlayerBaseInfoPlayerBaseInfoExtension on NbaPlayerBaseInfoPlayerBaseInfo {
  NbaPlayerBaseInfoPlayerBaseInfo copyWith({
    int? marketPrice,
    int? espnId,
    bool? injuries,
    int? birthTime,
    int? playerStrength,
    String? elname,
    int? salary,
    int? minPlayerScore,
    int? pos,
    int? property,
    List<int>? tag,
    int? beforeMarketPrice,
    int? playerId,
    int? maxPlayerScore,
    int? updateTime,
    int? beforePlayerStrength,
    String? ename,
    int? createTime,
    int? playerScore,
    String? sname,
    String? grade,
    int? teamId,
    String? name,
    int? basicMarketPrice,
    String? position,
  }) {
    return NbaPlayerBaseInfoPlayerBaseInfo()
      ..marketPrice = marketPrice ?? this.marketPrice
      ..espnId = espnId ?? this.espnId
      ..injuries = injuries ?? this.injuries
      ..birthTime = birthTime ?? this.birthTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..elname = elname ?? this.elname
      ..salary = salary ?? this.salary
      ..minPlayerScore = minPlayerScore ?? this.minPlayerScore
      ..pos = pos ?? this.pos
      ..property = property ?? this.property
      ..tag = tag ?? this.tag
      ..beforeMarketPrice = beforeMarketPrice ?? this.beforeMarketPrice
      ..playerId = playerId ?? this.playerId
      ..maxPlayerScore = maxPlayerScore ?? this.maxPlayerScore
      ..updateTime = updateTime ?? this.updateTime
      ..beforePlayerStrength = beforePlayerStrength ?? this.beforePlayerStrength
      ..ename = ename ?? this.ename
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..sname = sname ?? this.sname
      ..grade = grade ?? this.grade
      ..teamId = teamId ?? this.teamId
      ..name = name ?? this.name
      ..basicMarketPrice = basicMarketPrice ?? this.basicMarketPrice
      ..position = position ?? this.position;
  }
}

NbaPlayerBaseInfoPlayerRegularMap $NbaPlayerBaseInfoPlayerRegularMapFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerRegularMap nbaPlayerBaseInfoPlayerRegularMap = NbaPlayerBaseInfoPlayerRegularMap();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    nbaPlayerBaseInfoPlayerRegularMap.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    nbaPlayerBaseInfoPlayerRegularMap.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    nbaPlayerBaseInfoPlayerRegularMap.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.blkRank = blkRank;
  }
  final String? teamAbbreviation = jsonConvert.convert<String>(
      json['TEAM_ABBREVIATION']);
  if (teamAbbreviation != null) {
    nbaPlayerBaseInfoPlayerRegularMap.teamAbbreviation = teamAbbreviation;
  }
  final double? nbaFantasyPts = jsonConvert.convert<double>(
      json['NBA_FANTASY_PTS']);
  if (nbaFantasyPts != null) {
    nbaPlayerBaseInfoPlayerRegularMap.nbaFantasyPts = nbaFantasyPts;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    nbaPlayerBaseInfoPlayerRegularMap.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fg3aRank = fg3aRank;
  }
  final String? nICKNAME = jsonConvert.convert<String>(json['NICKNAME']);
  if (nICKNAME != null) {
    nbaPlayerBaseInfoPlayerRegularMap.nICKNAME = nICKNAME;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fTA = fTA;
  }
  final int? nbaFantasyPtsRank = jsonConvert.convert<int>(
      json['NBA_FANTASY_PTS_RANK']);
  if (nbaFantasyPtsRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.nbaFantasyPtsRank = nbaFantasyPtsRank;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    nbaPlayerBaseInfoPlayerRegularMap.mIN = mIN;
  }
  final int? dD2 = jsonConvert.convert<int>(json['DD2']);
  if (dD2 != null) {
    nbaPlayerBaseInfoPlayerRegularMap.dD2 = dD2;
  }
  final int? dd2Rank = jsonConvert.convert<int>(json['DD2_RANK']);
  if (dd2Rank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.dd2Rank = dd2Rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    nbaPlayerBaseInfoPlayerRegularMap.playerId = playerId;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    nbaPlayerBaseInfoPlayerRegularMap.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    nbaPlayerBaseInfoPlayerRegularMap.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    nbaPlayerBaseInfoPlayerRegularMap.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    nbaPlayerBaseInfoPlayerRegularMap.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    nbaPlayerBaseInfoPlayerRegularMap.plusMinus = plusMinus;
  }
  final int? tD3 = jsonConvert.convert<int>(json['TD3']);
  if (tD3 != null) {
    nbaPlayerBaseInfoPlayerRegularMap.tD3 = tD3;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    nbaPlayerBaseInfoPlayerRegularMap.l = l;
  }
  final double? wnbaFantasyPts = jsonConvert.convert<double>(
      json['WNBA_FANTASY_PTS']);
  if (wnbaFantasyPts != null) {
    nbaPlayerBaseInfoPlayerRegularMap.wnbaFantasyPts = wnbaFantasyPts;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    nbaPlayerBaseInfoPlayerRegularMap.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    nbaPlayerBaseInfoPlayerRegularMap.w = w;
  }
  final int? td3Rank = jsonConvert.convert<int>(json['TD3_RANK']);
  if (td3Rank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.td3Rank = td3Rank;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fG3M = fG3M;
  }
  final double? aGE = jsonConvert.convert<double>(json['AGE']);
  if (aGE != null) {
    nbaPlayerBaseInfoPlayerRegularMap.aGE = aGE;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.astRank = astRank;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    nbaPlayerBaseInfoPlayerRegularMap.playerName = playerName;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    nbaPlayerBaseInfoPlayerRegularMap.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    nbaPlayerBaseInfoPlayerRegularMap.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    nbaPlayerBaseInfoPlayerRegularMap.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    nbaPlayerBaseInfoPlayerRegularMap.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    nbaPlayerBaseInfoPlayerRegularMap.ftPct = ftPct;
  }
  final int? wnbaFantasyPtsRank = jsonConvert.convert<int>(
      json['WNBA_FANTASY_PTS_RANK']);
  if (wnbaFantasyPtsRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.wnbaFantasyPtsRank = wnbaFantasyPtsRank;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.ptsRank = ptsRank;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    nbaPlayerBaseInfoPlayerRegularMap.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    nbaPlayerBaseInfoPlayerRegularMap.stlRank = stlRank;
  }
  return nbaPlayerBaseInfoPlayerRegularMap;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerRegularMapToJson(
    NbaPlayerBaseInfoPlayerRegularMap entity) {
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

extension NbaPlayerBaseInfoPlayerRegularMapExtension on NbaPlayerBaseInfoPlayerRegularMap {
  NbaPlayerBaseInfoPlayerRegularMap copyWith({
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
    return NbaPlayerBaseInfoPlayerRegularMap()
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

NbaPlayerBaseInfoPlayerPlayoffsMap $NbaPlayerBaseInfoPlayerPlayoffsMapFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerPlayoffsMap nbaPlayerBaseInfoPlayerPlayoffsMap = NbaPlayerBaseInfoPlayerPlayoffsMap();
  final int? pfdRank = jsonConvert.convert<int>(json['PFD_RANK']);
  if (pfdRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.pfdRank = pfdRank;
  }
  final double? fg3Pct = jsonConvert.convert<double>(json['FG3_PCT']);
  if (fg3Pct != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fg3Pct = fg3Pct;
  }
  final int? orebRank = jsonConvert.convert<int>(json['OREB_RANK']);
  if (orebRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.orebRank = orebRank;
  }
  final double? sTL = jsonConvert.convert<double>(json['STL']);
  if (sTL != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.sTL = sTL;
  }
  final double? dREB = jsonConvert.convert<double>(json['DREB']);
  if (dREB != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.dREB = dREB;
  }
  final int? fgPctRank = jsonConvert.convert<int>(json['FG_PCT_RANK']);
  if (fgPctRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fgPctRank = fgPctRank;
  }
  final int? plusMinusRank = jsonConvert.convert<int>(json['PLUS_MINUS_RANK']);
  if (plusMinusRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.plusMinusRank = plusMinusRank;
  }
  final double? pFD = jsonConvert.convert<double>(json['PFD']);
  if (pFD != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.pFD = pFD;
  }
  final int? pfRank = jsonConvert.convert<int>(json['PF_RANK']);
  if (pfRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.pfRank = pfRank;
  }
  final int? drebRank = jsonConvert.convert<int>(json['DREB_RANK']);
  if (drebRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.drebRank = drebRank;
  }
  final int? tovRank = jsonConvert.convert<int>(json['TOV_RANK']);
  if (tovRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.tovRank = tovRank;
  }
  final double? fGA = jsonConvert.convert<double>(json['FGA']);
  if (fGA != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fGA = fGA;
  }
  final int? fg3PctRank = jsonConvert.convert<int>(json['FG3_PCT_RANK']);
  if (fg3PctRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fg3PctRank = fg3PctRank;
  }
  final int? blkRank = jsonConvert.convert<int>(json['BLK_RANK']);
  if (blkRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.blkRank = blkRank;
  }
  final String? teamAbbreviation = jsonConvert.convert<String>(
      json['TEAM_ABBREVIATION']);
  if (teamAbbreviation != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.teamAbbreviation = teamAbbreviation;
  }
  final double? nbaFantasyPts = jsonConvert.convert<double>(
      json['NBA_FANTASY_PTS']);
  if (nbaFantasyPts != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.nbaFantasyPts = nbaFantasyPts;
  }
  final double? fGM = jsonConvert.convert<double>(json['FGM']);
  if (fGM != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fGM = fGM;
  }
  final int? lRank = jsonConvert.convert<int>(json['L_RANK']);
  if (lRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.lRank = lRank;
  }
  final double? wPct = jsonConvert.convert<double>(json['W_PCT']);
  if (wPct != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.wPct = wPct;
  }
  final int? fg3aRank = jsonConvert.convert<int>(json['FG3A_RANK']);
  if (fg3aRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fg3aRank = fg3aRank;
  }
  final String? nICKNAME = jsonConvert.convert<String>(json['NICKNAME']);
  if (nICKNAME != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.nICKNAME = nICKNAME;
  }
  final double? fTA = jsonConvert.convert<double>(json['FTA']);
  if (fTA != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fTA = fTA;
  }
  final int? nbaFantasyPtsRank = jsonConvert.convert<int>(
      json['NBA_FANTASY_PTS_RANK']);
  if (nbaFantasyPtsRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.nbaFantasyPtsRank = nbaFantasyPtsRank;
  }
  final double? mIN = jsonConvert.convert<double>(json['MIN']);
  if (mIN != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.mIN = mIN;
  }
  final int? dD2 = jsonConvert.convert<int>(json['DD2']);
  if (dD2 != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.dD2 = dD2;
  }
  final int? dd2Rank = jsonConvert.convert<int>(json['DD2_RANK']);
  if (dd2Rank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.dd2Rank = dd2Rank;
  }
  final int? playerId = jsonConvert.convert<int>(json['PLAYER_ID']);
  if (playerId != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.playerId = playerId;
  }
  final double? tOV = jsonConvert.convert<double>(json['TOV']);
  if (tOV != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.tOV = tOV;
  }
  final int? fg3mRank = jsonConvert.convert<int>(json['FG3M_RANK']);
  if (fg3mRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fg3mRank = fg3mRank;
  }
  final double? fTM = jsonConvert.convert<double>(json['FTM']);
  if (fTM != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fTM = fTM;
  }
  final int? teamId = jsonConvert.convert<int>(json['TEAM_ID']);
  if (teamId != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.teamId = teamId;
  }
  final double? bLKA = jsonConvert.convert<double>(json['BLKA']);
  if (bLKA != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.bLKA = bLKA;
  }
  final double? bLK = jsonConvert.convert<double>(json['BLK']);
  if (bLK != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.bLK = bLK;
  }
  final double? plusMinus = jsonConvert.convert<double>(json['PLUS_MINUS']);
  if (plusMinus != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.plusMinus = plusMinus;
  }
  final int? tD3 = jsonConvert.convert<int>(json['TD3']);
  if (tD3 != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.tD3 = tD3;
  }
  final int? wRank = jsonConvert.convert<int>(json['W_RANK']);
  if (wRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.wRank = wRank;
  }
  final int? minRank = jsonConvert.convert<int>(json['MIN_RANK']);
  if (minRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.minRank = minRank;
  }
  final double? fgPct = jsonConvert.convert<double>(json['FG_PCT']);
  if (fgPct != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fgPct = fgPct;
  }
  final int? l = jsonConvert.convert<int>(json['L']);
  if (l != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.l = l;
  }
  final double? wnbaFantasyPts = jsonConvert.convert<double>(
      json['WNBA_FANTASY_PTS']);
  if (wnbaFantasyPts != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.wnbaFantasyPts = wnbaFantasyPts;
  }
  final double? pTS = jsonConvert.convert<double>(json['PTS']);
  if (pTS != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.pTS = pTS;
  }
  final double? fG3A = jsonConvert.convert<double>(json['FG3A']);
  if (fG3A != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fG3A = fG3A;
  }
  final int? ftmRank = jsonConvert.convert<int>(json['FTM_RANK']);
  if (ftmRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.ftmRank = ftmRank;
  }
  final int? ftaRank = jsonConvert.convert<int>(json['FTA_RANK']);
  if (ftaRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.ftaRank = ftaRank;
  }
  final int? fgaRank = jsonConvert.convert<int>(json['FGA_RANK']);
  if (fgaRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fgaRank = fgaRank;
  }
  final int? rebRank = jsonConvert.convert<int>(json['REB_RANK']);
  if (rebRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.rebRank = rebRank;
  }
  final int? blkaRank = jsonConvert.convert<int>(json['BLKA_RANK']);
  if (blkaRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.blkaRank = blkaRank;
  }
  final int? w = jsonConvert.convert<int>(json['W']);
  if (w != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.w = w;
  }
  final int? td3Rank = jsonConvert.convert<int>(json['TD3_RANK']);
  if (td3Rank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.td3Rank = td3Rank;
  }
  final double? fG3M = jsonConvert.convert<double>(json['FG3M']);
  if (fG3M != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fG3M = fG3M;
  }
  final double? aGE = jsonConvert.convert<double>(json['AGE']);
  if (aGE != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.aGE = aGE;
  }
  final int? wPctRank = jsonConvert.convert<int>(json['W_PCT_RANK']);
  if (wPctRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.wPctRank = wPctRank;
  }
  final int? astRank = jsonConvert.convert<int>(json['AST_RANK']);
  if (astRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.astRank = astRank;
  }
  final String? playerName = jsonConvert.convert<String>(json['PLAYER_NAME']);
  if (playerName != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.playerName = playerName;
  }
  final double? aST = jsonConvert.convert<double>(json['AST']);
  if (aST != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.aST = aST;
  }
  final double? oREB = jsonConvert.convert<double>(json['OREB']);
  if (oREB != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.oREB = oREB;
  }
  final int? ftPctRank = jsonConvert.convert<int>(json['FT_PCT_RANK']);
  if (ftPctRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.ftPctRank = ftPctRank;
  }
  final int? gP = jsonConvert.convert<int>(json['GP']);
  if (gP != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.gP = gP;
  }
  final int? fgmRank = jsonConvert.convert<int>(json['FGM_RANK']);
  if (fgmRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.fgmRank = fgmRank;
  }
  final double? rEB = jsonConvert.convert<double>(json['REB']);
  if (rEB != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.rEB = rEB;
  }
  final double? ftPct = jsonConvert.convert<double>(json['FT_PCT']);
  if (ftPct != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.ftPct = ftPct;
  }
  final int? wnbaFantasyPtsRank = jsonConvert.convert<int>(
      json['WNBA_FANTASY_PTS_RANK']);
  if (wnbaFantasyPtsRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.wnbaFantasyPtsRank = wnbaFantasyPtsRank;
  }
  final int? ptsRank = jsonConvert.convert<int>(json['PTS_RANK']);
  if (ptsRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.ptsRank = ptsRank;
  }
  final double? pF = jsonConvert.convert<double>(json['PF']);
  if (pF != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.pF = pF;
  }
  final int? gpRank = jsonConvert.convert<int>(json['GP_RANK']);
  if (gpRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.gpRank = gpRank;
  }
  final int? stlRank = jsonConvert.convert<int>(json['STL_RANK']);
  if (stlRank != null) {
    nbaPlayerBaseInfoPlayerPlayoffsMap.stlRank = stlRank;
  }
  return nbaPlayerBaseInfoPlayerPlayoffsMap;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerPlayoffsMapToJson(
    NbaPlayerBaseInfoPlayerPlayoffsMap entity) {
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

extension NbaPlayerBaseInfoPlayerPlayoffsMapExtension on NbaPlayerBaseInfoPlayerPlayoffsMap {
  NbaPlayerBaseInfoPlayerPlayoffsMap copyWith({
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
    return NbaPlayerBaseInfoPlayerPlayoffsMap()
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

NbaPlayerBaseInfoPlayerTrends $NbaPlayerBaseInfoPlayerTrendsFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerTrends nbaPlayerBaseInfoPlayerTrends = NbaPlayerBaseInfoPlayerTrends();
  final int? playerMarketPrice = jsonConvert.convert<int>(
      json['playerMarketPrice']);
  if (playerMarketPrice != null) {
    nbaPlayerBaseInfoPlayerTrends.playerMarketPrice = playerMarketPrice;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoPlayerTrends.createTime = createTime;
  }
  final int? playerScore = jsonConvert.convert<int>(json['playerScore']);
  if (playerScore != null) {
    nbaPlayerBaseInfoPlayerTrends.playerScore = playerScore;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoPlayerTrends.updateTime = updateTime;
  }
  final int? playerStrength = jsonConvert.convert<int>(json['playerStrength']);
  if (playerStrength != null) {
    nbaPlayerBaseInfoPlayerTrends.playerStrength = playerStrength;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoPlayerTrends.playerId = playerId;
  }
  return nbaPlayerBaseInfoPlayerTrends;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerTrendsToJson(
    NbaPlayerBaseInfoPlayerTrends entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerMarketPrice'] = entity.playerMarketPrice;
  data['createTime'] = entity.createTime;
  data['playerScore'] = entity.playerScore;
  data['updateTime'] = entity.updateTime;
  data['playerStrength'] = entity.playerStrength;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoPlayerTrendsExtension on NbaPlayerBaseInfoPlayerTrends {
  NbaPlayerBaseInfoPlayerTrends copyWith({
    int? playerMarketPrice,
    int? createTime,
    int? playerScore,
    int? updateTime,
    int? playerStrength,
    int? playerId,
  }) {
    return NbaPlayerBaseInfoPlayerTrends()
      ..playerMarketPrice = playerMarketPrice ?? this.playerMarketPrice
      ..createTime = createTime ?? this.createTime
      ..playerScore = playerScore ?? this.playerScore
      ..updateTime = updateTime ?? this.updateTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerBaseInfoPlayerNews $NbaPlayerBaseInfoPlayerNewsFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerNews nbaPlayerBaseInfoPlayerNews = NbaPlayerBaseInfoPlayerNews();
  final int? isLike = jsonConvert.convert<int>(json['isLike']);
  if (isLike != null) {
    nbaPlayerBaseInfoPlayerNews.isLike = isLike;
  }
  final int? isView = jsonConvert.convert<int>(json['isView']);
  if (isView != null) {
    nbaPlayerBaseInfoPlayerNews.isView = isView;
  }
  final String? dataLabel = jsonConvert.convert<String>(json['dataLabel']);
  if (dataLabel != null) {
    nbaPlayerBaseInfoPlayerNews.dataLabel = dataLabel;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoPlayerNews.updateTime = updateTime;
  }
  final int? reviewsCount = jsonConvert.convert<int>(json['reviewsCount']);
  if (reviewsCount != null) {
    nbaPlayerBaseInfoPlayerNews.reviewsCount = reviewsCount;
  }
  final String? source = jsonConvert.convert<String>(json['source']);
  if (source != null) {
    nbaPlayerBaseInfoPlayerNews.source = source;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    nbaPlayerBaseInfoPlayerNews.title = title;
  }
  final int? unLikes = jsonConvert.convert<int>(json['unLikes']);
  if (unLikes != null) {
    nbaPlayerBaseInfoPlayerNews.unLikes = unLikes;
  }
  final String? content = jsonConvert.convert<String>(json['content']);
  if (content != null) {
    nbaPlayerBaseInfoPlayerNews.content = content;
  }
  final List<dynamic>? reviewsList = (json['reviewsList'] as List<dynamic>?)
      ?.map(
          (e) => e)
      .toList();
  if (reviewsList != null) {
    nbaPlayerBaseInfoPlayerNews.reviewsList = reviewsList;
  }
  final int? postTime = jsonConvert.convert<int>(json['postTime']);
  if (postTime != null) {
    nbaPlayerBaseInfoPlayerNews.postTime = postTime;
  }
  final int? award = jsonConvert.convert<int>(json['award']);
  if (award != null) {
    nbaPlayerBaseInfoPlayerNews.award = award;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoPlayerNews.createTime = createTime;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nbaPlayerBaseInfoPlayerNews.id = id;
  }
  final int? views = jsonConvert.convert<int>(json['views']);
  if (views != null) {
    nbaPlayerBaseInfoPlayerNews.views = views;
  }
  final int? likes = jsonConvert.convert<int>(json['likes']);
  if (likes != null) {
    nbaPlayerBaseInfoPlayerNews.likes = likes;
  }
  return nbaPlayerBaseInfoPlayerNews;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerNewsToJson(
    NbaPlayerBaseInfoPlayerNews entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isLike'] = entity.isLike;
  data['isView'] = entity.isView;
  data['dataLabel'] = entity.dataLabel;
  data['updateTime'] = entity.updateTime;
  data['reviewsCount'] = entity.reviewsCount;
  data['source'] = entity.source;
  data['title'] = entity.title;
  data['unLikes'] = entity.unLikes;
  data['content'] = entity.content;
  data['reviewsList'] = entity.reviewsList;
  data['postTime'] = entity.postTime;
  data['award'] = entity.award;
  data['createTime'] = entity.createTime;
  data['id'] = entity.id;
  data['views'] = entity.views;
  data['likes'] = entity.likes;
  return data;
}

extension NbaPlayerBaseInfoPlayerNewsExtension on NbaPlayerBaseInfoPlayerNews {
  NbaPlayerBaseInfoPlayerNews copyWith({
    int? isLike,
    int? isView,
    String? dataLabel,
    int? updateTime,
    int? reviewsCount,
    String? source,
    String? title,
    int? unLikes,
    String? content,
    List<dynamic>? reviewsList,
    int? postTime,
    int? award,
    int? createTime,
    int? id,
    int? views,
    int? likes,
  }) {
    return NbaPlayerBaseInfoPlayerNews()
      ..isLike = isLike ?? this.isLike
      ..isView = isView ?? this.isView
      ..dataLabel = dataLabel ?? this.dataLabel
      ..updateTime = updateTime ?? this.updateTime
      ..reviewsCount = reviewsCount ?? this.reviewsCount
      ..source = source ?? this.source
      ..title = title ?? this.title
      ..unLikes = unLikes ?? this.unLikes
      ..content = content ?? this.content
      ..reviewsList = reviewsList ?? this.reviewsList
      ..postTime = postTime ?? this.postTime
      ..award = award ?? this.award
      ..createTime = createTime ?? this.createTime
      ..id = id ?? this.id
      ..views = views ?? this.views
      ..likes = likes ?? this.likes;
  }
}