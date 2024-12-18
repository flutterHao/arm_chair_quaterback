import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/dan_ma_ku_entity.dart';

DanMaKuEntity $DanMaKuEntityFromJson(Map<String, dynamic> json) {
  final DanMaKuEntity danMaKuEntity = DanMaKuEntity();
  final String? hudDes = jsonConvert.convert<String>(json['hudDes']);
  if (hudDes != null) {
    danMaKuEntity.hudDes = hudDes;
  }
  final int? hudId = jsonConvert.convert<int>(json['hudId']);
  if (hudId != null) {
    danMaKuEntity.hudId = hudId;
  }
  final List<int>? hudNum = (json['hudNum'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (hudNum != null) {
    danMaKuEntity.hudNum = hudNum;
  }
  final List<int>? hudTrigger = (json['hudTrigger'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (hudTrigger != null) {
    danMaKuEntity.hudTrigger = hudTrigger;
  }
  return danMaKuEntity;
}

Map<String, dynamic> $DanMaKuEntityToJson(DanMaKuEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['hudDes'] = entity.hudDes;
  data['hudId'] = entity.hudId;
  data['hudNum'] = entity.hudNum;
  data['hudTrigger'] = entity.hudTrigger;
  return data;
}

extension DanMaKuEntityExtension on DanMaKuEntity {
  DanMaKuEntity copyWith({
    String? hudDes,
    int? hudId,
    List<int>? hudNum,
    List<int>? hudTrigger,
  }) {
    return DanMaKuEntity()
      ..hudDes = hudDes ?? this.hudDes
      ..hudId = hudId ?? this.hudId
      ..hudNum = hudNum ?? this.hudNum
      ..hudTrigger = hudTrigger ?? this.hudTrigger;
  }
}