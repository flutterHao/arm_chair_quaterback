import 'dart:ui';

import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/training_info_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/training_info_entity.g.dart';

@JsonSerializable()
class TrainingInfoEntity {
  @JSONField(deserialize: false, serialize: false)
  late RxList<int> selectPlayer = <int>[].obs;
  late List<TeamPlayerInfoEntity> statusReplyPlayers = [];
  @JSONField(deserialize: false, serialize: false)
  late List<TeamPlayerInfoEntity> oldStatusReplyPlayers = [];
  late double playerReadiness = 0.0;
  late List<TrainingInfoAward> award = [];
  late List<int> propArray = [];
  late TrainingInfoProp prop = TrainingInfoProp();
  late TrainingInfoTraining training = TrainingInfoTraining();
  late int awardGroupId = 0;
  late List<TrainingInfoBuff> buff = [];
  late List<TrainingInfoBuff> chooseBuffs = [];
  // @JSONField(deserialize: false, serialize: false)
  // RxInt cash = 0.obs;

  TrainingInfoEntity();

  factory TrainingInfoEntity.fromJson(Map<String, dynamic> json) {
    var info = $TrainingInfoEntityFromJson(json);
    info.buff.sort((a, b) => a.face.compareTo(b.face));
    return info;
  }

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
  // @JSONField(deserialize: false, serialize: false)
  // late RxInt ballNum = 0.obs;

  TrainingInfoProp();

  factory TrainingInfoProp.fromJson(Map<String, dynamic> json) {
    TrainingInfoProp e = $TrainingInfoPropFromJson(json);
    // e.ballNum.value = e.num;
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
  @JSONField(name: "ballRefreshTime")
  late int brt = 0;
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
  late int shieldCount = 0;
  @JSONField(deserialize: false, serialize: false)
  RxDouble taskProgress = 0.0.obs;
  late int todayBuyCount = 0;
  late int eventId = 0;
  // @JSONField(deserialize: false, serialize: false)
  // late RxInt taskValue = 0.obs;

  TrainingInfoTraining();

  int get ballRefreshTime => brt + Utils.getTimeZoneOffset().inMilliseconds;

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
  late int id = 0;
  late double buffValue = 0.1;
  late int createTime = 0;
  late int teamId = 0;
  late int updateTime = 0;
  late int position = 0;
  late int takeEffectGameCount = 0;
  late int buffId = 0;
  late int face = 10;
  late int color = 1;
  @JSONField(deserialize: false, serialize: false)
  late RxBool isOpen = false.obs;
  @JSONField(deserialize: false, serialize: false)
  late RxBool isSelect = false.obs;
  @JSONField(deserialize: false, serialize: false)
  late Rx<Offset> offset = Offset(0, 0).obs;
  @JSONField(deserialize: false, serialize: false)
  late Rx<double> rotate = 0.0.obs;
  late bool showBuff = false;
  late bool isMatch = false;
  late RxBool show = false.obs;
  late double scale = 1.0;

  TrainingInfoBuff();

  factory TrainingInfoBuff.fromJson(Map<String, dynamic> json) {
    var item = $TrainingInfoBuffFromJson(json);
    return item;
  }

  Map<String, dynamic> toJson() => $TrainingInfoBuffToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
