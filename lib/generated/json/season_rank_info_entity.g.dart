import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';

SeasonRankInfoEntity $SeasonRankInfoEntityFromJson(Map<String, dynamic> json) {
  final SeasonRankInfoEntity seasonRankInfoEntity = SeasonRankInfoEntity();
  final int? nowCycleEndTime = jsonConvert.convert<int>(
      json['nowCycleEndTime']);
  if (nowCycleEndTime != null) {
    seasonRankInfoEntity.nowCycleEndTime = nowCycleEndTime;
  }
  final List<SeasonRankInfoRanks>? ranks = (json['ranks'] as List<dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<SeasonRankInfoRanks>(e) as SeasonRankInfoRanks)
      .toList();
  if (ranks != null) {
    seasonRankInfoEntity.ranks = ranks;
  }
  final SeasonRankInfoMyRank? myRank = jsonConvert.convert<
      SeasonRankInfoMyRank>(json['myRank']);
  if (myRank != null) {
    seasonRankInfoEntity.myRank = myRank;
  }
  final SeasonRankInfoNextRank? lastRank = jsonConvert.convert<
      SeasonRankInfoNextRank>(json['lastRank']);
  if (lastRank != null) {
    seasonRankInfoEntity.lastRank = lastRank;
  }
  final SeasonRankInfoNextRank? nextRank = jsonConvert.convert<
      SeasonRankInfoNextRank>(json['nextRank']);
  if (nextRank != null) {
    seasonRankInfoEntity.nextRank = nextRank;
  }
  final int? nowCycleStartTime = jsonConvert.convert<int>(
      json['nowCycleStartTime']);
  if (nowCycleStartTime != null) {
    seasonRankInfoEntity.nowCycleStartTime = nowCycleStartTime;
  }
  return seasonRankInfoEntity;
}

Map<String, dynamic> $SeasonRankInfoEntityToJson(SeasonRankInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['nowCycleEndTime'] = entity.nowCycleEndTime;
  data['ranks'] = entity.ranks.map((v) => v.toJson()).toList();
  data['myRank'] = entity.myRank?.toJson();
  data['lastRank'] = entity.lastRank?.toJson();
  data['nextRank'] = entity.nextRank?.toJson();
  data['nowCycleStartTime'] = entity.nowCycleStartTime;
  return data;
}

extension SeasonRankInfoEntityExtension on SeasonRankInfoEntity {
  SeasonRankInfoEntity copyWith({
    int? nowCycleEndTime,
    List<SeasonRankInfoRanks>? ranks,
    SeasonRankInfoMyRank? myRank,
    SeasonRankInfoNextRank? lastRank,
    SeasonRankInfoNextRank? nextRank,
    int? nowCycleStartTime,
  }) {
    return SeasonRankInfoEntity()
      ..nowCycleEndTime = nowCycleEndTime ?? this.nowCycleEndTime
      ..ranks = ranks ?? this.ranks
      ..myRank = myRank ?? this.myRank
      ..lastRank = lastRank ?? this.lastRank
      ..nextRank = nextRank ?? this.nextRank
      ..nowCycleStartTime = nowCycleStartTime ?? this.nowCycleStartTime;
  }
}

SeasonRankInfoRanks $SeasonRankInfoRanksFromJson(Map<String, dynamic> json) {
  final SeasonRankInfoRanks seasonRankInfoRanks = SeasonRankInfoRanks();
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    seasonRankInfoRanks.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    seasonRankInfoRanks.teamName = teamName;
  }
  final String? receivedRewards = jsonConvert.convert<String>(
      json['receivedRewards']);
  if (receivedRewards != null) {
    seasonRankInfoRanks.receivedRewards = receivedRewards;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    seasonRankInfoRanks.createTime = createTime;
  }
  final int? rankId = jsonConvert.convert<int>(json['rankId']);
  if (rankId != null) {
    seasonRankInfoRanks.rankId = rankId;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    seasonRankInfoRanks.seasonId = seasonId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    seasonRankInfoRanks.teamId = teamId;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    seasonRankInfoRanks.rank = rank;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    seasonRankInfoRanks.updateTime = updateTime;
  }
  final double? winPro = jsonConvert.convert<double>(json['winPro']);
  if (winPro != null) {
    seasonRankInfoRanks.winPro = winPro;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    seasonRankInfoRanks.id = id;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    seasonRankInfoRanks.cup = cup;
  }
  return seasonRankInfoRanks;
}

Map<String, dynamic> $SeasonRankInfoRanksToJson(SeasonRankInfoRanks entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['receivedRewards'] = entity.receivedRewards;
  data['createTime'] = entity.createTime;
  data['rankId'] = entity.rankId;
  data['seasonId'] = entity.seasonId;
  data['teamId'] = entity.teamId;
  data['rank'] = entity.rank;
  data['updateTime'] = entity.updateTime;
  data['winPro'] = entity.winPro;
  data['id'] = entity.id;
  data['cup'] = entity.cup;
  return data;
}

extension SeasonRankInfoRanksExtension on SeasonRankInfoRanks {
  SeasonRankInfoRanks copyWith({
    int? teamLogo,
    String? teamName,
    String? receivedRewards,
    int? createTime,
    int? rankId,
    int? seasonId,
    int? teamId,
    int? rank,
    int? updateTime,
    double? winPro,
    int? id,
    int? cup,
  }) {
    return SeasonRankInfoRanks()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..receivedRewards = receivedRewards ?? this.receivedRewards
      ..createTime = createTime ?? this.createTime
      ..rankId = rankId ?? this.rankId
      ..seasonId = seasonId ?? this.seasonId
      ..teamId = teamId ?? this.teamId
      ..rank = rank ?? this.rank
      ..updateTime = updateTime ?? this.updateTime
      ..winPro = winPro ?? this.winPro
      ..id = id ?? this.id
      ..cup = cup ?? this.cup;
  }
}

