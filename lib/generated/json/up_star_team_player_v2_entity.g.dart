import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/up_star_team_player_v2_entity.dart';

UpStarTeamPlayerV2Entity $UpStarTeamPlayerV2EntityFromJson(
    Map<String, dynamic> json) {
  final UpStarTeamPlayerV2Entity upStarTeamPlayerV2Entity = UpStarTeamPlayerV2Entity();
  final int? nowCount = jsonConvert.convert<int>(json['nowCount']);
  if (nowCount != null) {
    upStarTeamPlayerV2Entity.nowCount = nowCount;
  }
  final double? successRate = jsonConvert.convert<double>(json['successRate']);
  if (successRate != null) {
    upStarTeamPlayerV2Entity.successRate = successRate;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    upStarTeamPlayerV2Entity.teamId = teamId;
  }
  final double? addRate = jsonConvert.convert<double>(json['addRate']);
  if (addRate != null) {
    upStarTeamPlayerV2Entity.addRate = addRate;
  }
  final List<
      UpStarTeamPlayerV2StarUpList>? starUpList = (json['starUpList'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<UpStarTeamPlayerV2StarUpList>(
          e) as UpStarTeamPlayerV2StarUpList).toList();
  if (starUpList != null) {
    upStarTeamPlayerV2Entity.starUpList = starUpList;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    upStarTeamPlayerV2Entity.uuid = uuid;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    upStarTeamPlayerV2Entity.playerId = playerId;
  }
  return upStarTeamPlayerV2Entity;
}

Map<String, dynamic> $UpStarTeamPlayerV2EntityToJson(
    UpStarTeamPlayerV2Entity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nowCount'] = entity.nowCount;
  data['successRate'] = entity.successRate;
  data['teamId'] = entity.teamId;
  data['addRate'] = entity.addRate;
  data['starUpList'] = entity.starUpList.map((v) => v.toJson()).toList();
  data['uuid'] = entity.uuid;
  data['playerId'] = entity.playerId;
  return data;
}

extension UpStarTeamPlayerV2EntityExtension on UpStarTeamPlayerV2Entity {
  UpStarTeamPlayerV2Entity copyWith({
    int? nowCount,
    double? successRate,
    int? teamId,
    double? addRate,
    List<UpStarTeamPlayerV2StarUpList>? starUpList,
    String? uuid,
    int? playerId,
  }) {
    return UpStarTeamPlayerV2Entity()
      ..nowCount = nowCount ?? this.nowCount
      ..successRate = successRate ?? this.successRate
      ..teamId = teamId ?? this.teamId
      ..addRate = addRate ?? this.addRate
      ..starUpList = starUpList ?? this.starUpList
      ..uuid = uuid ?? this.uuid
      ..playerId = playerId ?? this.playerId;
  }
}

UpStarTeamPlayerV2StarUpList $UpStarTeamPlayerV2StarUpListFromJson(
    Map<String, dynamic> json) {
  final UpStarTeamPlayerV2StarUpList upStarTeamPlayerV2StarUpList = UpStarTeamPlayerV2StarUpList();
  final double? successRate = jsonConvert.convert<double>(json['successRate']);
  if (successRate != null) {
    upStarTeamPlayerV2StarUpList.successRate = successRate;
  }
  final bool? success = jsonConvert.convert<bool>(json['success']);
  if (success != null) {
    upStarTeamPlayerV2StarUpList.success = success;
  }
  final UpStarTeamPlayerV2StarUpListAttrCount? attrCount = jsonConvert.convert<
      UpStarTeamPlayerV2StarUpListAttrCount>(json['attrCount']);
  if (attrCount != null) {
    upStarTeamPlayerV2StarUpList.attrCount = attrCount;
  }
  final UpStarTeamPlayerV2StarUpListAttr? attr = jsonConvert.convert<
      UpStarTeamPlayerV2StarUpListAttr>(json['attr']);
  if (attr != null) {
    upStarTeamPlayerV2StarUpList.attr = attr;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    upStarTeamPlayerV2StarUpList.type = type;
  }
  final int? starUpCount = jsonConvert.convert<int>(json['starUpCount']);
  if (starUpCount != null) {
    upStarTeamPlayerV2StarUpList.starUpCount = starUpCount;
  }
  return upStarTeamPlayerV2StarUpList;
}

Map<String, dynamic> $UpStarTeamPlayerV2StarUpListToJson(
    UpStarTeamPlayerV2StarUpList entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['successRate'] = entity.successRate;
  data['success'] = entity.success;
  data['attrCount'] = entity.attrCount.toJson();
  data['attr'] = entity.attr.toJson();
  data['type'] = entity.type;
  data['starUpCount'] = entity.starUpCount;
  return data;
}

extension UpStarTeamPlayerV2StarUpListExtension on UpStarTeamPlayerV2StarUpList {
  UpStarTeamPlayerV2StarUpList copyWith({
    double? successRate,
    bool? success,
    UpStarTeamPlayerV2StarUpListAttrCount? attrCount,
    UpStarTeamPlayerV2StarUpListAttr? attr,
    int? type,
    int? starUpCount,
  }) {
    return UpStarTeamPlayerV2StarUpList()
      ..successRate = successRate ?? this.successRate
      ..success = success ?? this.success
      ..attrCount = attrCount ?? this.attrCount
      ..attr = attr ?? this.attr
      ..type = type ?? this.type
      ..starUpCount = starUpCount ?? this.starUpCount;
  }
}

UpStarTeamPlayerV2StarUpListAttrCount $UpStarTeamPlayerV2StarUpListAttrCountFromJson(
    Map<String, dynamic> json) {
  final UpStarTeamPlayerV2StarUpListAttrCount upStarTeamPlayerV2StarUpListAttrCount = UpStarTeamPlayerV2StarUpListAttrCount();
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    upStarTeamPlayerV2StarUpListAttrCount.blk = blk;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    upStarTeamPlayerV2StarUpListAttrCount.tech = tech;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    upStarTeamPlayerV2StarUpListAttrCount.pass = pass;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    upStarTeamPlayerV2StarUpListAttrCount.stl = stl;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    upStarTeamPlayerV2StarUpListAttrCount.threePm = threePm;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    upStarTeamPlayerV2StarUpListAttrCount.ftm = ftm;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    upStarTeamPlayerV2StarUpListAttrCount.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    upStarTeamPlayerV2StarUpListAttrCount.reb = reb;
  }
  return upStarTeamPlayerV2StarUpListAttrCount;
}

