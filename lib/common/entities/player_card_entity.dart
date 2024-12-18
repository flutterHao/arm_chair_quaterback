import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_card_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/player_card_entity.g.dart';

@JsonSerializable()
class PlayerCardEntity {
  @JSONField(serialize: false, deserialize: false)
  late RxBool isSelect = false.obs;
  @JSONField(serialize: false, deserialize: false)
  late RxBool isOpen = false.obs;
  late int playerId = 0;

  PlayerCardEntity({this.playerId = 0});

  factory PlayerCardEntity.fromJson(Map<String, dynamic> json) =>
      $PlayerCardEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlayerCardEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
