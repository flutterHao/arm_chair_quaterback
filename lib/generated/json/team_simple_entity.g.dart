import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';

TeamSimpleEntity $TeamSimpleEntityFromJson(Map<String, dynamic> json) {
  final TeamSimpleEntity teamSimpleEntity = TeamSimpleEntity();
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    teamSimpleEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    teamSimpleEntity.teamName = teamName;
  }
  final int? winCount = jsonConvert.convert<int>(json['winCount']);
  if (winCount != null) {
    teamSimpleEntity.winCount = winCount;
  }
  final int? teamGrade = jsonConvert.convert<int>(json['teamGrade']);
  if (teamGrade != null) {
    teamSimpleEntity.teamGrade = teamGrade;
  }
  final String? serverId = jsonConvert.convert<String>(json['serverId']);
  if (serverId != null) {
    teamSimpleEntity.serverId = serverId;
  }
  final String? lastGuess = jsonConvert.convert<String>(json['lastGuess']);
  if (lastGuess != null) {
    teamSimpleEntity.lastGuess = lastGuess;
  }
  final int? vipGrade = jsonConvert.convert<int>(json['vipGrade']);
  if (vipGrade != null) {
    teamSimpleEntity.vipGrade = vipGrade;
  }
  final int? friendType = jsonConvert.convert<int>(json['friendType']);
  if (friendType != null) {
    teamSimpleEntity.friendType = friendType;
  }
  final int? expertTop = jsonConvert.convert<int>(json['expertTop']);
  if (expertTop != null) {
    teamSimpleEntity.expertTop = expertTop;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    teamSimpleEntity.teamId = teamId;
  }
  final int? currTeamStrength = jsonConvert.convert<int>(
      json['currTeamStrength']);
  if (currTeamStrength != null) {
    teamSimpleEntity.currTeamStrength = currTeamStrength;
  }
  final int? logoBoxId = jsonConvert.convert<int>(json['logoBoxId']);
  if (logoBoxId != null) {
    teamSimpleEntity.logoBoxId = logoBoxId;
  }
  final int? lastOffLineTime = jsonConvert.convert<int>(
      json['lastOffLineTime']);
  if (lastOffLineTime != null) {
    teamSimpleEntity.lastOffLineTime = lastOffLineTime;
  }
  final bool? online = jsonConvert.convert<bool>(json['online']);
  if (online != null) {
    teamSimpleEntity.online = online;
  }
  final int? wearNicknameId = jsonConvert.convert<int>(json['wearNicknameId']);
  if (wearNicknameId != null) {
    teamSimpleEntity.wearNicknameId = wearNicknameId;
  }
  final int? betCoin = jsonConvert.convert<int>(json['betCoin']);
  if (betCoin != null) {
    teamSimpleEntity.betCoin = betCoin;
  }
  final double? guessSuccessRate = jsonConvert.convert<double>(
      json['guessSuccessRate']);
  if (guessSuccessRate != null) {
    teamSimpleEntity.guessSuccessRate = guessSuccessRate;
  }
  return teamSimpleEntity;
}

Map<String, dynamic> $TeamSimpleEntityToJson(TeamSimpleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['winCount'] = entity.winCount;
  data['teamGrade'] = entity.teamGrade;
  data['serverId'] = entity.serverId;
  data['lastGuess'] = entity.lastGuess;
  data['vipGrade'] = entity.vipGrade;
  data['friendType'] = entity.friendType;
  data['expertTop'] = entity.expertTop;
  data['teamId'] = entity.teamId;
  data['currTeamStrength'] = entity.currTeamStrength;
  data['logoBoxId'] = entity.logoBoxId;
  data['lastOffLineTime'] = entity.lastOffLineTime;
  data['online'] = entity.online;
  data['wearNicknameId'] = entity.wearNicknameId;
  data['betCoin'] = entity.betCoin;
  data['guessSuccessRate'] = entity.guessSuccessRate;
  return data;
}

extension TeamSimpleEntityExtension on TeamSimpleEntity {
  TeamSimpleEntity copyWith({
    int? teamLogo,
    String? teamName,
    int? winCount,
    int? teamGrade,
    String? serverId,
    String? lastGuess,
    int? vipGrade,
    int? friendType,
    int? expertTop,
    int? teamId,
    int? currTeamStrength,
    int? logoBoxId,
    int? lastOffLineTime,
    bool? online,
    int? wearNicknameId,
    int? betCoin,
    double? guessSuccessRate,
  }) {
    return TeamSimpleEntity()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..winCount = winCount ?? this.winCount
      ..teamGrade = teamGrade ?? this.teamGrade
      ..serverId = serverId ?? this.serverId
      ..lastGuess = lastGuess ?? this.lastGuess
      ..vipGrade = vipGrade ?? this.vipGrade
      ..friendType = friendType ?? this.friendType
      ..expertTop = expertTop ?? this.expertTop
      ..teamId = teamId ?? this.teamId
      ..currTeamStrength = currTeamStrength ?? this.currTeamStrength
      ..logoBoxId = logoBoxId ?? this.logoBoxId
      ..lastOffLineTime = lastOffLineTime ?? this.lastOffLineTime
      ..online = online ?? this.online
      ..wearNicknameId = wearNicknameId ?? this.wearNicknameId
      ..betCoin = betCoin ?? this.betCoin
      ..guessSuccessRate = guessSuccessRate ?? this.guessSuccessRate;
  }
}