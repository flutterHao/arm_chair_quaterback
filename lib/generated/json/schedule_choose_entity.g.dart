import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/schedule_choose_entity.dart';

ScheduleChooseEntity $ScheduleChooseEntityFromJson(Map<String, dynamic> json) {
  final ScheduleChooseEntity scheduleChooseEntity = ScheduleChooseEntity();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    scheduleChooseEntity.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    scheduleChooseEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    scheduleChooseEntity.type = type;
  }
  return scheduleChooseEntity;
}

Map<String, dynamic> $ScheduleChooseEntityToJson(ScheduleChooseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension ScheduleChooseEntityExtension on ScheduleChooseEntity {
  ScheduleChooseEntity copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return ScheduleChooseEntity()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}