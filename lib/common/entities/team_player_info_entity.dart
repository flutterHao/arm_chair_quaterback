import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';

@JsonSerializable()
class TeamPlayerInfoEntity {
  late int buyPrice = 0;
  late int buyPlayerScore = 0;
  late int updateTime = 0;
  late String uuid = '';
  late int gradeExp = 0;
  late int fromType = 0;
  late int createTime = 0;
  late int playerGrade = 0;
  late int teamId = 0;
  late int id = 0;
  late int position = 0;
  late int power = 0;
  late TeamPlayerInfoPotential potential;
  late bool bindStatus = false;
  late int breakThroughGrade = 0;
  late int playerId = 0;

  TeamPlayerInfoEntity();

  factory TeamPlayerInfoEntity.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamPlayerInfoEntityToJson(this);

  //�油
  bool isSubstitute(){
    return position == 0;
  }

  String getPosition(){
    switch(position){
      case 1:
        return "C";
      case 2:
        return "PF";
      case 3:
        return "SF";
      case 4:
        return "SG";
      case 5:
        return "PG";
    }
    return "";
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamPlayerInfoPotential {
  late int blk = 0;
  late int ast = 0;
  late int threePts = 0;
  late int stl = 0;
  late int pts = 0;
  late int reb = 0;

  TeamPlayerInfoPotential();

  factory TeamPlayerInfoPotential.fromJson(Map<String, dynamic> json) => $TeamPlayerInfoPotentialFromJson(json);

  Map<String, dynamic> toJson() => $TeamPlayerInfoPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}