import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_game_info_entity.dart';

import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';


NbaPlayerBaseInfoEntity $NbaPlayerBaseInfoEntityFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoEntity nbaPlayerBaseInfoEntity = NbaPlayerBaseInfoEntity();
  final NbaPlayerBaseInfoPlayerDataAvg? playerDataAvg = jsonConvert.convert<
      NbaPlayerBaseInfoPlayerDataAvg>(json['playerDataAvg']);
  if (playerDataAvg != null) {
    nbaPlayerBaseInfoEntity.playerDataAvg = playerDataAvg;
  }
  final NbaPlayerBaseInfoGuessInfos? guessInfos = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfos>(json['guessInfos']);
  if (guessInfos != null) {
    nbaPlayerBaseInfoEntity.guessInfos = guessInfos;
  }
  final NbaPlayerBaseInfoPlayerBaseInfo? playerBaseInfo = jsonConvert.convert<
      NbaPlayerBaseInfoPlayerBaseInfo>(json['playerBaseInfo']);
  if (playerBaseInfo != null) {
    nbaPlayerBaseInfoEntity.playerBaseInfo = playerBaseInfo;
  }
  final List<
      NbaPlayerBaseInfoL5GameData>? l5GameData = (json['l5GameData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerBaseInfoL5GameData>(
          e) as NbaPlayerBaseInfoL5GameData).toList();
  if (l5GameData != null) {
    nbaPlayerBaseInfoEntity.l5GameData = l5GameData;
  }
  final NbaPlayerBaseInfoL5DataAvg? l5DataAvg = jsonConvert.convert<
      NbaPlayerBaseInfoL5DataAvg>(json['l5DataAvg']);
  if (l5DataAvg != null) {
    nbaPlayerBaseInfoEntity.l5DataAvg = l5DataAvg;
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
  final TradeInfoTradePlayers? tradePlayers = jsonConvert.convert<
      TradeInfoTradePlayers>(json['tradePlayers']);
  if (tradePlayers != null) {
    nbaPlayerBaseInfoEntity.tradePlayers = tradePlayers;
  }
  return nbaPlayerBaseInfoEntity;
}

Map<String, dynamic> $NbaPlayerBaseInfoEntityToJson(
    NbaPlayerBaseInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerDataAvg'] = entity.playerDataAvg.toJson();
  data['guessInfos'] = entity.guessInfos.toJson();
  data['playerBaseInfo'] = entity.playerBaseInfo.toJson();
  data['l5GameData'] = entity.l5GameData.map((v) => v.toJson()).toList();
  data['l5DataAvg'] = entity.l5DataAvg?.toJson();
  data['playerRegularMap'] = entity.playerRegularMap?.toJson();
  data['playerPlayoffsMap'] = entity.playerPlayoffsMap?.toJson();
  data['playerTrends'] = entity.playerTrends.map((v) => v.toJson()).toList();
  data['playerNews'] = entity.playerNews.map((v) => v.toJson()).toList();
  data['tradePlayers'] = entity.tradePlayers?.toJson();
  return data;
}

extension NbaPlayerBaseInfoEntityExtension on NbaPlayerBaseInfoEntity {
  NbaPlayerBaseInfoEntity copyWith({
    NbaPlayerBaseInfoPlayerDataAvg? playerDataAvg,
    NbaPlayerBaseInfoGuessInfos? guessInfos,
    NbaPlayerBaseInfoPlayerBaseInfo? playerBaseInfo,
    List<NbaPlayerBaseInfoL5GameData>? l5GameData,
    NbaPlayerBaseInfoL5DataAvg? l5DataAvg,
    NbaPlayerBaseInfoPlayerRegularMap? playerRegularMap,
    NbaPlayerBaseInfoPlayerPlayoffsMap? playerPlayoffsMap,
    List<NbaPlayerBaseInfoPlayerTrends>? playerTrends,
    List<NbaPlayerBaseInfoPlayerNews>? playerNews,
    TradeInfoTradePlayers? tradePlayers,
  }) {
    return NbaPlayerBaseInfoEntity()
      ..playerDataAvg = playerDataAvg ?? this.playerDataAvg
      ..guessInfos = guessInfos ?? this.guessInfos
      ..playerBaseInfo = playerBaseInfo ?? this.playerBaseInfo
      ..l5GameData = l5GameData ?? this.l5GameData
      ..l5DataAvg = l5DataAvg ?? this.l5DataAvg
      ..playerRegularMap = playerRegularMap ?? this.playerRegularMap
      ..playerPlayoffsMap = playerPlayoffsMap ?? this.playerPlayoffsMap
      ..playerTrends = playerTrends ?? this.playerTrends
      ..playerNews = playerNews ?? this.playerNews
      ..tradePlayers = tradePlayers ?? this.tradePlayers;
  }
}

