import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';

TeamSimpleEntity $TeamSimpleEntityFromJson(Map<String, dynamic> json) {
  final TeamSimpleEntity teamSimpleEntity = TeamSimpleEntity();
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    teamSimpleEntity.teamName = teamName;
  }
  final int? totalGames = jsonConvert.convert<int>(json['totalGames']);
  if (totalGames != null) {
    teamSimpleEntity.totalGames = totalGames;
  }
  final String? signature = jsonConvert.convert<String>(json['signature']);
  if (signature != null) {
    teamSimpleEntity.signature = signature;
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
  final int? maxGameWinningStreak = jsonConvert.convert<int>(
      json['maxGameWinningStreak']);
  if (maxGameWinningStreak != null) {
    teamSimpleEntity.maxGameWinningStreak = maxGameWinningStreak;
  }
  final int? cupRankId = jsonConvert.convert<int>(json['cupRankId']);
  if (cupRankId != null) {
    teamSimpleEntity.cupRankId = cupRankId;
  }
  final int? expertTop = jsonConvert.convert<int>(json['expertTop']);
  if (expertTop != null) {
    teamSimpleEntity.expertTop = expertTop;
  }
  final int? guessSuccessRate = jsonConvert.convert<int>(
      json['guessSuccessRate']);
  if (guessSuccessRate != null) {
    teamSimpleEntity.guessSuccessRate = guessSuccessRate;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    teamSimpleEntity.teamLogo = teamLogo;
  }
  final int? winCount = jsonConvert.convert<int>(json['winCount']);
  if (winCount != null) {
    teamSimpleEntity.winCount = winCount;
  }
  final int? currentWinGames = jsonConvert.convert<int>(
      json['currentWinGames']);
  if (currentWinGames != null) {
    teamSimpleEntity.currentWinGames = currentWinGames;
  }
  final int? currentContinuousLoss = jsonConvert.convert<int>(
      json['currentContinuousLoss']);
  if (currentContinuousLoss != null) {
    teamSimpleEntity.currentContinuousLoss = currentContinuousLoss;
  }
  final int? currentGameWinningStreak = jsonConvert.convert<int>(
      json['currentGameWinningStreak']);
  if (currentGameWinningStreak != null) {
    teamSimpleEntity.currentGameWinningStreak = currentGameWinningStreak;
  }
  final int? friendType = jsonConvert.convert<int>(json['friendType']);
  if (friendType != null) {
    teamSimpleEntity.friendType = friendType;
  }
  final int? maxCup = jsonConvert.convert<int>(json['maxCup']);
  if (maxCup != null) {
    teamSimpleEntity.maxCup = maxCup;
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
  final double? gameWinRate = jsonConvert.convert<double>(json['gameWinRate']);
  if (gameWinRate != null) {
    teamSimpleEntity.gameWinRate = gameWinRate;
  }
  final int? betCoin = jsonConvert.convert<int>(json['betCoin']);
  if (betCoin != null) {
    teamSimpleEntity.betCoin = betCoin;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    teamSimpleEntity.cup = cup;
  }
  final String? receivedRewards = jsonConvert.convert<String>(
      json['receivedRewards']);
  if (receivedRewards != null) {
    teamSimpleEntity.receivedRewards = receivedRewards;
  }
  return teamSimpleEntity;
}

Map<String, dynamic> $TeamSimpleEntityToJson(TeamSimpleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamName'] = entity.teamName;
  data['totalGames'] = entity.totalGames;
  data['signature'] = entity.signature;
  data['teamGrade'] = entity.teamGrade;
  data['serverId'] = entity.serverId;
  data['lastGuess'] = entity.lastGuess;
  data['vipGrade'] = entity.vipGrade;
  data['maxGameWinningStreak'] = entity.maxGameWinningStreak;
  data['cupRankId'] = entity.cupRankId;
  data['expertTop'] = entity.expertTop;
  data['guessSuccessRate'] = entity.guessSuccessRate;
  data['teamLogo'] = entity.teamLogo;
  data['winCount'] = entity.winCount;
  data['currentWinGames'] = entity.currentWinGames;
  data['currentContinuousLoss'] = entity.currentContinuousLoss;
  data['currentGameWinningStreak'] = entity.currentGameWinningStreak;
  data['friendType'] = entity.friendType;
  data['maxCup'] = entity.maxCup;
  data['teamId'] = entity.teamId;
  data['currTeamStrength'] = entity.currTeamStrength;
  data['logoBoxId'] = entity.logoBoxId;
  data['lastOffLineTime'] = entity.lastOffLineTime;
  data['online'] = entity.online;
  data['wearNicknameId'] = entity.wearNicknameId;
  data['gameWinRate'] = entity.gameWinRate;
  data['betCoin'] = entity.betCoin;
  data['cup'] = entity.cup;
  data['receivedRewards'] = entity.receivedRewards;
  return data;
}

extension TeamSimpleEntityExtension on TeamSimpleEntity {
  TeamSimpleEntity copyWith({
    String? teamName,
    int? totalGames,
    String? signature,
    int? teamGrade,
    String? serverId,
    String? lastGuess,
    int? vipGrade,
    int? maxGameWinningStreak,
    int? cupRankId,
    int? expertTop,
    int? guessSuccessRate,
    int? teamLogo,
    int? winCount,
    int? currentWinGames,
    int? currentContinuousLoss,
    int? currentGameWinningStreak,
    int? friendType,
    int? maxCup,
    int? teamId,
    int? currTeamStrength,
    int? logoBoxId,
    int? lastOffLineTime,
    bool? online,
    int? wearNicknameId,
    double? gameWinRate,
    int? betCoin,
    int? cup,
    String? receivedRewards,
  }) {
    return TeamSimpleEntity()
      ..teamName = teamName ?? this.teamName
      ..totalGames = totalGames ?? this.totalGames
      ..signature = signature ?? this.signature
      ..teamGrade = teamGrade ?? this.teamGrade
      ..serverId = serverId ?? this.serverId
      ..lastGuess = lastGuess ?? this.lastGuess
      ..vipGrade = vipGrade ?? this.vipGrade
      ..maxGameWinningStreak = maxGameWinningStreak ?? this.maxGameWinningStreak
      ..cupRankId = cupRankId ?? this.cupRankId
      ..expertTop = expertTop ?? this.expertTop
      ..guessSuccessRate = guessSuccessRate ?? this.guessSuccessRate
      ..teamLogo = teamLogo ?? this.teamLogo
      ..winCount = winCount ?? this.winCount
      ..currentWinGames = currentWinGames ?? this.currentWinGames
      ..currentContinuousLoss = currentContinuousLoss ??
          this.currentContinuousLoss
      ..currentGameWinningStreak = currentGameWinningStreak ??
          this.currentGameWinningStreak
      ..friendType = friendType ?? this.friendType
      ..maxCup = maxCup ?? this.maxCup
      ..teamId = teamId ?? this.teamId
      ..currTeamStrength = currTeamStrength ?? this.currTeamStrength
      ..logoBoxId = logoBoxId ?? this.logoBoxId
      ..lastOffLineTime = lastOffLineTime ?? this.lastOffLineTime
      ..online = online ?? this.online
      ..wearNicknameId = wearNicknameId ?? this.wearNicknameId
      ..gameWinRate = gameWinRate ?? this.gameWinRate
      ..betCoin = betCoin ?? this.betCoin
      ..cup = cup ?? this.cup
      ..receivedRewards = receivedRewards ?? this.receivedRewards;
  }
}