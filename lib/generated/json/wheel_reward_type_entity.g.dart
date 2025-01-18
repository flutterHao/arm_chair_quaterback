import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/wheel_reward_type_entity.dart';

WheelRewardTypeEntity $WheelRewardTypeEntityFromJson(
    Map<String, dynamic> json) {
  final WheelRewardTypeEntity wheelRewardTypeEntity = WheelRewardTypeEntity();
  final String? wheelRewardIcon = jsonConvert.convert<String>(
      json['wheelRewardIcon']);
  if (wheelRewardIcon != null) {
    wheelRewardTypeEntity.wheelRewardIcon = wheelRewardIcon;
  }
  final int? wheelRewardId = jsonConvert.convert<int>(json['wheelRewardId']);
  if (wheelRewardId != null) {
    wheelRewardTypeEntity.wheelRewardId = wheelRewardId;
  }
  final List<double>? wheelRewardInPack = (json['wheelRewardInPack'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<double>(e) as double).toList();
  if (wheelRewardInPack != null) {
    wheelRewardTypeEntity.wheelRewardInPack = wheelRewardInPack;
  }
  final String? wheelRewardMark = jsonConvert.convert<String>(
      json['wheelRewardMark']);
  if (wheelRewardMark != null) {
    wheelRewardTypeEntity.wheelRewardMark = wheelRewardMark;
  }
  final double? wheelRewardNum = jsonConvert.convert<double>(
      json['wheelRewardNum']);
  if (wheelRewardNum != null) {
    wheelRewardTypeEntity.wheelRewardNum = wheelRewardNum;
  }
  return wheelRewardTypeEntity;
}

Map<String, dynamic> $WheelRewardTypeEntityToJson(
    WheelRewardTypeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['wheelRewardIcon'] = entity.wheelRewardIcon;
  data['wheelRewardId'] = entity.wheelRewardId;
  data['wheelRewardInPack'] = entity.wheelRewardInPack;
  data['wheelRewardMark'] = entity.wheelRewardMark;
  data['wheelRewardNum'] = entity.wheelRewardNum;
  return data;
}

extension WheelRewardTypeEntityExtension on WheelRewardTypeEntity {
  WheelRewardTypeEntity copyWith({
    String? wheelRewardIcon,
    int? wheelRewardId,
    List<double>? wheelRewardInPack,
    String? wheelRewardMark,
    double? wheelRewardNum,
  }) {
    return WheelRewardTypeEntity()
      ..wheelRewardIcon = wheelRewardIcon ?? this.wheelRewardIcon
      ..wheelRewardId = wheelRewardId ?? this.wheelRewardId
      ..wheelRewardInPack = wheelRewardInPack ?? this.wheelRewardInPack
      ..wheelRewardMark = wheelRewardMark ?? this.wheelRewardMark
      ..wheelRewardNum = wheelRewardNum ?? this.wheelRewardNum;
  }
}