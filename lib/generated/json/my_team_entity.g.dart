import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';

MyTeamEntity $MyTeamEntityFromJson(Map<String, dynamic> json) {
  final MyTeamEntity myTeamEntity = MyTeamEntity();
  final int? powerReplyTime = jsonConvert.convert<int>(json['powerReplyTime']);
  if (powerReplyTime != null) {
    myTeamEntity.powerReplyTime = powerReplyTime;
  }
  final List<TeamPlayerInfoEntity>? teamPlayers = (json['teamPlayers']
          as List<dynamic>?)
      ?.map((e) =>
          jsonConvert.convert<TeamPlayerInfoEntity>(e) as TeamPlayerInfoEntity)
      .toList();
  if (teamPlayers != null) {
    myTeamEntity.teamPlayers = teamPlayers;
  }
  final int? powerP = jsonConvert.convert<int>(json['powerP']);
  if (powerP != null) {
    myTeamEntity.powerP = powerP;
  }
  final int? oVR = jsonConvert.convert<int>(json['OVR']);
  if (oVR != null) {
    myTeamEntity.oVR = oVR;
  }
  final int? salary = jsonConvert.convert<int>(json['salary']);
  if (salary != null) {
    myTeamEntity.salary = salary;
  }
  final int? salaryCap = jsonConvert.convert<int>(json['salaryCap']);
  if (salaryCap != null) {
    myTeamEntity.salaryCap = salaryCap;
  }
  final int? benchCount = jsonConvert.convert<int>(json['benchCount']);
  if (benchCount != null) {
    myTeamEntity.benchCount = benchCount;
  }
  return myTeamEntity;
}

Map<String, dynamic> $MyTeamEntityToJson(MyTeamEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['powerReplyTime'] = entity.powerReplyTime;
  data['teamPlayers'] = entity.teamPlayers.map((v) => v.toJson()).toList();
  data['powerP'] = entity.powerP;
  data['OVR'] = entity.oVR;
  data['salary'] = entity.salary;
  data['salaryCap'] = entity.salaryCap;
  data['benchCount'] = entity.benchCount;
  return data;
}

extension MyTeamEntityExtension on MyTeamEntity {
  MyTeamEntity copyWith({
    int? powerReplyTime,
    List<TeamPlayerInfoEntity>? teamPlayers,
    int? powerP,
    int? oVR,
    int? salary,
    int? salaryCap,
    int? benchCount,
  }) {
    return MyTeamEntity()
      ..powerReplyTime = powerReplyTime ?? this.powerReplyTime
      ..teamPlayers = teamPlayers ?? this.teamPlayers
      ..powerP = powerP ?? this.powerP
      ..oVR = oVR ?? this.oVR
      ..salary = salary ?? this.salary
      ..salaryCap = salaryCap ?? this.salaryCap
      ..benchCount = benchCount ?? this.benchCount;
  }
}
