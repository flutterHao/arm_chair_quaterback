import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/my_team_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/my_team_entity.g.dart';

@JsonSerializable()
class MyTeamEntity {
  late int powerReplyTime = 0;
  late List<TeamPlayerInfoEntity> teamPlayers = [];
  late int powerP = 0;
  @JSONField(name: "OVR")
  late int oVR = 0;
  late int salary = 0;
  late int salaryCap = 0;

  MyTeamEntity();

  factory MyTeamEntity.fromJson(Map<String, dynamic> json) =>
      $MyTeamEntityFromJson(json);

  Map<String, dynamic> toJson() => $MyTeamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
