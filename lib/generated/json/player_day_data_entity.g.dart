import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';

PlayerDayDataEntity $PlayerDayDataEntityFromJson(Map<String, dynamic> json) {
  final PlayerDayDataEntity playerDayDataEntity = PlayerDayDataEntity();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    playerDayDataEntity.blk = blk;
  }
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    playerDayDataEntity.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    playerDayDataEntity.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    playerDayDataEntity.dreb = dreb;
  }
  final double? starterCount =
      jsonConvert.convert<double>(json['starterCount']);
  if (starterCount != null) {
    playerDayDataEntity.starterCount = starterCount;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    playerDayDataEntity.stl = stl;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    playerDayDataEntity.updateTime = updateTime;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    playerDayDataEntity.fgm = fgm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    playerDayDataEntity.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    playerDayDataEntity.threePa = threePa;
  }
  final double? playCount = jsonConvert.convert<double>(json['playCount']);
  if (playCount != null) {
    playerDayDataEntity.playCount = playCount;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    playerDayDataEntity.fta = fta;
  }
  final double? min = jsonConvert.convert<double>(json['min']);
  if (min != null) {
    playerDayDataEntity.min = min;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    playerDayDataEntity.oreb = oreb;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    playerDayDataEntity.createTime = createTime;
  }
  final double? seasonId = jsonConvert.convert<double>(json['seasonId']);
  if (seasonId != null) {
    playerDayDataEntity.seasonId = seasonId;
  }
  final double? pf = jsonConvert.convert<double>(json['pf']);
  if (pf != null) {
    playerDayDataEntity.pf = pf;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    playerDayDataEntity.threePm = threePm;
  }
  final double? to = jsonConvert.convert<double>(json['to']);
  if (to != null) {
    playerDayDataEntity.to = to;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    playerDayDataEntity.ftm = ftm;
  }
  final double? playerId = jsonConvert.convert<double>(json['playerId']);
  if (playerId != null) {
    playerDayDataEntity.playerId = playerId;
  }
  return playerDayDataEntity;
}

Map<String, dynamic> $PlayerDayDataEntityToJson(PlayerDayDataEntity entity) {
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

extension PlayerDayDataEntityExtension on PlayerDayDataEntity {
  PlayerDayDataEntity copyWith({
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
    return PlayerDayDataEntity()
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
