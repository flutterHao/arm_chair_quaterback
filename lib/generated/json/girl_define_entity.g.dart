import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/girl_define_entity.dart';

GirlDefineEntity $GirlDefineEntityFromJson(Map<String, dynamic> json) {
  final GirlDefineEntity girlDefineEntity = GirlDefineEntity();
  final String? age = jsonConvert.convert<String>(json['age']);
  if (age != null) {
    girlDefineEntity.age = age;
  }
  final int? buffTime = jsonConvert.convert<int>(json['buffTime']);
  if (buffTime != null) {
    girlDefineEntity.buffTime = buffTime;
  }
  final String? eName = jsonConvert.convert<String>(json['eName']);
  if (eName != null) {
    girlDefineEntity.eName = eName;
  }
  final String? height = jsonConvert.convert<String>(json['height']);
  if (height != null) {
    girlDefineEntity.height = height;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    girlDefineEntity.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    girlDefineEntity.id = id;
  }
  final String? initialCharm = jsonConvert.convert<String>(
      json['initialCharm']);
  if (initialCharm != null) {
    girlDefineEntity.initialCharm = initialCharm;
  }
  final double? intimacyLevelRate = jsonConvert.convert<double>(
      json['intimacyLevelRate']);
  if (intimacyLevelRate != null) {
    girlDefineEntity.intimacyLevelRate = intimacyLevelRate;
  }
  final String? intl = jsonConvert.convert<String>(json['intl‌']);
  if (intl != null) {
    girlDefineEntity.intl = intl;
  }
  final int? maxIntimacyLevel = jsonConvert.convert<int>(
      json['maxIntimacyLevel']);
  if (maxIntimacyLevel != null) {
    girlDefineEntity.maxIntimacyLevel = maxIntimacyLevel;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    girlDefineEntity.name = name;
  }
  final String? quality = jsonConvert.convert<String>(json['quality']);
  if (quality != null) {
    girlDefineEntity.quality = quality;
  }
  final List<String>? signCondition = (json['signCondition'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<String>(e) as String)
      .toList();
  if (signCondition != null) {
    girlDefineEntity.signCondition = signCondition;
  }
  final List<String>? switchCondition = (json['switchCondition'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (switchCondition != null) {
    girlDefineEntity.switchCondition = switchCondition;
  }
  final String? threeDimensions = jsonConvert.convert<String>(
      json['threeDimensions']);
  if (threeDimensions != null) {
    girlDefineEntity.threeDimensions = threeDimensions;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    girlDefineEntity.type = type;
  }
  final String? weight = jsonConvert.convert<String>(json['weight']);
  if (weight != null) {
    girlDefineEntity.weight = weight;
  }
  final String? loveDesc = jsonConvert.convert<String>(json['loveDesc']);
  if (loveDesc != null) {
    girlDefineEntity.loveDesc = loveDesc;
  }
  return girlDefineEntity;
}

Map<String, dynamic> $GirlDefineEntityToJson(GirlDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['age'] = entity.age;
  data['buffTime'] = entity.buffTime;
  data['eName'] = entity.eName;
  data['height'] = entity.height;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['initialCharm'] = entity.initialCharm;
  data['intimacyLevelRate'] = entity.intimacyLevelRate;
  data['intl‌'] = entity.intl;
  data['maxIntimacyLevel'] = entity.maxIntimacyLevel;
  data['name'] = entity.name;
  data['quality'] = entity.quality;
  data['signCondition'] = entity.signCondition;
  data['switchCondition'] = entity.switchCondition;
  data['threeDimensions'] = entity.threeDimensions;
  data['type'] = entity.type;
  data['weight'] = entity.weight;
  data['loveDesc'] = entity.loveDesc;
  return data;
}

extension GirlDefineEntityExtension on GirlDefineEntity {
  GirlDefineEntity copyWith({
    String? age,
    int? buffTime,
    String? eName,
    String? height,
    String? icon,
    int? id,
    String? initialCharm,
    double? intimacyLevelRate,
    String? intl,
    int? maxIntimacyLevel,
    String? name,
    String? quality,
    List<String>? signCondition,
    List<String>? switchCondition,
    String? threeDimensions,
    int? type,
    String? weight,
    String? loveDesc,
  }) {
    return GirlDefineEntity()
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
      ..weight = weight ?? this.weight
      ..loveDesc = loveDesc ?? this.loveDesc;
  }
}