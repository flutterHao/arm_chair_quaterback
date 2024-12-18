import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/game_event_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/game_event_entity.g.dart';

@JsonSerializable()
class GameEventEntity {
  late String constantId;
  late String desc;
  late String eventDescripition;
  late String eventWeight;
  late String gameEventType;
  late double eventShowTime;
  String headLine = "0";

  GameEventEntity();

  factory GameEventEntity.fromJson(Map<String, dynamic> json) =>
      $GameEventEntityFromJson(json);

  Map<String, dynamic> toJson() => $GameEventEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
