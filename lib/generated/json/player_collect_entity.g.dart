import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/player_collect_entity.dart';
import 'package:get/get.dart';


PlayerCollectEntity $PlayerCollectEntityFromJson(Map<String, dynamic> json) {
  final PlayerCollectEntity playerCollectEntity = PlayerCollectEntity();
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    playerCollectEntity.teamId = teamId;
  }
  final List<PlayerCollectCollects>? collects = (json['collects'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<PlayerCollectCollects>(e) as PlayerCollectCollects)
      .toList();
  if (collects != null) {
    playerCollectEntity.collects = collects;
  }
  final PlayerCollectTeamBookPlayerCollect? teamBookPlayerCollect = jsonConvert
      .convert<PlayerCollectTeamBookPlayerCollect>(
      json['teamBookPlayerCollect']);
  if (teamBookPlayerCollect != null) {
    playerCollectEntity.teamBookPlayerCollect = teamBookPlayerCollect;
  }
  return playerCollectEntity;
}

Map<String, dynamic> $PlayerCollectEntityToJson(PlayerCollectEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamId'] = entity.teamId;
  data['collects'] = entity.collects.map((v) => v.toJson()).toList();
  data['teamBookPlayerCollect'] = entity.teamBookPlayerCollect.toJson();
  return data;
}

extension PlayerCollectEntityExtension on PlayerCollectEntity {
  PlayerCollectEntity copyWith({
    int? teamId,
    List<PlayerCollectCollects>? collects,
    PlayerCollectTeamBookPlayerCollect? teamBookPlayerCollect,
  }) {
    return PlayerCollectEntity()
      ..teamId = teamId ?? this.teamId
      ..collects = collects ?? this.collects
      ..teamBookPlayerCollect = teamBookPlayerCollect ??
          this.teamBookPlayerCollect;
  }
}

PlayerCollectCollects $PlayerCollectCollectsFromJson(
    Map<String, dynamic> json) {
  final PlayerCollectCollects playerCollectCollects = PlayerCollectCollects();
  final int? isAnimation = jsonConvert.convert<int>(json['isAnimation']);
  if (isAnimation != null) {
    playerCollectCollects.isAnimation = isAnimation;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    playerCollectCollects.createTime = createTime;
  }
  final int? isLight = jsonConvert.convert<int>(json['isLight']);
  if (isLight != null) {
    playerCollectCollects.isLight = isLight;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    playerCollectCollects.teamId = teamId;
  }
  final int? fragmentNum = jsonConvert.convert<int>(json['fragmentNum']);
  if (fragmentNum != null) {
    playerCollectCollects.fragmentNum = fragmentNum;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    playerCollectCollects.updateTime = updateTime;
  }
  final int? isActive = jsonConvert.convert<int>(json['isActive']);
  if (isActive != null) {
    playerCollectCollects.isActive = isActive;
  }
  final int? bookId = jsonConvert.convert<int>(json['bookId']);
  if (bookId != null) {
    playerCollectCollects.bookId = bookId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    playerCollectCollects.playerId = playerId;
  }
  final int? needNum = jsonConvert.convert<int>(json['needNum']);
  if (needNum != null) {
    playerCollectCollects.needNum = needNum;
  }
  return playerCollectCollects;
}

Map<String, dynamic> $PlayerCollectCollectsToJson(
    PlayerCollectCollects entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['isAnimation'] = entity.isAnimation;
  data['createTime'] = entity.createTime;
  data['isLight'] = entity.isLight;
  data['teamId'] = entity.teamId;
  data['fragmentNum'] = entity.fragmentNum;
  data['updateTime'] = entity.updateTime;
  data['isActive'] = entity.isActive;
  data['bookId'] = entity.bookId;
  data['playerId'] = entity.playerId;
  data['needNum'] = entity.needNum;
  return data;
}

extension PlayerCollectCollectsExtension on PlayerCollectCollects {
  PlayerCollectCollects copyWith({
    int? isAnimation,
    int? createTime,
    int? isLight,
    dynamic isLightRx,
    int? teamId,
    int? fragmentNum,
    int? updateTime,
    int? isActive,
    int? bookId,
    int? playerId,
    int? needNum,
  }) {
    return PlayerCollectCollects()
      ..isAnimation = isAnimation ?? this.isAnimation
      ..createTime = createTime ?? this.createTime
      ..isLight = isLight ?? this.isLight
      ..isLightRx = isLightRx ?? this.isLightRx
      ..teamId = teamId ?? this.teamId
      ..fragmentNum = fragmentNum ?? this.fragmentNum
      ..updateTime = updateTime ?? this.updateTime
      ..isActive = isActive ?? this.isActive
      ..bookId = bookId ?? this.bookId
      ..playerId = playerId ?? this.playerId
      ..needNum = needNum ?? this.needNum;
  }
}

PlayerCollectTeamBookPlayerCollect $PlayerCollectTeamBookPlayerCollectFromJson(
    Map<String, dynamic> json) {
  final PlayerCollectTeamBookPlayerCollect playerCollectTeamBookPlayerCollect = PlayerCollectTeamBookPlayerCollect();
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    playerCollectTeamBookPlayerCollect.createTime = createTime;
  }
  final int? grade = jsonConvert.convert<int>(json['grade']);
  if (grade != null) {
    playerCollectTeamBookPlayerCollect.grade = grade;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    playerCollectTeamBookPlayerCollect.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    playerCollectTeamBookPlayerCollect.updateTime = updateTime;
  }
  final int? exp = jsonConvert.convert<int>(json['exp']);
  if (exp != null) {
    playerCollectTeamBookPlayerCollect.exp = exp;
  }
  final int? bookId = jsonConvert.convert<int>(json['bookId']);
  if (bookId != null) {
    playerCollectTeamBookPlayerCollect.bookId = bookId;
  }
  final int? needExp = jsonConvert.convert<int>(json['needExp']);
  if (needExp != null) {
    playerCollectTeamBookPlayerCollect.needExp = needExp;
  }
  final int? addSalaryCap = jsonConvert.convert<int>(json['addSalaryCap']);
  if (addSalaryCap != null) {
    playerCollectTeamBookPlayerCollect.addSalaryCap = addSalaryCap;
  }
  return playerCollectTeamBookPlayerCollect;
}

Map<String, dynamic> $PlayerCollectTeamBookPlayerCollectToJson(
    PlayerCollectTeamBookPlayerCollect entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['grade'] = entity.grade;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['exp'] = entity.exp;
  data['bookId'] = entity.bookId;
  data['needExp'] = entity.needExp;
  data['addSalaryCap'] = entity.addSalaryCap;
  return data;
}

extension PlayerCollectTeamBookPlayerCollectExtension on PlayerCollectTeamBookPlayerCollect {
  PlayerCollectTeamBookPlayerCollect copyWith({
    int? createTime,
    int? grade,
    int? teamId,
    int? updateTime,
    int? exp,
    int? bookId,
    int? totalExp,
    int? needExp,
    int? addSalaryCap,
  }) {
    return PlayerCollectTeamBookPlayerCollect()
      ..createTime = createTime ?? this.createTime
      ..grade = grade ?? this.grade
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..exp = exp ?? this.exp
      ..bookId = bookId ?? this.bookId
      ..totalExp = totalExp ?? this.totalExp
      ..needExp = needExp ?? this.needExp
      ..addSalaryCap = addSalaryCap ?? this.addSalaryCap;
  }
}