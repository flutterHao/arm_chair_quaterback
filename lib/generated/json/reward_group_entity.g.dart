import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/reward_group_entity.dart';

RewardGroupEntity $RewardGroupEntityFromJson(Map<String, dynamic> json) {
  final RewardGroupEntity rewardGroupEntity = RewardGroupEntity();
  final String? cnBack = jsonConvert.convert<String>(json['cnBack']);
  if (cnBack != null) {
    rewardGroupEntity.cnBack = cnBack;
  }
  final int? groupId = jsonConvert.convert<int>(json['groupId']);
  if (groupId != null) {
    rewardGroupEntity.groupId = groupId;
  }
  final List<int>? propOrder = (json['propOrder'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (propOrder != null) {
    rewardGroupEntity.propOrder = propOrder;
  }
  return rewardGroupEntity;
}

Map<String, dynamic> $RewardGroupEntityToJson(RewardGroupEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cnBack'] = entity.cnBack;
  data['groupId'] = entity.groupId;
  data['propOrder'] = entity.propOrder;
  return data;
}

extension RewardGroupEntityExtension on RewardGroupEntity {
  RewardGroupEntity copyWith({
    String? cnBack,
    int? groupId,
    List<int>? propOrder,
  }) {
    return RewardGroupEntity()
      ..cnBack = cnBack ?? this.cnBack
      ..groupId = groupId ?? this.groupId
      ..propOrder = propOrder ?? this.propOrder;
  }
}