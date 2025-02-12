import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/week_lucky_count_entity.dart';

WeekLuckyCountEntity $WeekLuckyCountEntityFromJson(Map<String, dynamic> json) {
  final WeekLuckyCountEntity weekLuckyCountEntity = WeekLuckyCountEntity();
  final int? value5 = jsonConvert.convert<int>(json['value5']);
  if (value5 != null) {
    weekLuckyCountEntity.value5 = value5;
  }
  final int? value2 = jsonConvert.convert<int>(json['value2']);
  if (value2 != null) {
    weekLuckyCountEntity.value2 = value2;
  }
  final int? value1 = jsonConvert.convert<int>(json['value1']);
  if (value1 != null) {
    weekLuckyCountEntity.value1 = value1;
  }
  final int? catalogs = jsonConvert.convert<int>(json['catalogs']);
  if (catalogs != null) {
    weekLuckyCountEntity.catalogs = catalogs;
  }
  final int? value4 = jsonConvert.convert<int>(json['value4']);
  if (value4 != null) {
    weekLuckyCountEntity.value4 = value4;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    weekLuckyCountEntity.teamId = teamId;
  }
  final int? resetTime = jsonConvert.convert<int>(json['resetTime']);
  if (resetTime != null) {
    weekLuckyCountEntity.resetTime = resetTime;
  }
  return weekLuckyCountEntity;
}

Map<String, dynamic> $WeekLuckyCountEntityToJson(WeekLuckyCountEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['value5'] = entity.value5;
  data['value2'] = entity.value2;
  data['value1'] = entity.value1;
  data['catalogs'] = entity.catalogs;
  data['value4'] = entity.value4;
  data['teamId'] = entity.teamId;
  data['resetTime'] = entity.resetTime;
  return data;
}

extension WeekLuckyCountEntityExtension on WeekLuckyCountEntity {
  WeekLuckyCountEntity copyWith({
    int? value5,
    int? value2,
    int? value1,
    int? catalogs,
    int? value4,
    int? teamId,
    int? resetTime,
  }) {
    return WeekLuckyCountEntity()
      ..value5 = value5 ?? this.value5
      ..value2 = value2 ?? this.value2
      ..value1 = value1 ?? this.value1
      ..catalogs = catalogs ?? this.catalogs
      ..value4 = value4 ?? this.value4
      ..teamId = teamId ?? this.teamId
      ..resetTime = resetTime ?? this.resetTime;
  }
}