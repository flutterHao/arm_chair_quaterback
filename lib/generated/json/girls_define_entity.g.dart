import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/girls_define_entity.dart';

GirlsDefineEntity $GirlsDefineEntityFromJson(Map<String, dynamic> json) {
  final GirlsDefineEntity girlsDefineEntity = GirlsDefineEntity();
  final int? age = jsonConvert.convert<int>(json['age']);
  if (age != null) {
    girlsDefineEntity.age = age;
  }
  final int? buffTime = jsonConvert.convert<int>(json['buffTime']);
  if (buffTime != null) {
    girlsDefineEntity.buffTime = buffTime;
  }
  final String? eName = jsonConvert.convert<String>(json['eName']);
  if (eName != null) {
    girlsDefineEntity.eName = eName;
  }
  final int? height = jsonConvert.convert<int>(json['height']);
  if (height != null) {
    girlsDefineEntity.height = height;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    girlsDefineEntity.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    girlsDefineEntity.id = id;
  }
  final int? initialCharm = jsonConvert.convert<int>(json['initialCharm']);
  if (initialCharm != null) {
    girlsDefineEntity.initialCharm = initialCharm;
  }
  final int? intimacyLevelRate = jsonConvert.convert<int>(
      json['intimacyLevelRate']);
  if (intimacyLevelRate != null) {
    girlsDefineEntity.intimacyLevelRate = intimacyLevelRate;
  }
  final String? intl = jsonConvert.convert<String>(json['intl1']);
  if (intl != null) {
    girlsDefineEntity.intl = intl;
  }
  final int? maxIntimacyLevel = jsonConvert.convert<int>(
      json['maxIntimacyLevel']);
  if (maxIntimacyLevel != null) {
    girlsDefineEntity.maxIntimacyLevel = maxIntimacyLevel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    girlsDefineEntity.name = name;
  }
  final int? quality = jsonConvert.convert<int>(json['quality']);
  if (quality != null) {
    girlsDefineEntity.quality = quality;
  }
  final List<int>? signCondition = (json['signCondition'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (signCondition != null) {
    girlsDefineEntity.signCondition = signCondition;
  }
  final List<int>? switchCondition = (json['switchCondition'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (switchCondition != null) {
    girlsDefineEntity.switchCondition = switchCondition;
  }
  final String? threeDimensions = jsonConvert.convert<String>(
      json['threeDimensions']);
  if (threeDimensions != null) {
    girlsDefineEntity.threeDimensions = threeDimensions;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    girlsDefineEntity.type = type;
  }
  final int? weight = jsonConvert.convert<int>(json['weight']);
  if (weight != null) {
    girlsDefineEntity.weight = weight;
  }
  return girlsDefineEntity;
}

Map<String, dynamic> $GirlsDefineEntityToJson(GirlsDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['age'] = entity.age;
  data['buffTime'] = entity.buffTime;
  data['eName'] = entity.eName;
  data['height'] = entity.height;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['initialCharm'] = entity.initialCharm;
  data['intimacyLevelRate'] = entity.intimacyLevelRate;
  data['intl1'] = entity.intl;
  data['maxIntimacyLevel'] = entity.maxIntimacyLevel;
  data['name'] = entity.name;
  data['quality'] = entity.quality;
  data['signCondition'] = entity.signCondition;
  data['switchCondition'] = entity.switchCondition;
  data['threeDimensions'] = entity.threeDimensions;
  data['type'] = entity.type;
  data['weight'] = entity.weight;
  return data;
}

extension GirlsDefineEntityExtension on GirlsDefineEntity {
  GirlsDefineEntity copyWith({
    int? age,
    int? buffTime,
    String? eName,
    int? height,
    String? icon,
    int? id,
    int? initialCharm,
    int? intimacyLevelRate,
    String? intl,
    int? maxIntimacyLevel,
    String? name,
    int? quality,
    List<int>? signCondition,
    List<int>? switchCondition,
    String? threeDimensions,
    int? type,
    int? weight,
  }) {
    return GirlsDefineEntity()
      ..age = age ?? this.age
      ..buffTime = buffTime ?? this.buffTime
      ..eName = eName ?? this.eName
      ..height = height ?? this.height
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..initialCharm = initialCharm ?? this.initialCharm
      ..intimacyLevelRate = intimacyLevelRate ?? this.intimacyLevelRate
      ..intl = intl ?? this.intl
      ..maxIntimacyLevel = maxIntimacyLevel ?? this.maxIntimacyLevel
      ..name = name ?? this.name
      ..quality = quality ?? this.quality
      ..signCondition = signCondition ?? this.signCondition
      ..switchCondition = switchCondition ?? this.switchCondition
      ..threeDimensions = threeDimensions ?? this.threeDimensions
      ..type = type ?? this.type
      ..weight = weight ?? this.weight;
  }
}