SeasonRankInfoMyRank $SeasonRankInfoMyRankFromJson(Map<String, dynamic> json) {
  final SeasonRankInfoMyRank seasonRankInfoMyRank = SeasonRankInfoMyRank();
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    seasonRankInfoMyRank.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    seasonRankInfoMyRank.teamName = teamName;
  }
  final String? receivedRewards = jsonConvert.convert<String>(
      json['receivedRewards']);
  if (receivedRewards != null) {
    seasonRankInfoMyRank.receivedRewards = receivedRewards;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    seasonRankInfoMyRank.createTime = createTime;
  }
  final int? rankId = jsonConvert.convert<int>(json['rankId']);
  if (rankId != null) {
    seasonRankInfoMyRank.rankId = rankId;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    seasonRankInfoMyRank.seasonId = seasonId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    seasonRankInfoMyRank.teamId = teamId;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    seasonRankInfoMyRank.rank = rank;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    seasonRankInfoMyRank.updateTime = updateTime;
  }
  final double? winPro = jsonConvert.convert<double>(json['winPro']);
  if (winPro != null) {
    seasonRankInfoMyRank.winPro = winPro;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    seasonRankInfoMyRank.id = id;
  }
  final int? cup = jsonConvert.convert<int>(json['cup']);
  if (cup != null) {
    seasonRankInfoMyRank.cup = cup;
  }
  return seasonRankInfoMyRank;
}

Map<String, dynamic> $SeasonRankInfoMyRankToJson(SeasonRankInfoMyRank entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['receivedRewards'] = entity.receivedRewards;
  data['createTime'] = entity.createTime;
  data['rankId'] = entity.rankId;
  data['seasonId'] = entity.seasonId;
  data['teamId'] = entity.teamId;
  data['rank'] = entity.rank;
  data['updateTime'] = entity.updateTime;
  data['winPro'] = entity.winPro;
  data['id'] = entity.id;
  data['cup'] = entity.cup;
  return data;
}

extension SeasonRankInfoMyRankExtension on SeasonRankInfoMyRank {
  SeasonRankInfoMyRank copyWith({
    int? teamLogo,
    String? teamName,
    String? receivedRewards,
    int? createTime,
    int? rankId,
    int? seasonId,
    int? teamId,
    int? rank,
    int? updateTime,
    double? winPro,
    int? id,
    int? cup,
  }) {
    return SeasonRankInfoMyRank()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..receivedRewards = receivedRewards ?? this.receivedRewards
      ..createTime = createTime ?? this.createTime
      ..rankId = rankId ?? this.rankId
      ..seasonId = seasonId ?? this.seasonId
      ..teamId = teamId ?? this.teamId
      ..rank = rank ?? this.rank
      ..updateTime = updateTime ?? this.updateTime
      ..winPro = winPro ?? this.winPro
      ..id = id ?? this.id
      ..cup = cup ?? this.cup;
  }
}

SeasonRankInfoNextRank $SeasonRankInfoNextRankFromJson(
    Map<String, dynamic> json) {
  final SeasonRankInfoNextRank seasonRankInfoNextRank = SeasonRankInfoNextRank();
  final int? seasonEndTime = jsonConvert.convert<int>(json['seasonEndTime']);
  if (seasonEndTime != null) {
    seasonRankInfoNextRank.seasonEndTime = seasonEndTime;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    seasonRankInfoNextRank.createTime = createTime;
  }
  final int? seasonId = jsonConvert.convert<int>(json['seasonId']);
  if (seasonId != null) {
    seasonRankInfoNextRank.seasonId = seasonId;
  }
  final int? seasonDuration = jsonConvert.convert<int>(json['seasonDuration']);
  if (seasonDuration != null) {
    seasonRankInfoNextRank.seasonDuration = seasonDuration;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    seasonRankInfoNextRank.updateTime = updateTime;
  }
  final int? seasonNum = jsonConvert.convert<int>(json['seasonNum']);
  if (seasonNum != null) {
    seasonRankInfoNextRank.seasonNum = seasonNum;
  }
  final int? seasonStartTime = jsonConvert.convert<int>(
      json['seasonStartTime']);
  if (seasonStartTime != null) {
    seasonRankInfoNextRank.seasonStartTime = seasonStartTime;
  }
  return seasonRankInfoNextRank;
}

Map<String, dynamic> $SeasonRankInfoNextRankToJson(
    SeasonRankInfoNextRank entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['seasonEndTime'] = entity.seasonEndTime;
  data['createTime'] = entity.createTime;
  data['seasonId'] = entity.seasonId;
  data['seasonDuration'] = entity.seasonDuration;
  data['updateTime'] = entity.updateTime;
  data['seasonNum'] = entity.seasonNum;
  data['seasonStartTime'] = entity.seasonStartTime;
  return data;
}

extension SeasonRankInfoNextRankExtension on SeasonRankInfoNextRank {
  SeasonRankInfoNextRank copyWith({
    int? seasonEndTime,
    int? createTime,
    int? seasonId,
    int? seasonDuration,
    int? updateTime,
    int? seasonNum,
    int? seasonStartTime,
  }) {
    return SeasonRankInfoNextRank()
      ..seasonEndTime = seasonEndTime ?? this.seasonEndTime
      ..createTime = createTime ?? this.createTime
      ..seasonId = seasonId ?? this.seasonId
      ..seasonDuration = seasonDuration ?? this.seasonDuration
      ..updateTime = updateTime ?? this.updateTime
      ..seasonNum = seasonNum ?? this.seasonNum
      ..seasonStartTime = seasonStartTime ?? this.seasonStartTime;
  }
}