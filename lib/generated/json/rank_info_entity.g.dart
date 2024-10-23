import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';

RankInfoEntity $RankInfoEntityFromJson(Map<String, dynamic> json) {
  final RankInfoEntity rankInfoEntity = RankInfoEntity();
  final double? guessCount = jsonConvert.convert<double>(json['guessCount']);
  if (guessCount != null) {
    rankInfoEntity.guessCount = guessCount;
  }
  final double? teamLogo = jsonConvert.convert<double>(json['teamLogo']);
  if (teamLogo != null) {
    rankInfoEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    rankInfoEntity.teamName = teamName;
  }
  final double? chip = jsonConvert.convert<double>(json['chip']);
  if (chip != null) {
    rankInfoEntity.chip = chip;
  }
  final double? createTime = jsonConvert.convert<double>(json['createTime']);
  if (createTime != null) {
    rankInfoEntity.createTime = createTime;
  }
  final double? success = jsonConvert.convert<double>(json['success']);
  if (success != null) {
    rankInfoEntity.success = success;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    rankInfoEntity.teamId = teamId;
  }
  final double? updateTime = jsonConvert.convert<double>(json['updateTime']);
  if (updateTime != null) {
    rankInfoEntity.updateTime = updateTime;
  }
  final double? win = jsonConvert.convert<double>(json['win']);
  if (win != null) {
    rankInfoEntity.win = win;
  }
  return rankInfoEntity;
}

Map<String, dynamic> $RankInfoEntityToJson(RankInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['guessCount'] = entity.guessCount;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['chip'] = entity.chip;
  data['createTime'] = entity.createTime;
  data['success'] = entity.success;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['win'] = entity.win;
  return data;
}

extension RankInfoEntityExtension on RankInfoEntity {
  RankInfoEntity copyWith({
    double? guessCount,
    double? teamLogo,
    String? teamName,
    double? chip,
    double? createTime,
    double? success,
    int? teamId,
    double? updateTime,
    double? win,
  }) {
    return RankInfoEntity()
      ..guessCount = guessCount ?? this.guessCount
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..chip = chip ?? this.chip
      ..createTime = createTime ?? this.createTime
      ..success = success ?? this.success
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..win = win ?? this.win;
  }
}