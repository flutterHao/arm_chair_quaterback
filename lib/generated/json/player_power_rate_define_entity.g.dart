import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_power_rate_define_entity.dart';

PlayerPowerRateDefineEntity $PlayerPowerRateDefineEntityFromJson(
    Map<String, dynamic> json) {
  final PlayerPowerRateDefineEntity playerPowerRateDefineEntity = PlayerPowerRateDefineEntity();
  final String? backUp = jsonConvert.convert<String>(json['backUp']);
  if (backUp != null) {
    playerPowerRateDefineEntity.backUp = backUp;
  }
  final int? blk = jsonConvert.convert<int>(json['blk']);
  if (blk != null) {
    playerPowerRateDefineEntity.blk = blk;
  }
  final int? ftm = jsonConvert.convert<int>(json['ftm']);
  if (ftm != null) {
    playerPowerRateDefineEntity.ftm = ftm;
  }
  final int? pass = jsonConvert.convert<int>(json['pass']);
  if (pass != null) {
    playerPowerRateDefineEntity.pass = pass;
  }
  final int? powerId = jsonConvert.convert<int>(json['powerId']);
  if (powerId != null) {
    playerPowerRateDefineEntity.powerId = powerId;
  }
  final int? pts = jsonConvert.convert<int>(json['pts']);
  if (pts != null) {
    playerPowerRateDefineEntity.pts = pts;
  }
  final int? reb = jsonConvert.convert<int>(json['reb']);
  if (reb != null) {
    playerPowerRateDefineEntity.reb = reb;
  }
  final int? stl = jsonConvert.convert<int>(json['stl']);
  if (stl != null) {
    playerPowerRateDefineEntity.stl = stl;
  }
  final int? tech = jsonConvert.convert<int>(json['tech']);
  if (tech != null) {
    playerPowerRateDefineEntity.tech = tech;
  }
  final int? threePm = jsonConvert.convert<int>(json['threePm']);
  if (threePm != null) {
    playerPowerRateDefineEntity.threePm = threePm;
  }
  return playerPowerRateDefineEntity;
}

Map<String, dynamic> $PlayerPowerRateDefineEntityToJson(
    PlayerPowerRateDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['backUp'] = entity.backUp;
  data['blk'] = entity.blk;
  data['ftm'] = entity.ftm;
  data['pass'] = entity.pass;
  data['powerId'] = entity.powerId;
  data['pts'] = entity.pts;
  data['reb'] = entity.reb;
  data['stl'] = entity.stl;
  data['tech'] = entity.tech;
  data['threePm'] = entity.threePm;
  return data;
}

extension PlayerPowerRateDefineEntityExtension on PlayerPowerRateDefineEntity {
  PlayerPowerRateDefineEntity copyWith({
    String? backUp,
    int? blk,
    int? ftm,
    int? pass,
    int? powerId,
    int? pts,
    int? reb,
    int? stl,
    int? tech,
    int? threePm,
  }) {
    return PlayerPowerRateDefineEntity()
      ..backUp = backUp ?? this.backUp
      ..blk = blk ?? this.blk
      ..ftm = ftm ?? this.ftm
      ..pass = pass ?? this.pass
      ..powerId = powerId ?? this.powerId
      ..pts = pts ?? this.pts
      ..reb = reb ?? this.reb
      ..stl = stl ?? this.stl
      ..tech = tech ?? this.tech
      ..threePm = threePm ?? this.threePm;
  }
}