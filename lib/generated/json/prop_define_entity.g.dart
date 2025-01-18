import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';

PropDefineEntity $PropDefineEntityFromJson(Map<String, dynamic> json) {
  final PropDefineEntity propDefineEntity = PropDefineEntity();
  final int? batchCount = jsonConvert.convert<int>(json['batchCount']);
  if (batchCount != null) {
    propDefineEntity.batchCount = batchCount;
  }
  final int? composeId = jsonConvert.convert<int>(json['composeId']);
  if (composeId != null) {
    propDefineEntity.composeId = composeId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    propDefineEntity.desc = desc;
  }
  final int? effectType = jsonConvert.convert<int>(json['effectType']);
  if (effectType != null) {
    propDefineEntity.effectType = effectType;
  }
  final int? effectValue = jsonConvert.convert<int>(json['effectValue']);
  if (effectValue != null) {
    propDefineEntity.effectValue = effectValue;
  }
  final String? getWayDesc = jsonConvert.convert<String>(json['getWayDesc']);
  if (getWayDesc != null) {
    propDefineEntity.getWayDesc = getWayDesc;
  }
  final int? isBatchUse = jsonConvert.convert<int>(json['isBatchUse']);
  if (isBatchUse != null) {
    propDefineEntity.isBatchUse = isBatchUse;
  }
  final int? isSell = jsonConvert.convert<int>(json['isSell']);
  if (isSell != null) {
    propDefineEntity.isSell = isSell;
  }
  final int? isShow = jsonConvert.convert<int>(json['isShow']);
  if (isShow != null) {
    propDefineEntity.isShow = isShow;
  }
  final int? isUse = jsonConvert.convert<int>(json['isUse']);
  if (isUse != null) {
    propDefineEntity.isUse = isUse;
  }
  final int? limitUp = jsonConvert.convert<int>(json['limitUp']);
  if (limitUp != null) {
    propDefineEntity.limitUp = limitUp;
  }
  final int? linkId = jsonConvert.convert<int>(json['linkId']);
  if (linkId != null) {
    propDefineEntity.linkId = linkId;
  }
  final int? linkId2 = jsonConvert.convert<int>(json['linkId2']);
  if (linkId2 != null) {
    propDefineEntity.linkId2 = linkId2;
  }
  final String? propChn = jsonConvert.convert<String>(json['propChn']);
  if (propChn != null) {
    propDefineEntity.propChn = propChn;
  }
  final String? propIcon = jsonConvert.convert<String>(json['propIcon']);
  if (propIcon != null) {
    propDefineEntity.propIcon = propIcon;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    propDefineEntity.propId = propId;
  }
  final String? propName = jsonConvert.convert<String>(json['propName']);
  if (propName != null) {
    propDefineEntity.propName = propName;
  }
  final int? propType = jsonConvert.convert<int>(json['propType']);
  if (propType != null) {
    propDefineEntity.propType = propType;
  }
  final int? quality = jsonConvert.convert<int>(json['quality']);
  if (quality != null) {
    propDefineEntity.quality = quality;
  }
  final int? sellPropId = jsonConvert.convert<int>(json['sellPropId']);
  if (sellPropId != null) {
    propDefineEntity.sellPropId = sellPropId;
  }
  final int? sellPropNum = jsonConvert.convert<int>(json['sellPropNum']);
  if (sellPropNum != null) {
    propDefineEntity.sellPropNum = sellPropNum;
  }
  final int? sortWeight = jsonConvert.convert<int>(json['sortWeight']);
  if (sortWeight != null) {
    propDefineEntity.sortWeight = sortWeight;
  }
  return propDefineEntity;
}

Map<String, dynamic> $PropDefineEntityToJson(PropDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['batchCount'] = entity.batchCount;
  data['composeId'] = entity.composeId;
  data['desc'] = entity.desc;
  data['effectType'] = entity.effectType;
  data['effectValue'] = entity.effectValue;
  data['getWayDesc'] = entity.getWayDesc;
  data['isBatchUse'] = entity.isBatchUse;
  data['isSell'] = entity.isSell;
  data['isShow'] = entity.isShow;
  data['isUse'] = entity.isUse;
  data['limitUp'] = entity.limitUp;
  data['linkId'] = entity.linkId;
  data['linkId2'] = entity.linkId2;
  data['propChn'] = entity.propChn;
  data['propIcon'] = entity.propIcon;
  data['propId'] = entity.propId;
  data['propName'] = entity.propName;
  data['propType'] = entity.propType;
  data['quality'] = entity.quality;
  data['sellPropId'] = entity.sellPropId;
  data['sellPropNum'] = entity.sellPropNum;
  data['sortWeight'] = entity.sortWeight;
  return data;
}

extension PropDefineEntityExtension on PropDefineEntity {
  PropDefineEntity copyWith({
    int? batchCount,
    int? composeId,
    String? desc,
    int? effectType,
    int? effectValue,
    String? getWayDesc,
    int? isBatchUse,
    int? isSell,
    int? isShow,
    int? isUse,
    int? limitUp,
    int? linkId,
    int? linkId2,
    String? propChn,
    String? propIcon,
    int? propId,
    String? propName,
    int? propType,
    int? quality,
    int? sellPropId,
    int? sellPropNum,
    int? sortWeight,
  }) {
    return PropDefineEntity()
      ..batchCount = batchCount ?? this.batchCount
      ..composeId = composeId ?? this.composeId
      ..desc = desc ?? this.desc
      ..effectType = effectType ?? this.effectType
      ..effectValue = effectValue ?? this.effectValue
      ..getWayDesc = getWayDesc ?? this.getWayDesc
      ..isBatchUse = isBatchUse ?? this.isBatchUse
      ..isSell = isSell ?? this.isSell
      ..isShow = isShow ?? this.isShow
      ..isUse = isUse ?? this.isUse
      ..limitUp = limitUp ?? this.limitUp
      ..linkId = linkId ?? this.linkId
      ..linkId2 = linkId2 ?? this.linkId2
      ..propChn = propChn ?? this.propChn
      ..propIcon = propIcon ?? this.propIcon
      ..propId = propId ?? this.propId
      ..propName = propName ?? this.propName
      ..propType = propType ?? this.propType
      ..quality = quality ?? this.quality
      ..sellPropId = sellPropId ?? this.sellPropId
      ..sellPropNum = sellPropNum ?? this.sellPropNum
      ..sortWeight = sortWeight ?? this.sortWeight;
  }
}