import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/per_game_entity.dart';

PerGameEntity $PerGameEntityFromJson(Map<String, dynamic> json) {
  final PerGameEntity perGameEntity = PerGameEntity();
  final double? fga = jsonConvert.convert<double>(json['fga']);
  if (fga != null) {
    perGameEntity.fga = fga;
  }
  final double? ast = jsonConvert.convert<double>(json['ast']);
  if (ast != null) {
    perGameEntity.ast = ast;
  }
  final double? dreb = jsonConvert.convert<double>(json['dreb']);
  if (dreb != null) {
    perGameEntity.dreb = dreb;
  }
  final double? fgm = jsonConvert.convert<double>(json['fgm']);
  if (fgm != null) {
    perGameEntity.fgm = fgm;
  }
  final double? fta = jsonConvert.convert<double>(json['fta']);
  if (fta != null) {
    perGameEntity.fta = fta;
  }
  final int? min = jsonConvert.convert<int>(json['min']);
  if (min != null) {
    perGameEntity.min = min;
  }
  final int? nbaId = jsonConvert.convert<int>(json['nbaId']);
  if (nbaId != null) {
    perGameEntity.nbaId = nbaId;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    perGameEntity.seasonId = seasonId;
  }
  final double? wp = jsonConvert.convert<double>(json['wp']);
  if (wp != null) {
    perGameEntity.wp = wp;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    perGameEntity.ftm = ftm;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    perGameEntity.playerId = playerId;
  }
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    perGameEntity.blk = blk;
  }
  final int? seasonType = jsonConvert.convert<int>(json['seasonType']);
  if (seasonType != null) {
    perGameEntity.seasonType = seasonType;
  }
  final int? gp = jsonConvert.convert<int>(json['gp']);
  if (gp != null) {
    perGameEntity.gp = gp;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    perGameEntity.stl = stl;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    perGameEntity.updateTime = updateTime;
  }
  final int? l = jsonConvert.convert<int>(json['l']);
  if (l != null) {
    perGameEntity.l = l;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    perGameEntity.pts = pts;
  }
  final double? threePa = jsonConvert.convert<double>(json['threePa']);
  if (threePa != null) {
    perGameEntity.threePa = threePa;
  }
  final double? oreb = jsonConvert.convert<double>(json['oreb']);
  if (oreb != null) {
    perGameEntity.oreb = oreb;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    perGameEntity.createTime = createTime;
  }
  final int? pf = jsonConvert.convert<int>(json['pf']);
  if (pf != null) {
    perGameEntity.pf = pf;
  }
  final int? w = jsonConvert.convert<int>(json['w']);
  if (w != null) {
    perGameEntity.w = w;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    perGameEntity.threePm = threePm;
  }
  final int? to = jsonConvert.convert<int>(json['to']);
  if (to != null) {
    perGameEntity.to = to;
  }
  return perGameEntity;
}

Map<String, dynamic> $PerGameEntityToJson(PerGameEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['fga'] = entity.fga;
  data['ast'] = entity.ast;
  data['dreb'] = entity.dreb;
  data['fgm'] = entity.fgm;
  data['fta'] = entity.fta;
  data['min'] = entity.min;
  data['nbaId'] = entity.nbaId;
  data['seasonId'] = entity.seasonId;
  data['wp'] = entity.wp;
  data['ftm'] = entity.ftm;
  data['playerId'] = entity.playerId;
  data['blk'] = entity.blk;
  data['seasonType'] = entity.seasonType;
  data['gp'] = entity.gp;
  data['stl'] = entity.stl;
  data['updateTime'] = entity.updateTime;
  data['l'] = entity.l;
  data['pts'] = entity.pts;
  data['threePa'] = entity.threePa;
  data['oreb'] = entity.oreb;
  data['createTime'] = entity.createTime;
  data['pf'] = entity.pf;
  data['w'] = entity.w;
  data['threePm'] = entity.threePm;
  data['to'] = entity.to;
  return data;
}

extension PerGameEntityExtension on PerGameEntity {
  PerGameEntity copyWith({
    double? fga,
    double? ast,
    double? dreb,
    double? fgm,
    double? fta,
    int? min,
    int? nbaId,
    int? seasonId,
    double? wp,
    double? ftm,
    int? playerId,
    double? blk,
    int? seasonType,
    int? gp,
    double? stl,
    int? updateTime,
    int? l,
    double? pts,
    double? threePa,
    double? oreb,
    int? createTime,
    int? pf,
    int? w,
    double? threePm,
    int? to,
  }) {
    return PerGameEntity()
      ..fga = fga ?? this.fga
      ..ast = ast ?? this.ast
      ..dreb = dreb ?? this.dreb
      ..fgm = fgm ?? this.fgm
      ..fta = fta ?? this.fta
      ..min = min ?? this.min
      ..nbaId = nbaId ?? this.nbaId
      ..seasonId = seasonId ?? this.seasonId
      ..wp = wp ?? this.wp
      ..ftm = ftm ?? this.ftm
      ..playerId = playerId ?? this.playerId
      ..blk = blk ?? this.blk
      ..seasonType = seasonType ?? this.seasonType
      ..gp = gp ?? this.gp
      ..stl = stl ?? this.stl
      ..updateTime = updateTime ?? this.updateTime
      ..l = l ?? this.l
      ..pts = pts ?? this.pts
      ..threePa = threePa ?? this.threePa
      ..oreb = oreb ?? this.oreb
      ..createTime = createTime ?? this.createTime
      ..pf = pf ?? this.pf
      ..w = w ?? this.w
      ..threePm = threePm ?? this.threePm
      ..to = to ?? this.to;
  }
}