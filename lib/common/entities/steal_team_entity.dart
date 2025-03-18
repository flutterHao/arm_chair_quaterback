import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/steal_team_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/steal_team_entity.g.dart';

@JsonSerializable()
class StealTeamEntity {
  late int teamLogo = 0;
  late String teamName = '';
  late List<StealTeamPlayers> players = [];
  late int teamId = 0;
  late int currTeamStrength = 0;
  late int logoBoxId = 0;
  late bool online = false;
  late int teamGrade = 0;
  late bool isRevenge = false;

  StealTeamEntity();

  factory StealTeamEntity.fromJson(Map<String, dynamic> json) =>
      $StealTeamEntityFromJson(json);

  Map<String, dynamic> toJson() => $StealTeamEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StealTeamPlayers {
  String uuid = '';
  int playerId = 0;
  bool systemPlayer = false;

  StealTeamPlayers();

  factory StealTeamPlayers.fromJson(Map<String, dynamic> json) =>
      $StealTeamPlayersFromJson(json);

  Map<String, dynamic> toJson() => $StealTeamPlayersToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StealTeamPlayersPotential {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  StealTeamPlayersPotential();

  factory StealTeamPlayersPotential.fromJson(Map<String, dynamic> json) =>
      $StealTeamPlayersPotentialFromJson(json);

  Map<String, dynamic> toJson() => $StealTeamPlayersPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class StealTeamPlayersUpStarBase {
  late int blk = 0;
  late int tech = 0;
  late int pass = 0;
  late int stl = 0;
  late int threePm = 0;
  late int ftm = 0;
  late int pts = 0;
  late int reb = 0;

  StealTeamPlayersUpStarBase();

  factory StealTeamPlayersUpStarBase.fromJson(Map<String, dynamic> json) =>
      $StealTeamPlayersUpStarBaseFromJson(json);

  Map<String, dynamic> toJson() => $StealTeamPlayersUpStarBaseToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
