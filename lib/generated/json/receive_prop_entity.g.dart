import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';

ReceivePropEntity $ReceivePropEntityFromJson(Map<String, dynamic> json) {
  final ReceivePropEntity receivePropEntity = ReceivePropEntity();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    receivePropEntity.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    receivePropEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    receivePropEntity.type = type;
  }
  return receivePropEntity;
}

Map<String, dynamic> $ReceivePropEntityToJson(ReceivePropEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension ReceivePropEntityExtension on ReceivePropEntity {
  ReceivePropEntity copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return ReceivePropEntity()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}