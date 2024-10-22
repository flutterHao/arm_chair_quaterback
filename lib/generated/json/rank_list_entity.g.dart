import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';


RankListEntity $RankListEntityFromJson(Map<String, dynamic> json) {
  final RankListEntity rankListEntity = RankListEntity();
  final List<RankInfoEntity>? ranks = (json['ranks'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<RankInfoEntity>(e) as RankInfoEntity)
      .toList();
  if (ranks != null) {
    rankListEntity.ranks = ranks;
  }
  final RankListMyRank? myRank = jsonConvert.convert<RankListMyRank>(
      json['myRank']);
  if (myRank != null) {
    rankListEntity.myRank = myRank;
  }
  return rankListEntity;
}

Map<String, dynamic> $RankListEntityToJson(RankListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ranks'] = entity.ranks.map((v) => v.toJson()).toList();
  data['myRank'] = entity.myRank.toJson();
  return data;
}

extension RankListEntityExtension on RankListEntity {
  RankListEntity copyWith({
    List<RankInfoEntity>? ranks,
    RankListMyRank? myRank,
  }) {
    return RankListEntity()
      ..ranks = ranks ?? this.ranks
      ..myRank = myRank ?? this.myRank;
  }
}

RankListMyRank $RankListMyRankFromJson(Map<String, dynamic> json) {
  final RankListMyRank rankListMyRank = RankListMyRank();
  final int? guessCount = jsonConvert.convert<int>(json['guessCount']);
  if (guessCount != null) {
    rankListMyRank.guessCount = guessCount;
  }
  final int? teamLogo = jsonConvert.convert<int>(json['teamLogo']);
  if (teamLogo != null) {
    rankListMyRank.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    rankListMyRank.teamName = teamName;
  }
  final int? chip = jsonConvert.convert<int>(json['chip']);
  if (chip != null) {
    rankListMyRank.chip = chip;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    rankListMyRank.createTime = createTime;
  }
  final double? success = jsonConvert.convert<double>(json['success']);
  if (success != null) {
    rankListMyRank.success = success;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    rankListMyRank.teamId = teamId;
  }
  final int? rank = jsonConvert.convert<int>(json['rank']);
  if (rank != null) {
    rankListMyRank.rank = rank;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    rankListMyRank.updateTime = updateTime;
  }
  final int? cycle = jsonConvert.convert<int>(json['cycle']);
  if (cycle != null) {
    rankListMyRank.cycle = cycle;
  }
  final int? win = jsonConvert.convert<int>(json['win']);
  if (win != null) {
    rankListMyRank.win = win;
  }
  return rankListMyRank;
}

Map<String, dynamic> $RankListMyRankToJson(RankListMyRank entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessCount'] = entity.guessCount;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['chip'] = entity.chip;
  data['createTime'] = entity.createTime;
  data['success'] = entity.success;
  data['teamId'] = entity.teamId;
  data['rank'] = entity.rank;
  data['updateTime'] = entity.updateTime;
  data['cycle'] = entity.cycle;
  data['win'] = entity.win;
  return data;
}

extension RankListMyRankExtension on RankListMyRank {
  RankListMyRank copyWith({
    int? guessCount,
    int? teamLogo,
    String? teamName,
    int? chip,
    int? createTime,
    double? success,
    int? teamId,
    int? rank,
    int? updateTime,
    int? cycle,
    int? win,
  }) {
    return RankListMyRank()
      ..guessCount = guessCount ?? this.guessCount
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..chip = chip ?? this.chip
      ..createTime = createTime ?? this.createTime
      ..success = success ?? this.success
      ..teamId = teamId ?? this.teamId
      ..rank = rank ?? this.rank
      ..updateTime = updateTime ?? this.updateTime
      ..cycle = cycle ?? this.cycle
      ..win = win ?? this.win;
  }
}