NbaPlayerBaseInfoPlayerDataAvg $NbaPlayerBaseInfoPlayerDataAvgFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoPlayerDataAvg nbaPlayerBaseInfoPlayerDataAvg = NbaPlayerBaseInfoPlayerDataAvg();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoPlayerDataAvg.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoPlayerDataAvg.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoPlayerDataAvg.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoPlayerDataAvg.dreb = dreb;
  }
  final int? starterCount = jsonConvert.convert<int>(json['starterCount']);
  if (starterCount != null) {
    nbaPlayerBaseInfoPlayerDataAvg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoPlayerDataAvg.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoPlayerDataAvg.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoPlayerDataAvg.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoPlayerDataAvg.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoPlayerDataAvg.threePa = threePa;
  }
  final int? playCount = jsonConvert.convert<int>(json['playCount']);
  if (playCount != null) {
    nbaPlayerBaseInfoPlayerDataAvg.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoPlayerDataAvg.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoPlayerDataAvg.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoPlayerDataAvg.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoPlayerDataAvg.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    nbaPlayerBaseInfoPlayerDataAvg.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoPlayerDataAvg.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoPlayerDataAvg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoPlayerDataAvg.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoPlayerDataAvg.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoPlayerDataAvg.playerId = playerId;
  }
  return nbaPlayerBaseInfoPlayerDataAvg;
}

Map<String, dynamic> $NbaPlayerBaseInfoPlayerDataAvgToJson(
    NbaPlayerBaseInfoPlayerDataAvg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['playCount'] = entity.playCount;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoPlayerDataAvgExtension on NbaPlayerBaseInfoPlayerDataAvg {
  NbaPlayerBaseInfoPlayerDataAvg copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    int? starterCount,
    double? stl,
    int? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    int? playCount,
    double? fta,
    double? min,
    double? oreb,
    int? createTime,
    int? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    int? playerId,
  }) {
    return NbaPlayerBaseInfoPlayerDataAvg()
      ..blk = blk ?? this.blk
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..playCount = playCount ?? this.playCount
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerBaseInfoGuessInfos $NbaPlayerBaseInfoGuessInfosFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfos nbaPlayerBaseInfoGuessInfos = NbaPlayerBaseInfoGuessInfos();
  final NbaPlayerBaseInfoGuessInfosProperty? threePm = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfosProperty>(json['3pm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfos.threePm = threePm;
  }
  final NbaPlayerBaseInfoGuessInfosProperty? ast = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfosProperty>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfos.ast = ast;
  }
  final NbaPlayerBaseInfoGuessInfosProperty? reb = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfosProperty>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfos.reb = reb;
  }
  final NbaPlayerBaseInfoGuessInfosProperty? pts = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfosProperty>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfos.pts = pts;
  }
  return nbaPlayerBaseInfoGuessInfos;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosToJson(
    NbaPlayerBaseInfoGuessInfos entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['3pm'] = entity.threePm?.toJson();
  data['ast'] = entity.ast?.toJson();
  data['reb'] = entity.reb?.toJson();
  data['pts'] = entity.pts?.toJson();
  return data;
}

extension NbaPlayerBaseInfoGuessInfosExtension on NbaPlayerBaseInfoGuessInfos {
  NbaPlayerBaseInfoGuessInfos copyWith({
    NbaPlayerBaseInfoGuessInfosProperty? threePm,
    NbaPlayerBaseInfoGuessInfosProperty? ast,
    NbaPlayerBaseInfoGuessInfosProperty? reb,
    NbaPlayerBaseInfoGuessInfosProperty? pts,
  }) {
    return NbaPlayerBaseInfoGuessInfos()
      ..threePm = threePm ?? this.threePm
      ..ast = ast ?? this.ast
      ..reb = reb ?? this.reb
      ..pts = pts ?? this.pts;
  }
}

