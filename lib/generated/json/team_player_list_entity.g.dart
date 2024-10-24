import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';


TeamPlayerListEntity $TeamPlayerListEntityFromJson(Map<String, dynamic> json) {
  final TeamPlayerListEntity teamPlayerListEntity = TeamPlayerListEntity();
  final int? powerReplyTime = jsonConvert.convert<int>(json['powerReplyTime']);
  if (powerReplyTime != null) {
    teamPlayerListEntity.powerReplyTime = powerReplyTime;
  }
  final List<TeamPlayerInfoEntity>? teamPlayers = (json['teamPlayers'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<TeamPlayerInfoEntity>(e) as TeamPlayerInfoEntity)
      .toList();
  if (teamPlayers != null) {
    teamPlayerListEntity.teamPlayers = teamPlayers;
  }
  final int? powerP = jsonConvert.convert<int>(json['powerP']);
  if (powerP != null) {
    teamPlayerListEntity.powerP = powerP;
  }
  final int? oVR = jsonConvert.convert<int>(json['OVR']);
  if (oVR != null) {
    teamPlayerListEntity.oVR = oVR;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    teamPlayerListEntity.salary = salary;
  }
  final int? benchCount = jsonConvert.convert<int>(json['benchCount']);
  if (benchCount != null) {
    teamPlayerListEntity.benchCount = benchCount;
  }
  final int? salaryCap = jsonConvert.convert<int>(json['salaryCap']);
  if (salaryCap != null) {
    teamPlayerListEntity.salaryCap = salaryCap;
  }
  return teamPlayerListEntity;
}

Map<String, dynamic> $TeamPlayerListEntityToJson(TeamPlayerListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['powerReplyTime'] = entity.powerReplyTime;
  data['teamPlayers'] = entity.teamPlayers.map((v) => v.toJson()).toList();
  data['powerP'] = entity.powerP;
  data['OVR'] = entity.oVR;
  data['salary'] = entity.salary;
  data['benchCount'] = entity.benchCount;
  data['salaryCap'] = entity.salaryCap;
  return data;
}

extension TeamPlayerListEntityExtension on TeamPlayerListEntity {
  TeamPlayerListEntity copyWith({
    int? powerReplyTime,
    List<TeamPlayerInfoEntity>? teamPlayers,
    int? powerP,
    int? oVR,
    int? salary,
    int? benchCount,
    int? salaryCap,
  }) {
    return TeamPlayerListEntity()
      ..powerReplyTime = powerReplyTime ?? this.powerReplyTime
      ..teamPlayers = teamPlayers ?? this.teamPlayers
      ..powerP = powerP ?? this.powerP
      ..oVR = oVR ?? this.oVR
      ..salary = salary ?? this.salary
      ..benchCount = benchCount ?? this.benchCount
      ..salaryCap = salaryCap ?? this.salaryCap;
  }
}