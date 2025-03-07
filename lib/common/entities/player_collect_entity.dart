/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-01-13 21:01:07
 * @LastEditTime: 2025-02-17 11:31:44
 */
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/player_collect_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/player_collect_entity.g.dart';

@JsonSerializable()
class PlayerCollectEntity {
  late int teamId = 0;
  late List<PlayerCollectCollects> collects = [];
  late PlayerCollectTeamBookPlayerCollect teamBookPlayerCollect =
      PlayerCollectTeamBookPlayerCollect();

  PlayerCollectEntity();

  factory PlayerCollectEntity.fromJson(Map<String, dynamic> json) =>
      $PlayerCollectEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlayerCollectEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PlayerCollectCollects {
  late int isAnimation = 0;
  late int createTime = 0;
  late int isLight = 0;
  @JSONField(deserialize: false, serialize: false)
  var isLightRx = 0.obs;
  late int teamId = 0;
  late int fragmentNum = 0;
  late int updateTime = 0;
  late int isActive = 0;
  late int bookId = 0;
  late int playerId = 0;
  late int needNum = 100;

  PlayerCollectCollects();

  factory PlayerCollectCollects.fromJson(Map<String, dynamic> json) {
    var item = $PlayerCollectCollectsFromJson(json);
    item.isLightRx.value = item.isLight;
    return item;
  }

  Map<String, dynamic> toJson() => $PlayerCollectCollectsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PlayerCollectTeamBookPlayerCollect {
  late int createTime = 0;
  late int grade = 0;
  late int teamId = 0;
  late int updateTime = 0;
  late int exp = 0;
  late int bookId = 0;
  @JSONField(deserialize: false, serialize: false)
  late int totalExp = 0;
  late int needExp = 0;
  late int addSalaryCap = 0;

  PlayerCollectTeamBookPlayerCollect();

  factory PlayerCollectTeamBookPlayerCollect.fromJson(
          Map<String, dynamic> json) =>
      $PlayerCollectTeamBookPlayerCollectFromJson(json);

  Map<String, dynamic> toJson() =>
      $PlayerCollectTeamBookPlayerCollectToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
