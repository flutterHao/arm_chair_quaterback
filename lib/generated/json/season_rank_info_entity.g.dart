import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/season_rank_info_entity.dart';

SeasonRankInfoEntity $SeasonRankInfoEntityFromJson(Map<String, dynamic> json) {
  final SeasonRankInfoEntity seasonRankInfoEntity = SeasonRankInfoEntity();
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
  return seasonRankInfoEntity;
}

Map<String, dynamic> $SeasonRankInfoEntityToJson(SeasonRankInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ranks'] = entity.ranks.map((v) => v.toJson()).toList();
  data['myRank'] = entity.myRank.toJson();
  return data;
}

extension SeasonRankInfoEntityExtension on SeasonRankInfoEntity {
  SeasonRankInfoEntity copyWith({
    List<SeasonRankInfoRanks>? ranks,
    SeasonRankInfoMyRank? myRank,
  }) {
    return SeasonRankInfoEntity()
      ..ranks = ranks ?? this.ranks
      ..myRank = myRank ?? this.myRank;
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
  final int? guessCount = jsonConvert.convert<int>(json['guessCount']);
  if (guessCount != null) {
    seasonRankInfoMyRank.guessCount = guessCount;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    seasonRankInfoMyRank.teamLogo = teamLogo;
  }
  final int? chip = jsonConvert.convert<int>(json['chip']);
  if (chip != null) {
    seasonRankInfoMyRank.chip = chip;
  }
  final int? success = jsonConvert.convert<int>(json['success']);
  if (success != null) {
    seasonRankInfoMyRank.success = success;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    seasonRankInfoMyRank.teamId = teamId;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    seasonRankInfoMyRank.rank = rank;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    seasonRankInfoMyRank.id = id;
  }
  final int? cycle = jsonConvert.convert<int>(json['cycle']);
  if (cycle != null) {
    seasonRankInfoMyRank.cycle = cycle;
  }
  final int? win = jsonConvert.convert<int>(json['win']);
  if (win != null) {
    seasonRankInfoMyRank.win = win;
  }
  return seasonRankInfoMyRank;
}

Map<String, dynamic> $SeasonRankInfoMyRankToJson(SeasonRankInfoMyRank entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessCount'] = entity.guessCount;
  data['teamLogo'] = entity.teamLogo;
  data['chip'] = entity.chip;
  data['success'] = entity.success;
  data['teamId'] = entity.teamId;
  data['rank'] = entity.rank;
  data['id'] = entity.id;
  data['cycle'] = entity.cycle;
  data['win'] = entity.win;
  return data;
}

extension SeasonRankInfoMyRankExtension on SeasonRankInfoMyRank {
  SeasonRankInfoMyRank copyWith({
    int? guessCount,
    int? teamLogo,
    int? chip,
    int? success,
    int? teamId,
    int? rank,
    int? id,
    int? cycle,
    int? win,
  }) {
    return SeasonRankInfoMyRank()
      ..guessCount = guessCount ?? this.guessCount
      ..teamLogo = teamLogo ?? this.teamLogo
      ..chip = chip ?? this.chip
      ..success = success ?? this.success
      ..teamId = teamId ?? this.teamId
      ..rank = rank ?? this.rank
      ..id = id ?? this.id
      ..cycle = cycle ?? this.cycle
      ..win = win ?? this.win;
  }
}