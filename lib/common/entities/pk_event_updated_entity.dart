import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/pk_event_updated_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/pk_event_updated_entity.g.dart';

@JsonSerializable()
class PkEventUpdatedEntity {
  late List<dynamic> alertList = [];
  late int allGameRound = 0;
  late int awayFuryValue = 0;
  late PkEventUpdatedTeamInfo awayInfo;
  late List<PkEventUpdatedPlayerInfos> awayPlayerInfos = [];
  late int awayScore = 0;
  late int awayStrength = 0;
  late int currRound = 0;
  late int eventId = 0;
  late int homeFuryValue = 0;
  late PkEventUpdatedTeamInfo homeInfo;
  late List<PkEventUpdatedPlayerInfos> homePlayerInfos = [];
  late int homeScore = 0;
  late int homeStrength = 0;

  /// 0|1，前面那个数是罚球数，后面那个数是罚球命中数
  late String parameter = '';
  late int receivePlayerId = 0;
  late int receiveTeamId = 0;
  late int senderOtherPlayerId = 0;
  late int senderPlayerId = 0;
  late int senderTeamId = 0;
  late int state = 0;
  late int stepAwayScore = 0;
  late int stepHomeScore = 0;
  late int stepId = 0;
  late bool useSkillSuccess = false;
  late double awayPreparationLevel;
  late double homePreparationLevel;
  late double awayCurrentStrength = 0;
  late double homeCurrentStrength = 0;

  PkEventUpdatedEntity();

  factory PkEventUpdatedEntity.fromJson(Map<String, dynamic> json) =>
      $PkEventUpdatedEntityFromJson(json);

  Map<String, dynamic> toJson() => $PkEventUpdatedEntityToJson(this);

  /// 罚球个数
  int getFreeThrowCount() {
    if (parameter.isEmpty) {
      return 0;
    }
    return int.parse(parameter.split('|')[0]);
  }

  /// 罚球命中个数
  int getFreeThrowSuccessCount() {
    if (parameter.isEmpty) {
      return 0;
    }
    return int.parse(parameter.split('|')[1]);
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkEventUpdatedTeamInfo {
  late int ast = 0;
  late int astPoint = 0;
  late int blk = 0;
  late int blkPoint = 0;
  late int dreb = 0;
  late int fga = 0;
  late int fgm = 0;
  late int fta = 0;
  late int ftm = 0;
  late int gameId = 0;
  late int min = 0;
  late int mvpPoint = 0;
  late int oreb = 0;
  late int pass = 0;
  late int pf = 0;
  late int playerId = 0;
  late int property = 0;
  late int pts = 0;
  late int ptsPoint = 0;
  late int reb = 0;
  late int rebPoint = 0;
  late bool starter = false;
  late int starterPos = 0;
  late int stl = 0;
  late int teamId = 0;
  late int tech = 0;
  late int threePa = 0;
  late int threePm = 0;
  late int to = 0;

  PkEventUpdatedTeamInfo();

  factory PkEventUpdatedTeamInfo.fromJson(Map<String, dynamic> json) =>
      $PkEventUpdatedTeamInfoFromJson(json);

  Map<String, dynamic> toJson() => $PkEventUpdatedTeamInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PkEventUpdatedPlayerInfos {
  late int ast = 0;
  late int blk = 0;
  late int dreb = 0;
  late int fga = 0;
  late int fgm = 0;
  late int fta = 0;
  late int ftm = 0;
  late int furyValue = 0;
  late int maxPower = 0;
  late int min = 0;
  late int oreb = 0;
  late int pass = 0;
  late int pf = 0;
  late int pkPlayerStrength = 0;
  late int playerId = 0;
  late int power = 0;
  late int pts = 0;
  late int reb = 0;
  late int skillEffectRound = 0;
  late int stl = 0;
  late int tech = 0;
  late int threePa = 0;
  late int threePm = 0;
  late int to = 0;

  PkEventUpdatedPlayerInfos();

  factory PkEventUpdatedPlayerInfos.fromJson(Map<String, dynamic> json) =>
      $PkEventUpdatedPlayerInfosFromJson(json);

  Map<String, dynamic> toJson() => $PkEventUpdatedPlayerInfosToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
