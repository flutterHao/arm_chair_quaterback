import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:get/get.dart';


TrainingInfoEntity $TrainingInfoEntityFromJson(Map<String, dynamic> json) {
  final TrainingInfoEntity trainingInfoEntity = TrainingInfoEntity();
  final List<int>? statusReplyPlayers = (json['statusReplyPlayers'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (statusReplyPlayers != null) {
    trainingInfoEntity.statusReplyPlayers = statusReplyPlayers;
  }
  final double? playerReadiness = jsonConvert.convert<double>(
      json['playerReadiness']);
  if (playerReadiness != null) {
    trainingInfoEntity.playerReadiness = playerReadiness;
  }
  final List<TrainingInfoAward>? award = (json['award'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TrainingInfoAward>(e) as TrainingInfoAward)
      .toList();
  if (award != null) {
    trainingInfoEntity.award = award;
  }
  final List<int>? propArray = (json['propArray'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (propArray != null) {
    trainingInfoEntity.propArray = propArray;
  }
  final TrainingInfoProp? prop = jsonConvert.convert<TrainingInfoProp>(
      json['prop']);
  if (prop != null) {
    trainingInfoEntity.prop = prop;
  }
  final TrainingInfoTraining? training = jsonConvert.convert<
      TrainingInfoTraining>(json['training']);
  if (training != null) {
    trainingInfoEntity.training = training;
  }
  final int? awardGroupId = jsonConvert.convert<int>(json['awardGroupId']);
  if (awardGroupId != null) {
    trainingInfoEntity.awardGroupId = awardGroupId;
  }
  final List<TrainingInfoBuff>? buff = (json['buff'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<TrainingInfoBuff>(e) as TrainingInfoBuff)
      .toList();
  if (buff != null) {
    trainingInfoEntity.buff = buff;
  }
  return trainingInfoEntity;
}

Map<String, dynamic> $TrainingInfoEntityToJson(TrainingInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['statusReplyPlayers'] = entity.statusReplyPlayers;
  data['playerReadiness'] = entity.playerReadiness;
  data['award'] = entity.award.map((v) => v.toJson()).toList();
  data['propArray'] = entity.propArray;
  data['prop'] = entity.prop.toJson();
  data['training'] = entity.training.toJson();
  data['awardGroupId'] = entity.awardGroupId;
  data['buff'] = entity.buff.map((v) => v.toJson()).toList();
  return data;
}

extension TrainingInfoEntityExtension on TrainingInfoEntity {
  TrainingInfoEntity copyWith({
    List<int>? statusReplyPlayers,
    double? playerReadiness,
    List<TrainingInfoAward>? award,
    List<int>? propArray,
    TrainingInfoProp? prop,
    TrainingInfoTraining? training,
    int? awardGroupId,
    List<TrainingInfoBuff>? buff,
  }) {
    return TrainingInfoEntity()
      ..statusReplyPlayers = statusReplyPlayers ?? this.statusReplyPlayers
      ..playerReadiness = playerReadiness ?? this.playerReadiness
      ..award = award ?? this.award
      ..propArray = propArray ?? this.propArray
      ..prop = prop ?? this.prop
      ..training = training ?? this.training
      ..awardGroupId = awardGroupId ?? this.awardGroupId
      ..buff = buff ?? this.buff;
  }
}

TrainingInfoAward $TrainingInfoAwardFromJson(Map<String, dynamic> json) {
  final TrainingInfoAward trainingInfoAward = TrainingInfoAward();
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    trainingInfoAward.num = num;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    trainingInfoAward.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    trainingInfoAward.type = type;
  }
  return trainingInfoAward;
}

Map<String, dynamic> $TrainingInfoAwardToJson(TrainingInfoAward entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['num'] = entity.num;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension TrainingInfoAwardExtension on TrainingInfoAward {
  TrainingInfoAward copyWith({
    int? num,
    int? id,
    int? type,
  }) {
    return TrainingInfoAward()
      ..num = num ?? this.num
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}

TrainingInfoProp $TrainingInfoPropFromJson(Map<String, dynamic> json) {
  final TrainingInfoProp trainingInfoProp = TrainingInfoProp();
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    trainingInfoProp.createTime = createTime;
  }
  final int? num = jsonConvert.convert<int>(json['num']);
  if (num != null) {
    trainingInfoProp.num = num;
  }
  final int? propId = jsonConvert.convert<int>(json['propId']);
  if (propId != null) {
    trainingInfoProp.propId = propId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    trainingInfoProp.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    trainingInfoProp.updateTime = updateTime;
  }
  final RxInt? ballNum = jsonConvert.convert<RxInt>(json['ballNum']);
  if (ballNum != null) {
    trainingInfoProp.ballNum = ballNum;
  }
  return trainingInfoProp;
}

Map<String, dynamic> $TrainingInfoPropToJson(TrainingInfoProp entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['createTime'] = entity.createTime;
  data['num'] = entity.num;
  data['propId'] = entity.propId;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['ballNum'] = entity.ballNum.toJson();
  return data;
}

extension TrainingInfoPropExtension on TrainingInfoProp {
  TrainingInfoProp copyWith({
    int? createTime,
    int? num,
    int? propId,
    int? teamId,
    int? updateTime,
    RxInt? ballNum,
  }) {
    return TrainingInfoProp()
      ..createTime = createTime ?? this.createTime
      ..num = num ?? this.num
      ..propId = propId ?? this.propId
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..ballNum = ballNum ?? this.ballNum;
  }
}

TrainingInfoTraining $TrainingInfoTrainingFromJson(Map<String, dynamic> json) {
  final TrainingInfoTraining trainingInfoTraining = TrainingInfoTraining();
  final int? ballRefreshTime = jsonConvert.convert<int>(
      json['ballRefreshTime']);
  if (ballRefreshTime != null) {
    trainingInfoTraining.ballRefreshTime = ballRefreshTime;
  }
  final int? taskItemCount = jsonConvert.convert<int>(json['taskItemCount']);
  if (taskItemCount != null) {
    trainingInfoTraining.taskItemCount = taskItemCount;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    trainingInfoTraining.createTime = createTime;
  }
  final int? currentTaskId = jsonConvert.convert<int>(json['currentTaskId']);
  if (currentTaskId != null) {
    trainingInfoTraining.currentTaskId = currentTaskId;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    trainingInfoTraining.teamId = teamId;
  }
  final int? todayTaskOver = jsonConvert.convert<int>(json['todayTaskOver']);
  if (todayTaskOver != null) {
    trainingInfoTraining.todayTaskOver = todayTaskOver;
  }
  final int? currentAwardIndex = jsonConvert.convert<int>(
      json['currentAwardIndex']);
  if (currentAwardIndex != null) {
    trainingInfoTraining.currentAwardIndex = currentAwardIndex;
  }
  final int? todayCount = jsonConvert.convert<int>(json['todayCount']);
  if (todayCount != null) {
    trainingInfoTraining.todayCount = todayCount;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    trainingInfoTraining.updateTime = updateTime;
  }
  final int? totalCount = jsonConvert.convert<int>(json['totalCount']);
  if (totalCount != null) {
    trainingInfoTraining.totalCount = totalCount;
  }
  final int? currentLineId = jsonConvert.convert<int>(json['currentLineId']);
  if (currentLineId != null) {
    trainingInfoTraining.currentLineId = currentLineId;
  }
  final int? taskEndTime = jsonConvert.convert<int>(json['taskEndTime']);
  if (taskEndTime != null) {
    trainingInfoTraining.taskEndTime = taskEndTime;
  }
  return trainingInfoTraining;
}

Map<String, dynamic> $TrainingInfoTrainingToJson(TrainingInfoTraining entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ballRefreshTime'] = entity.ballRefreshTime;
  data['taskItemCount'] = entity.taskItemCount;
  data['createTime'] = entity.createTime;
  data['currentTaskId'] = entity.currentTaskId;
  data['teamId'] = entity.teamId;
  data['todayTaskOver'] = entity.todayTaskOver;
  data['currentAwardIndex'] = entity.currentAwardIndex;
  data['todayCount'] = entity.todayCount;
  data['updateTime'] = entity.updateTime;
  data['totalCount'] = entity.totalCount;
  data['currentLineId'] = entity.currentLineId;
  data['taskEndTime'] = entity.taskEndTime;
  return data;
}

extension TrainingInfoTrainingExtension on TrainingInfoTraining {
  TrainingInfoTraining copyWith({
    int? ballRefreshTime,
    int? taskItemCount,
    int? createTime,
    int? currentTaskId,
    int? teamId,
    int? todayTaskOver,
    int? currentAwardIndex,
    int? todayCount,
    int? updateTime,
    int? totalCount,
    int? currentLineId,
    int? taskEndTime,
  }) {
    return TrainingInfoTraining()
      ..ballRefreshTime = ballRefreshTime ?? this.ballRefreshTime
      ..taskItemCount = taskItemCount ?? this.taskItemCount
      ..createTime = createTime ?? this.createTime
      ..currentTaskId = currentTaskId ?? this.currentTaskId
      ..teamId = teamId ?? this.teamId
      ..todayTaskOver = todayTaskOver ?? this.todayTaskOver
      ..currentAwardIndex = currentAwardIndex ?? this.currentAwardIndex
      ..todayCount = todayCount ?? this.todayCount
      ..updateTime = updateTime ?? this.updateTime
      ..totalCount = totalCount ?? this.totalCount
      ..currentLineId = currentLineId ?? this.currentLineId
      ..taskEndTime = taskEndTime ?? this.taskEndTime;
  }
}

TrainingInfoBuff $TrainingInfoBuffFromJson(Map<String, dynamic> json) {
  final TrainingInfoBuff trainingInfoBuff = TrainingInfoBuff();
  final double? buffValue = jsonConvert.convert<double>(json['buffValue']);
  if (buffValue != null) {
    trainingInfoBuff.buffValue = buffValue;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    trainingInfoBuff.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    trainingInfoBuff.teamId = teamId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    trainingInfoBuff.updateTime = updateTime;
  }
  final int? position = jsonConvert.convert<int>(json['position']);
  if (position != null) {
    trainingInfoBuff.position = position;
  }
  final int? takeEffectGameCount = jsonConvert.convert<int>(
      json['takeEffectGameCount']);
  if (takeEffectGameCount != null) {
    trainingInfoBuff.takeEffectGameCount = takeEffectGameCount;
  }
  return trainingInfoBuff;
}

Map<String, dynamic> $TrainingInfoBuffToJson(TrainingInfoBuff entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['buffValue'] = entity.buffValue;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['updateTime'] = entity.updateTime;
  data['position'] = entity.position;
  data['takeEffectGameCount'] = entity.takeEffectGameCount;
  return data;
}

extension TrainingInfoBuffExtension on TrainingInfoBuff {
  TrainingInfoBuff copyWith({
    double? buffValue,
    int? createTime,
    int? teamId,
    int? updateTime,
    int? position,
    int? takeEffectGameCount,
  }) {
    return TrainingInfoBuff()
      ..buffValue = buffValue ?? this.buffValue
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..updateTime = updateTime ?? this.updateTime
      ..position = position ?? this.position
      ..takeEffectGameCount = takeEffectGameCount ?? this.takeEffectGameCount;
  }
}