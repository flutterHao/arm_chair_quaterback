import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/training_info_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/training_info_entity.g.dart';

@JsonSerializable()
class TrainingInfoEntity {
  late List<TrainingInfoAward> award = [];
  late List<int> propArray = [];
  late TrainingInfoProp prop = TrainingInfoProp();
  late TrainingInfoTraining training = TrainingInfoTraining();
  late int awardGroupId = 0;
  late List<TrainingInfoBuff> buff = [];

  TrainingInfoEntity();

  factory TrainingInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TrainingInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TrainingInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TrainingInfoAward {
  late int num = 0;
  late int id = 0;
  late int type = 0;

  TrainingInfoAward();

  factory TrainingInfoAward.fromJson(Map<String, dynamic> json) =>
      $TrainingInfoAwardFromJson(json);

  Map<String, dynamic> toJson() => $TrainingInfoAwardToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TrainingInfoProp {
  late int createTime = 0;
  late int num = 0;
  late int propId = 0;
  late int teamId = 0;
  late int updateTime = 0;
  late RxInt ballNum = 0.obs;

  TrainingInfoProp();

  factory TrainingInfoProp.fromJson(Map<String, dynamic> json) {
    TrainingInfoProp e = $TrainingInfoPropFromJson(json);
    e.ballNum.value = e.num;
    return e;
  }

  Map<String, dynamic> toJson() => $TrainingInfoPropToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TrainingInfoTraining {
  late int ballRefreshTime = 0;
  late int taskItemCount = 0;
  late int createTime = 0;
  late int currentTaskId = 0;
  late int teamId = 0;
  late int todayTaskOver = 0;
  late int currentAwardIndex = 0;
  late int todayCount = 0;
  late int updateTime = 0;
  late int totalCount = 0;
  late int currentLineId = 0;
  late int taskEndTime = 0;

  TrainingInfoTraining();

  factory TrainingInfoTraining.fromJson(Map<String, dynamic> json) =>
      $TrainingInfoTrainingFromJson(json);

  Map<String, dynamic> toJson() => $TrainingInfoTrainingToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TrainingInfoBuff {
  late double buffValue;
  late int createTime = 0;
  late int teamId = 0;
  late int updateTime = 0;
  late int position = 0;
  late int takeEffectGameCount = 0;

  TrainingInfoBuff();

  factory TrainingInfoBuff.fromJson(Map<String, dynamic> json) =>
      $TrainingInfoBuffFromJson(json);

  Map<String, dynamic> toJson() => $TrainingInfoBuffToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