Map<String, dynamic> $UpStarTeamPlayerV2StarUpListAttrCountToJson(
    UpStarTeamPlayerV2StarUpListAttrCount entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStarTeamPlayerV2StarUpListAttrCountExtension on UpStarTeamPlayerV2StarUpListAttrCount {
  UpStarTeamPlayerV2StarUpListAttrCount copyWith({
    int? blk,
    int? tech,
    int? pass,
    int? stl,
    int? threePm,
    int? ftm,
    int? pts,
    int? reb,
  }) {
    return UpStarTeamPlayerV2StarUpListAttrCount()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}

UpStarTeamPlayerV2StarUpListAttr $UpStarTeamPlayerV2StarUpListAttrFromJson(
    Map<String, dynamic> json) {
  final UpStarTeamPlayerV2StarUpListAttr upStarTeamPlayerV2StarUpListAttr = UpStarTeamPlayerV2StarUpListAttr();
  final double? blk = jsonConvert.convert<double>(json['blk']);
  if (blk != null) {
    upStarTeamPlayerV2StarUpListAttr.blk = blk;
  }
  final double? tech = jsonConvert.convert<double>(json['tech']);
  if (tech != null) {
    upStarTeamPlayerV2StarUpListAttr.tech = tech;
  }
  final double? pass = jsonConvert.convert<double>(json['pass']);
  if (pass != null) {
    upStarTeamPlayerV2StarUpListAttr.pass = pass;
  }
  final double? stl = jsonConvert.convert<double>(json['stl']);
  if (stl != null) {
    upStarTeamPlayerV2StarUpListAttr.stl = stl;
  }
  final double? threePm = jsonConvert.convert<double>(json['threePm']);
  if (threePm != null) {
    upStarTeamPlayerV2StarUpListAttr.threePm = threePm;
  }
  final double? ftm = jsonConvert.convert<double>(json['ftm']);
  if (ftm != null) {
    upStarTeamPlayerV2StarUpListAttr.ftm = ftm;
  }
  final double? pts = jsonConvert.convert<double>(json['pts']);
  if (pts != null) {
    upStarTeamPlayerV2StarUpListAttr.pts = pts;
  }
  final double? reb = jsonConvert.convert<double>(json['reb']);
  if (reb != null) {
    upStarTeamPlayerV2StarUpListAttr.reb = reb;
  }
  return upStarTeamPlayerV2StarUpListAttr;
}

Map<String, dynamic> $UpStarTeamPlayerV2StarUpListAttrToJson(
    UpStarTeamPlayerV2StarUpListAttr entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['blk'] = entity.blk;
  data['tech'] = entity.tech;
  data['pass'] = entity.pass;
  data['stl'] = entity.stl;
  data['threePm'] = entity.threePm;
  data['ftm'] = entity.ftm;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  return data;
}

extension UpStarTeamPlayerV2StarUpListAttrExtension on UpStarTeamPlayerV2StarUpListAttr {
  UpStarTeamPlayerV2StarUpListAttr copyWith({
    double? blk,
    double? tech,
    double? pass,
    double? stl,
    double? threePm,
    double? ftm,
    double? pts,
    double? reb,
  }) {
    return UpStarTeamPlayerV2StarUpListAttr()
      ..blk = blk ?? this.blk
      ..tech = tech ?? this.tech
      ..pass = pass ?? this.pass
      ..stl = stl ?? this.stl
      ..threePm = threePm ?? this.threePm
      ..ftm = ftm ?? this.ftm
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb;
  }
}