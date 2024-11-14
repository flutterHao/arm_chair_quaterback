import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/train_define_entity.dart';

TrainDefineEntity $TrainDefineEntityFromJson(Map<String, dynamic> json) {
  final TrainDefineEntity trainDefineEntity = TrainDefineEntity();
  final int? ballMaxNum = jsonConvert.convert<int>(json['ballMaxNum']);
  if (ballMaxNum != null) {
    trainDefineEntity.ballMaxNum = ballMaxNum;
  }
  final int? ballRecoverNum = jsonConvert.convert<int>(json['ballRecoverNum']);
  if (ballRecoverNum != null) {
    trainDefineEntity.ballRecoverNum = ballRecoverNum;
  }
  final int? ballRecoverTime = jsonConvert.convert<int>(
      json['ballRecoverTime']);
  if (ballRecoverTime != null) {
    trainDefineEntity.ballRecoverTime = ballRecoverTime;
  }
  final int? coinChangeBall = jsonConvert.convert<int>(json['coinChangeBall']);
  if (coinChangeBall != null) {
    trainDefineEntity.coinChangeBall = coinChangeBall;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    trainDefineEntity.id = id;
  }
  final List<int>? lineOrder = (json['lineOrder'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (lineOrder != null) {
    trainDefineEntity.lineOrder = lineOrder;
  }
  final double? shootInWeight = jsonConvert.convert<double>(
      json['shootInWeight']);
  if (shootInWeight != null) {
    trainDefineEntity.shootInWeight = shootInWeight;
  }
  final List<int>? taskCollect = (json['taskCollect'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (taskCollect != null) {
    trainDefineEntity.taskCollect = taskCollect;
  }
  final int? taskRefresh = jsonConvert.convert<int>(json['taskRefresh']);
  if (taskRefresh != null) {
    trainDefineEntity.taskRefresh = taskRefresh;
  }
  final int? taskTrigger = jsonConvert.convert<int>(json['taskTrigger']);
  if (taskTrigger != null) {
    trainDefineEntity.taskTrigger = taskTrigger;
  }
  final List<int>? trainBuffAdd = (json['trainBuffAdd'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (trainBuffAdd != null) {
    trainDefineEntity.trainBuffAdd = trainBuffAdd;
  }
  final List<int>? trainLessMoney = (json['trainLessMoney'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (trainLessMoney != null) {
    trainDefineEntity.trainLessMoney = trainLessMoney;
  }
  final List<int>? trainMoneyCon = (json['trainMoneyCon'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (trainMoneyCon != null) {
    trainDefineEntity.trainMoneyCon = trainMoneyCon;
  }
  final List<int>? trainNormalMoney = (json['trainNormalMoney'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (trainNormalMoney != null) {
    trainDefineEntity.trainNormalMoney = trainNormalMoney;
  }
  final List<int>? trainRecoverStats = (json['trainRecoverStats'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<int>(e) as int).toList();
  if (trainRecoverStats != null) {
    trainDefineEntity.trainRecoverStats = trainRecoverStats;
  }
  final List<int>? trainRewardBall = (json['trainRewardBall'] as List<dynamic>?)
      ?.map(
          (e) => jsonConvert.convert<int>(e) as int)
      .toList();
  if (trainRewardBall != null) {
    trainDefineEntity.trainRewardBall = trainRewardBall;
  }
  return trainDefineEntity;
}

Map<String, dynamic> $TrainDefineEntityToJson(TrainDefineEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['ballMaxNum'] = entity.ballMaxNum;
  data['ballRecoverNum'] = entity.ballRecoverNum;
  data['ballRecoverTime'] = entity.ballRecoverTime;
  data['coinChangeBall'] = entity.coinChangeBall;
  data['id'] = entity.id;
  data['lineOrder'] = entity.lineOrder;
  data['shootInWeight'] = entity.shootInWeight;
  data['taskCollect'] = entity.taskCollect;
  data['taskRefresh'] = entity.taskRefresh;
  data['taskTrigger'] = entity.taskTrigger;
  data['trainBuffAdd'] = entity.trainBuffAdd;
  data['trainLessMoney'] = entity.trainLessMoney;
  data['trainMoneyCon'] = entity.trainMoneyCon;
  data['trainNormalMoney'] = entity.trainNormalMoney;
  data['trainRecoverStats'] = entity.trainRecoverStats;
  data['trainRewardBall'] = entity.trainRewardBall;
  return data;
}

extension TrainDefineEntityExtension on TrainDefineEntity {
  TrainDefineEntity copyWith({
    int? ballMaxNum,
    int? ballRecoverNum,
    int? ballRecoverTime,
    int? coinChangeBall,
    int? id,
    List<int>? lineOrder,
    double? shootInWeight,
    List<int>? taskCollect,
    int? taskRefresh,
    int? taskTrigger,
    List<int>? trainBuffAdd,
    List<int>? trainLessMoney,
    List<int>? trainMoneyCon,
    List<int>? trainNormalMoney,
    List<int>? trainRecoverStats,
    List<int>? trainRewardBall,
  }) {
    return TrainDefineEntity()
      ..ballMaxNum = ballMaxNum ?? this.ballMaxNum
      ..ballRecoverNum = ballRecoverNum ?? this.ballRecoverNum
      ..ballRecoverTime = ballRecoverTime ?? this.ballRecoverTime
      ..coinChangeBall = coinChangeBall ?? this.coinChangeBall
      ..id = id ?? this.id
      ..lineOrder = lineOrder ?? this.lineOrder
      ..shootInWeight = shootInWeight ?? this.shootInWeight
      ..taskCollect = taskCollect ?? this.taskCollect
      ..taskRefresh = taskRefresh ?? this.taskRefresh
      ..taskTrigger = taskTrigger ?? this.taskTrigger
      ..trainBuffAdd = trainBuffAdd ?? this.trainBuffAdd
      ..trainLessMoney = trainLessMoney ?? this.trainLessMoney
      ..trainMoneyCon = trainMoneyCon ?? this.trainMoneyCon
      ..trainNormalMoney = trainNormalMoney ?? this.trainNormalMoney
      ..trainRecoverStats = trainRecoverStats ?? this.trainRecoverStats
      ..trainRewardBall = trainRewardBall ?? this.trainRewardBall;
  }
}