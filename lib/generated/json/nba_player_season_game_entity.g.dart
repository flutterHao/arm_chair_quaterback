import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_season_game_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nab_player_season_game_rank_entity.dart';


NbaPlayerSeasonEntity $NbaPlayerSeasonEntityFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerSeasonEntity nbaPlayerSeasonEntity = NbaPlayerSeasonEntity();
  final List<
      NbaPlayerSeasonGameEntity>? playerGameData = (json['playerGameData'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<NbaPlayerSeasonGameEntity>(
          e) as NbaPlayerSeasonGameEntity).toList();
  if (playerGameData != null) {
    nbaPlayerSeasonEntity.playerGameData = playerGameData;
  }
  final NabPlayerSeasonGameRankEntity? playerRank = jsonConvert.convert<
      NabPlayerSeasonGameRankEntity>(json['playerRank']);
  if (playerRank != null) {
    nbaPlayerSeasonEntity.playerRank = playerRank;
  }
  return nbaPlayerSeasonEntity;
}

Map<String, dynamic> $NbaPlayerSeasonEntityToJson(
    NbaPlayerSeasonEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['playerGameData'] =
      entity.playerGameData.map((v) => v.toJson()).toList();
  data['playerRank'] = entity.playerRank.toJson();
  return data;
}

extension NbaPlayerSeasonEntityExtension on NbaPlayerSeasonEntity {
  NbaPlayerSeasonEntity copyWith({
    List<NbaPlayerSeasonGameEntity>? playerGameData,
    NabPlayerSeasonGameRankEntity? playerRank,
  }) {
    return NbaPlayerSeasonEntity()
      ..playerGameData = playerGameData ?? this.playerGameData
      ..playerRank = playerRank ?? this.playerRank;
  }
}

NbaPlayerSeasonGameEntity $NbaPlayerSeasonGameEntityFromJson(
    Map<String, dynamic> json) {
  final NbaPlayerSeasonGameEntity nbaPlayerSeasonGameEntity = NbaPlayerSeasonGameEntity();
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    nbaPlayerSeasonGameEntity.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    nbaPlayerSeasonGameEntity.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    nbaPlayerSeasonGameEntity.dreb = dreb;
  }
  final double? espnId = jsonConvert.convert<double>(json['espnId']);
  if (espnId != null) {
    nbaPlayerSeasonGameEntity.espnId = espnId;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    nbaPlayerSeasonGameEntity.fgm = fgm;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    nbaPlayerSeasonGameEntity.reb = reb;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    nbaPlayerSeasonGameEntity.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    nbaPlayerSeasonGameEntity.min = min;
  }
  final bool? isStarter = jsonConvert.convert<bool>(json['isStarter']);
  if (isStarter != null) {
    nbaPlayerSeasonGameEntity.isStarter = isStarter;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    nbaPlayerSeasonGameEntity.ftm = ftm;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    nbaPlayerSeasonGameEntity.playerId = playerId;
  }
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    nbaPlayerSeasonGameEntity.blk = blk;
  }
  final double? gameId = jsonConvert.convert<double>(json['gameId']);
  if (gameId != null) {
    nbaPlayerSeasonGameEntity.gameId = gameId;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    nbaPlayerSeasonGameEntity.stl = stl;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    nbaPlayerSeasonGameEntity.updateTime = updateTime;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    nbaPlayerSeasonGameEntity.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    nbaPlayerSeasonGameEntity.threePa = threePa;
  }
  final String? ename = jsonConvert.convert<String>(json['ename']);
  if (ename != null) {
    nbaPlayerSeasonGameEntity.ename = ename;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    nbaPlayerSeasonGameEntity.oreb = oreb;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    nbaPlayerSeasonGameEntity.createTime = createTime;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    nbaPlayerSeasonGameEntity.pf = pf;
  }
  final double? teamId = jsonConvert.convert<double>(json['teamId']);
  if (teamId != null) {
    nbaPlayerSeasonGameEntity.teamId = teamId;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    nbaPlayerSeasonGameEntity.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    nbaPlayerSeasonGameEntity.to = to;
  }
  final int? awayTeamId = jsonConvert.convert<int>(json['awayTeamId']);
  if (awayTeamId != null) {
    nbaPlayerSeasonGameEntity.awayTeamId = awayTeamId;
  }
  return nbaPlayerSeasonGameEntity;
}

Map<String, dynamic> $NbaPlayerSeasonGameEntityToJson(
    NbaPlayerSeasonGameEntity entity) {
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

extension NbaPlayerSeasonGameEntityExtension on NbaPlayerSeasonGameEntity {
  NbaPlayerSeasonGameEntity copyWith({
    double? fga,
    double? ast,
    double? dreb,
    double? espnId,
    double? fgm,
    double? reb,
    double? fta,
    double? min,
    bool? isStarter,
    double? ftm,
    double? playerId,
    double? blk,
    double? gameId,
    double? stl,
    double? updateTime,
    double? pts,
    double? threePa,
    String? ename,
    double? oreb,
    double? createTime,
    double? pf,
    double? teamId,
    double? threePm,
    double? to,
    int? awayTeamId,
  }) {
    return NbaPlayerSeasonGameEntity()
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