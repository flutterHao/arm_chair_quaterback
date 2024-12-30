import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/nba_team_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/nba_team_entity.g.dart';

@JsonSerializable()
class NbaTeamEntity {
  late int force = 0;
  late int id = 0;
  late String longEname = "";
  late String name = "";
  late String shortEname = "";
  late String shortName = "";
  late int teamDivision = 0;

  NbaTeamEntity();

  factory NbaTeamEntity.fromJson(Map<String, dynamic> json) =>
      $NbaTeamEntityFromJson(json);

  Map<String, dynamic> toJson() => $NbaTeamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