NbaPlayerBaseInfoGuessInfosAstCommunityPick $NbaPlayerBaseInfoGuessInfosAstCommunityPickFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosAstCommunityPick nbaPlayerBaseInfoGuessInfosAstCommunityPick = NbaPlayerBaseInfoGuessInfosAstCommunityPick();
  final int? moreCount = jsonConvert.convert<int>(json['moreCount']);
  if (moreCount != null) {
    nbaPlayerBaseInfoGuessInfosAstCommunityPick.moreCount = moreCount;
  }
  final int? lessCount = jsonConvert.convert<int>(json['lessCount']);
  if (lessCount != null) {
    nbaPlayerBaseInfoGuessInfosAstCommunityPick.lessCount = lessCount;
  }
  return nbaPlayerBaseInfoGuessInfosAstCommunityPick;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosAstCommunityPickToJson(
    NbaPlayerBaseInfoGuessInfosAstCommunityPick entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moreCount'] = entity.moreCount;
  data['lessCount'] = entity.lessCount;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosAstCommunityPickExtension on NbaPlayerBaseInfoGuessInfosAstCommunityPick {
  NbaPlayerBaseInfoGuessInfosAstCommunityPick copyWith({
    int? moreCount,
    int? lessCount,
  }) {
    return NbaPlayerBaseInfoGuessInfosAstCommunityPick()
      ..moreCount = moreCount ?? this.moreCount
      ..lessCount = lessCount ?? this.lessCount;
  }
}

NbaPlayerBaseInfoGuessInfosAstPicks $NbaPlayerBaseInfoGuessInfosAstPicksFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosAstPicks nbaPlayerBaseInfoGuessInfosAstPicks = NbaPlayerBaseInfoGuessInfosAstPicks();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.newsId = newsId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.gameStartTime = gameStartTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.guessData = guessData;
  }
  final NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.guessReferenceValue =
        guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosAstPicks.playerId = playerId;
  }
  return nbaPlayerBaseInfoGuessInfosAstPicks;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosAstPicksToJson(
    NbaPlayerBaseInfoGuessInfosAstPicks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosAstPicksExtension on NbaPlayerBaseInfoGuessInfosAstPicks {
  NbaPlayerBaseInfoGuessInfosAstPicks copyWith({
    int? gameId,
    int? newsId,
    int? gameStartTime,
    int? teamId,
    List<dynamic>? guessData,
    NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NbaPlayerBaseInfoGuessInfosAstPicks()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue $NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue = NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue.ast = ast;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue.threePm = threePm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue.reb = reb;
  }
  return nbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue;
}

Map<String,
    dynamic> $NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValueToJson(
    NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['threePm'] = entity.threePm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValueExtension on NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue {
  NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue copyWith({
    double? ast,
    double? threePm,
    int? pts,
    int? reb,
  }) {
    return NbaPlayerBaseInfoGuessInfosAstPicksGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..threePm = threePm ?? this.threePm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

NbaPlayerBaseInfoGuessInfosAstTwoTeamGames $NbaPlayerBaseInfoGuessInfosAstTwoTeamGamesFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosAstTwoTeamGames nbaPlayerBaseInfoGuessInfosAstTwoTeamGames = NbaPlayerBaseInfoGuessInfosAstTwoTeamGames();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.espnId = espnId;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.fgm = fgm;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.reb = reb;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.min = min;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.isStarter = isStarter;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.gameId = gameId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.threePa = threePa;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.ename = ename;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosAstTwoTeamGames.awayTeamId = awayTeamId;
  }
  return nbaPlayerBaseInfoGuessInfosAstTwoTeamGames;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosAstTwoTeamGamesToJson(
    NbaPlayerBaseInfoGuessInfosAstTwoTeamGames entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['fgm'] = entity.fgm;
  data['reb'] = entity.reb;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['isStarter'] = entity.isStarter;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['ename'] = entity.ename;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosAstTwoTeamGamesExtension on NbaPlayerBaseInfoGuessInfosAstTwoTeamGames {
  NbaPlayerBaseInfoGuessInfosAstTwoTeamGames copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? fgm,
    int? reb,
    int? fta,
    int? min,
    bool? isStarter,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    String? ename,
    int? oreb,
    int? createTime,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
    int? awayTeamId,
  }) {
    return NbaPlayerBaseInfoGuessInfosAstTwoTeamGames()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..fgm = fgm ?? this.fgm
      ..reb = reb ?? this.reb
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..isStarter = isStarter ?? this.isStarter
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..ename = ename ?? this.ename
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId;
  }
}

NbaPlayerBaseInfoGuessInfosReb $NbaPlayerBaseInfoGuessInfosRebFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosReb nbaPlayerBaseInfoGuessInfosReb = NbaPlayerBaseInfoGuessInfosReb();
  final NbaPlayerBaseInfoGuessInfosRebCommunityPick? communityPick = jsonConvert
      .convert<NbaPlayerBaseInfoGuessInfosRebCommunityPick>(
      json['communityPick']);
  if (communityPick != null) {
    nbaPlayerBaseInfoGuessInfosReb.communityPick = communityPick;
  }
  final NbaPlayerBaseInfoGuessInfosRebPicks? picks = jsonConvert.convert<
      NbaPlayerBaseInfoGuessInfosRebPicks>(json['picks']);
  if (picks != null) {
    nbaPlayerBaseInfoGuessInfosReb.picks = picks;
  }
  final List<
      NbaPlayerBaseInfoGuessInfosRebTwoTeamGames>? twoTeamGames = (json['twoTeamGames'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerBaseInfoGuessInfosRebTwoTeamGames>(
          e) as NbaPlayerBaseInfoGuessInfosRebTwoTeamGames).toList();
  if (twoTeamGames != null) {
    nbaPlayerBaseInfoGuessInfosReb.twoTeamGames = twoTeamGames;
  }
  return nbaPlayerBaseInfoGuessInfosReb;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosRebToJson(
    NbaPlayerBaseInfoGuessInfosReb entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['communityPick'] = entity.communityPick.toJson();
  data['picks'] = entity.picks.toJson();
  data['twoTeamGames'] = entity.twoTeamGames.map((v) => v.toJson()).toList();
  return data;
}

extension NbaPlayerBaseInfoGuessInfosRebExtension on NbaPlayerBaseInfoGuessInfosReb {
  NbaPlayerBaseInfoGuessInfosReb copyWith({
    NbaPlayerBaseInfoGuessInfosRebCommunityPick? communityPick,
    NbaPlayerBaseInfoGuessInfosRebPicks? picks,
    List<NbaPlayerBaseInfoGuessInfosRebTwoTeamGames>? twoTeamGames,
  }) {
    return NbaPlayerBaseInfoGuessInfosReb()
      ..communityPick = communityPick ?? this.communityPick
      ..picks = picks ?? this.picks
      ..twoTeamGames = twoTeamGames ?? this.twoTeamGames;
  }
}

NbaPlayerBaseInfoGuessInfosRebCommunityPick $NbaPlayerBaseInfoGuessInfosRebCommunityPickFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosRebCommunityPick nbaPlayerBaseInfoGuessInfosRebCommunityPick = NbaPlayerBaseInfoGuessInfosRebCommunityPick();
  final int? moreCount = jsonConvert.convert<int>(json['moreCount']);
  if (moreCount != null) {
    nbaPlayerBaseInfoGuessInfosRebCommunityPick.moreCount = moreCount;
  }
  final int? lessCount = jsonConvert.convert<int>(json['lessCount']);
  if (lessCount != null) {
    nbaPlayerBaseInfoGuessInfosRebCommunityPick.lessCount = lessCount;
  }
  return nbaPlayerBaseInfoGuessInfosRebCommunityPick;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosRebCommunityPickToJson(
    NbaPlayerBaseInfoGuessInfosRebCommunityPick entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moreCount'] = entity.moreCount;
  data['lessCount'] = entity.lessCount;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosRebCommunityPickExtension on NbaPlayerBaseInfoGuessInfosRebCommunityPick {
  NbaPlayerBaseInfoGuessInfosRebCommunityPick copyWith({
    int? moreCount,
    int? lessCount,
  }) {
    return NbaPlayerBaseInfoGuessInfosRebCommunityPick()
      ..moreCount = moreCount ?? this.moreCount
      ..lessCount = lessCount ?? this.lessCount;
  }
}

NbaPlayerBaseInfoGuessInfosRebPicks $NbaPlayerBaseInfoGuessInfosRebPicksFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosRebPicks nbaPlayerBaseInfoGuessInfosRebPicks = NbaPlayerBaseInfoGuessInfosRebPicks();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.newsId = newsId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.gameStartTime = gameStartTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.guessData = guessData;
  }
  final NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.guessReferenceValue =
        guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosRebPicks.playerId = playerId;
  }
  return nbaPlayerBaseInfoGuessInfosRebPicks;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosRebPicksToJson(
    NbaPlayerBaseInfoGuessInfosRebPicks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosRebPicksExtension on NbaPlayerBaseInfoGuessInfosRebPicks {
  NbaPlayerBaseInfoGuessInfosRebPicks copyWith({
    int? gameId,
    int? newsId,
    int? gameStartTime,
    int? teamId,
    List<dynamic>? guessData,
    NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NbaPlayerBaseInfoGuessInfosRebPicks()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue $NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue = NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue.ast = ast;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue.threePm = threePm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue.reb = reb;
  }
  return nbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue;
}

Map<String,
    dynamic> $NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValueToJson(
    NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['threePm'] = entity.threePm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValueExtension on NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue {
  NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue copyWith({
    double? ast,
    double? threePm,
    int? pts,
    int? reb,
  }) {
    return NbaPlayerBaseInfoGuessInfosRebPicksGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..threePm = threePm ?? this.threePm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

NbaPlayerBaseInfoGuessInfosRebTwoTeamGames $NbaPlayerBaseInfoGuessInfosRebTwoTeamGamesFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosRebTwoTeamGames nbaPlayerBaseInfoGuessInfosRebTwoTeamGames = NbaPlayerBaseInfoGuessInfosRebTwoTeamGames();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.espnId = espnId;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.fgm = fgm;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.reb = reb;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.min = min;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.isStarter = isStarter;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.gameId = gameId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.threePa = threePa;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.ename = ename;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosRebTwoTeamGames.awayTeamId = awayTeamId;
  }
  return nbaPlayerBaseInfoGuessInfosRebTwoTeamGames;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosRebTwoTeamGamesToJson(
    NbaPlayerBaseInfoGuessInfosRebTwoTeamGames entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['fgm'] = entity.fgm;
  data['reb'] = entity.reb;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['isStarter'] = entity.isStarter;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['ename'] = entity.ename;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosRebTwoTeamGamesExtension on NbaPlayerBaseInfoGuessInfosRebTwoTeamGames {
  NbaPlayerBaseInfoGuessInfosRebTwoTeamGames copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? fgm,
    int? reb,
    int? fta,
    int? min,
    bool? isStarter,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    String? ename,
    int? oreb,
    int? createTime,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
    int? awayTeamId,
  }) {
    return NbaPlayerBaseInfoGuessInfosRebTwoTeamGames()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..fgm = fgm ?? this.fgm
      ..reb = reb ?? this.reb
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..isStarter = isStarter ?? this.isStarter
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..ename = ename ?? this.ename
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId;
  }
}

NbaPlayerBaseInfoGuessInfosProperty $NbaPlayerBaseInfoGuessInfosPropertyFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosProperty nbaPlayerBaseInfoGuessInfosProperty = NbaPlayerBaseInfoGuessInfosProperty();
  final NbaPlayerBaseInfoGuessInfosPtsCommunityPick? communityPick = jsonConvert
      .convert<NbaPlayerBaseInfoGuessInfosPtsCommunityPick>(
      json['communityPick']);
  if (communityPick != null) {
    nbaPlayerBaseInfoGuessInfosProperty.communityPick = communityPick;
  }
  final GuessGameInfoEntity? picks = jsonConvert.convert<GuessGameInfoEntity>(
      json['picks']);
  if (picks != null) {
    nbaPlayerBaseInfoGuessInfosProperty.picks = picks;
  }
  final List<
      NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames>? twoTeamGames = (json['twoTeamGames'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames>(
          e) as NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames).toList();
  if (twoTeamGames != null) {
    nbaPlayerBaseInfoGuessInfosProperty.twoTeamGames = twoTeamGames;
  }
  return nbaPlayerBaseInfoGuessInfosProperty;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosPropertyToJson(
    NbaPlayerBaseInfoGuessInfosProperty entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['communityPick'] = entity.communityPick?.toJson();
  data['picks'] = entity.picks?.toJson();
  data['twoTeamGames'] = entity.twoTeamGames?.map((v) => v.toJson()).toList();
  return data;
}

extension NbaPlayerBaseInfoGuessInfosPropertyExtension on NbaPlayerBaseInfoGuessInfosProperty {
  NbaPlayerBaseInfoGuessInfosProperty copyWith({
    NbaPlayerBaseInfoGuessInfosPtsCommunityPick? communityPick,
    GuessGameInfoEntity? picks,
    List<NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames>? twoTeamGames,
  }) {
    return NbaPlayerBaseInfoGuessInfosProperty()
      ..communityPick = communityPick ?? this.communityPick
      ..picks = picks ?? this.picks
      ..twoTeamGames = twoTeamGames ?? this.twoTeamGames;
  }
}

NbaPlayerBaseInfoGuessInfosPtsCommunityPick $NbaPlayerBaseInfoGuessInfosPtsCommunityPickFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosPtsCommunityPick nbaPlayerBaseInfoGuessInfosPtsCommunityPick = NbaPlayerBaseInfoGuessInfosPtsCommunityPick();
  final int? moreCount = jsonConvert.convert<int>(json['moreCount']);
  if (moreCount != null) {
    nbaPlayerBaseInfoGuessInfosPtsCommunityPick.moreCount = moreCount;
  }
  final int? lessCount = jsonConvert.convert<int>(json['lessCount']);
  if (lessCount != null) {
    nbaPlayerBaseInfoGuessInfosPtsCommunityPick.lessCount = lessCount;
  }
  return nbaPlayerBaseInfoGuessInfosPtsCommunityPick;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosPtsCommunityPickToJson(
    NbaPlayerBaseInfoGuessInfosPtsCommunityPick entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['moreCount'] = entity.moreCount;
  data['lessCount'] = entity.lessCount;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosPtsCommunityPickExtension on NbaPlayerBaseInfoGuessInfosPtsCommunityPick {
  NbaPlayerBaseInfoGuessInfosPtsCommunityPick copyWith({
    int? moreCount,
    int? lessCount,
  }) {
    return NbaPlayerBaseInfoGuessInfosPtsCommunityPick()
      ..moreCount = moreCount ?? this.moreCount
      ..lessCount = lessCount ?? this.lessCount;
  }
}

NbaPlayerBaseInfoGuessInfosPtsPicks $NbaPlayerBaseInfoGuessInfosPtsPicksFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosPtsPicks nbaPlayerBaseInfoGuessInfosPtsPicks = NbaPlayerBaseInfoGuessInfosPtsPicks();
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.gameId = gameId;
  }
  final int? newsId = jsonConvert.convert<int>(json['newsId']);
  if (newsId != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.newsId = newsId;
  }
  final int? gameStartTime = jsonConvert.convert<int>(json['gameStartTime']);
  if (gameStartTime != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.gameStartTime = gameStartTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.teamId = teamId;
  }
  final List<dynamic>? guessData = (json['guessData'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (guessData != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.guessData = guessData;
  }
  final NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue? guessReferenceValue = jsonConvert
      .convert<NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue>(
      json['guessReferenceValue']);
  if (guessReferenceValue != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.guessReferenceValue =
        guessReferenceValue;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.type = type;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.awayTeamId = awayTeamId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicks.playerId = playerId;
  }
  return nbaPlayerBaseInfoGuessInfosPtsPicks;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosPtsPicksToJson(
    NbaPlayerBaseInfoGuessInfosPtsPicks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['gameId'] = entity.gameId;
  data['newsId'] = entity.newsId;
  data['gameStartTime'] = entity.gameStartTime;
  data['teamId'] = entity.teamId;
  data['guessData'] = entity.guessData;
  data['guessReferenceValue'] = entity.guessReferenceValue.toJson();
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['awayTeamId'] = entity.awayTeamId;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosPtsPicksExtension on NbaPlayerBaseInfoGuessInfosPtsPicks {
  NbaPlayerBaseInfoGuessInfosPtsPicks copyWith({
    int? gameId,
    int? newsId,
    int? gameStartTime,
    int? teamId,
    List<dynamic>? guessData,
    NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue? guessReferenceValue,
    int? id,
    int? type,
    int? awayTeamId,
    int? playerId,
  }) {
    return NbaPlayerBaseInfoGuessInfosPtsPicks()
      ..gameId = gameId ?? this.gameId
      ..newsId = newsId ?? this.newsId
      ..gameStartTime = gameStartTime ?? this.gameStartTime
      ..teamId = teamId ?? this.teamId
      ..guessData = guessData ?? this.guessData
      ..guessReferenceValue = guessReferenceValue ?? this.guessReferenceValue
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..awayTeamId = awayTeamId ?? this.awayTeamId
      ..playerId = playerId ?? this.playerId;
  }
}

NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue $NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValueFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue = NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue();
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue.ast = ast;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue.threePm = threePm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue.reb = reb;
  }
  return nbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue;
}

Map<String,
    dynamic> $NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValueToJson(
    NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ast'] = entity.ast;
  data['threePm'] = entity.threePm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValueExtension on NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue {
  NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue copyWith({
    double? ast,
    double? threePm,
    int? pts,
    int? reb,
  }) {
    return NbaPlayerBaseInfoGuessInfosPtsPicksGuessReferenceValue()
      ..ast = ast ?? this.ast
      ..threePm = threePm ?? this.threePm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames $NbaPlayerBaseInfoGuessInfosPtsTwoTeamGamesFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames = NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames();
  final int? fga = jsonConvert.convert<int>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.fga = fga;
  }
  final int? ast = jsonConvert.convert<int>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.ast = ast;
  }
  final int? dreb = jsonConvert.convert<int>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.dreb = dreb;
  }
  final int? espnId = jsonConvert.convert<int>(json['espnId']);
  if (espnId != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.espnId = espnId;
  }
  final int? fgm = jsonConvert.convert<int>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.fgm = fgm;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.reb = reb;
  }
  final int? fta = jsonConvert.convert<int>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.min = min;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.isStarter = isStarter;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.playerId = playerId;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.blk = blk;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.gameId = gameId;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.updateTime = updateTime;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.pts = pts;
  }
  final int? threePa = jsonConvert.convert<int>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.threePa = threePa;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.ename = ename;
  }
  final int? oreb = jsonConvert.convert<int>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.pf = pf;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.teamId = teamId;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames.awayTeamId = awayTeamId;
  }
  return nbaPlayerBaseInfoGuessInfosPtsTwoTeamGames;
}

Map<String, dynamic> $NbaPlayerBaseInfoGuessInfosPtsTwoTeamGamesToJson(
    NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['espnId'] = entity.espnId;
  data['fgm'] = entity.fgm;
  data['reb'] = entity.reb;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['isStarter'] = entity.isStarter;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['gameId'] = entity.gameId;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['ename'] = entity.ename;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['teamId'] = entity.teamId;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['awayTeamId'] = entity.awayTeamId;
  return data;
}

extension NbaPlayerBaseInfoGuessInfosPtsTwoTeamGamesExtension on NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames {
  NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames copyWith({
    int? fga,
    int? ast,
    int? dreb,
    int? espnId,
    int? fgm,
    int? reb,
    int? fta,
    int? min,
    bool? isStarter,
    int? ftm,
    int? playerId,
    int? blk,
    int? gameId,
    int? stl,
    int? updateTime,
    int? pts,
    int? threePa,
    String? ename,
    int? oreb,
    int? createTime,
    int? pf,
    int? teamId,
    int? threePm,
    int? to,
    int? awayTeamId,
  }) {
    return NbaPlayerBaseInfoGuessInfosPtsTwoTeamGames()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..espnId = espnId ?? this.espnId
      ..fgm = fgm ?? this.fgm
      ..reb = reb ?? this.reb
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..isStarter = isStarter ?? this.isStarter
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..gameId = gameId ?? this.gameId
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..ename = ename ?? this.ename
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..teamId = teamId ?? this.teamId
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..awayTeamId = awayTeamId ?? this.awayTeamId;
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
  final int? beforeMarketPriceUpdateTime = jsonConvert.convert<int>(
      json['beforeMarketPriceUpdateTime']);
  if (beforeMarketPriceUpdateTime != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.beforeMarketPriceUpdateTime =
        beforeMarketPriceUpdateTime;
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
  final int? nbaId = jsonConvert.convert<int>(json['nbaId']);
  if (nbaId != null) {
    nbaPlayerBaseInfoPlayerBaseInfo.nbaId = nbaId;
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
  data['beforeMarketPriceUpdateTime'] = entity.beforeMarketPriceUpdateTime;
  data['birthTime'] = entity.birthTime;
  data['playerStrength'] = entity.playerStrength;
  data['elname'] = entity.elname;
  data['salary'] = entity.salary;
  data['minPlayerScore'] = entity.minPlayerScore;
  data['nbaId'] = entity.nbaId;
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
    int? beforeMarketPriceUpdateTime,
    int? birthTime,
    int? playerStrength,
    String? elname,
    int? salary,
    int? minPlayerScore,
    int? nbaId,
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
      ..beforeMarketPriceUpdateTime = beforeMarketPriceUpdateTime ??
          this.beforeMarketPriceUpdateTime
      ..birthTime = birthTime ?? this.birthTime
      ..playerStrength = playerStrength ?? this.playerStrength
      ..elname = elname ?? this.elname
      ..salary = salary ?? this.salary
      ..minPlayerScore = minPlayerScore ?? this.minPlayerScore
      ..nbaId = nbaId ?? this.nbaId
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

NbaPlayerBaseInfoL5GameData $NbaPlayerBaseInfoL5GameDataFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoL5GameData nbaPlayerBaseInfoL5GameData = NbaPlayerBaseInfoL5GameData();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoL5GameData.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoL5GameData.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoL5GameData.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoL5GameData.dreb = dreb;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoL5GameData.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoL5GameData.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoL5GameData.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoL5GameData.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoL5GameData.threePa = threePa;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoL5GameData.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoL5GameData.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoL5GameData.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoL5GameData.createTime = createTime;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoL5GameData.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoL5GameData.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoL5GameData.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoL5GameData.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoL5GameData.playerId = playerId;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerBaseInfoL5GameData.awayTeamId = awayTeamId;
  }
  return nbaPlayerBaseInfoL5GameData;
}

Map<String, dynamic> $NbaPlayerBaseInfoL5GameDataToJson(
    NbaPlayerBaseInfoL5GameData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['awayTeamId'] = entity.awayTeamId;
  return data;
}

extension NbaPlayerBaseInfoL5GameDataExtension on NbaPlayerBaseInfoL5GameData {
  NbaPlayerBaseInfoL5GameData copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    double? stl,
    int? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    double? fta,
    double? min,
    double? oreb,
    int? createTime,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    int? playerId,
    int? awayTeamId,
  }) {
    return NbaPlayerBaseInfoL5GameData()
      ..blk = blk ?? this.blk
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..awayTeamId = awayTeamId ?? this.awayTeamId;
  }
}

NbaPlayerBaseInfoL5DataAvg $NbaPlayerBaseInfoL5DataAvgFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerBaseInfoL5DataAvg nbaPlayerBaseInfoL5DataAvg = NbaPlayerBaseInfoL5DataAvg();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerBaseInfoL5DataAvg.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerBaseInfoL5DataAvg.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerBaseInfoL5DataAvg.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerBaseInfoL5DataAvg.dreb = dreb;
  }
  final double? starterCount = jsonConvert.convert<double>(
      json['starterCount']);
  if (starterCount != null) {
    nbaPlayerBaseInfoL5DataAvg.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerBaseInfoL5DataAvg.stl = stl;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerBaseInfoL5DataAvg.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerBaseInfoL5DataAvg.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerBaseInfoL5DataAvg.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerBaseInfoL5DataAvg.threePa = threePa;
  }
  final double? playCount = jsonConvert.convert<double>(json['playCount']);
  if (playCount != null) {
    nbaPlayerBaseInfoL5DataAvg.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerBaseInfoL5DataAvg.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerBaseInfoL5DataAvg.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerBaseInfoL5DataAvg.oreb = oreb;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    nbaPlayerBaseInfoL5DataAvg.createTime = createTime;
  }
  final double? seasonId = jsonConvert.convert<double>(json['seasonId']);
  if (seasonId != null) {
    nbaPlayerBaseInfoL5DataAvg.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerBaseInfoL5DataAvg.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerBaseInfoL5DataAvg.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerBaseInfoL5DataAvg.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerBaseInfoL5DataAvg.ftm = ftm;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    nbaPlayerBaseInfoL5DataAvg.playerId = playerId;
  }
  return nbaPlayerBaseInfoL5DataAvg;
}

Map<String, dynamic> $NbaPlayerBaseInfoL5DataAvgToJson(
    NbaPlayerBaseInfoL5DataAvg entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['starterCount'] = entity.starterCount;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['fgm'] = entity.fgm;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['playCount'] = entity.playCount;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['pf'] = entity.pf;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  return data;
}

extension NbaPlayerBaseInfoL5DataAvgExtension on NbaPlayerBaseInfoL5DataAvg {
  NbaPlayerBaseInfoL5DataAvg copyWith({
    double? blk,
    double? fga,
    double? ast,
    double? dreb,
    double? starterCount,
    double? stl,
    double? updateTime,
    double? fgm,
    double? pts,
    double? threePa,
    double? playCount,
    double? fta,
    double? min,
    double? oreb,
    double? createTime,
    double? seasonId,
    double? pf,
    double? threePm,
    double? to,
    double? ftm,
    double? playerId,
  }) {
    return NbaPlayerBaseInfoL5DataAvg()
      ..blk = blk ?? this.blk
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..starterCount = starterCount ?? this.starterCount
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..fgm = fgm ?? this.fgm
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..playCount = playCount ?? this.playCount
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..pf = pf ?? this.pf
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId;
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