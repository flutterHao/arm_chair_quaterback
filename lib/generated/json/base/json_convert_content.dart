// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_base_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/reward_group_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_rank/team_rank_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_simple_entity.dart';
import 'package:arm_chair_quaterback/common/entities/trade_entity/trade_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_task_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(Object error, StackTrace stackTrace);
extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) =>
      _asT<T>(e, enumConvert: enumConvert)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        var covertFunc = convertFuncMap[type]!;
        if (covertFunc is Map<String, dynamic>) {
          return covertFunc(value as Map<String, dynamic>) as T;
        } else {
          return covertFunc(Map<String, dynamic>.from(value)) as T;
        }
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<PropDefineEntity>[] is M) {
      return data.map<PropDefineEntity>((Map<String, dynamic> e) =>
          PropDefineEntity.fromJson(e)).toList() as M;
    }
    if (<GuessInfosEntity>[] is M) {
      return data.map<GuessInfosEntity>((Map<String, dynamic> e) =>
          GuessInfosEntity.fromJson(e)).toList() as M;
    }
    if (<GuessInfosL5Avg>[] is M) {
      return data.map<GuessInfosL5Avg>((Map<String, dynamic> e) =>
          GuessInfosL5Avg.fromJson(e)).toList() as M;
    }
    if (<GuessInfosGuessData>[] is M) {
      return data.map<GuessInfosGuessData>((Map<String, dynamic> e) =>
          GuessInfosGuessData.fromJson(e)).toList() as M;
    }
    if (<GuessInfosGuessReferenceValue>[] is M) {
      return data.map<GuessInfosGuessReferenceValue>((Map<String, dynamic> e) =>
          GuessInfosGuessReferenceValue.fromJson(e)).toList() as M;
    }
    if (<GuessParamEntity>[] is M) {
      return data.map<GuessParamEntity>((Map<String, dynamic> e) =>
          GuessParamEntity.fromJson(e)).toList() as M;
    }
    if (<GuessParamGuessData>[] is M) {
      return data.map<GuessParamGuessData>((Map<String, dynamic> e) =>
          GuessParamGuessData.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoEntity>[] is M) {
      return data.map<NbaPlayerBaseInfoEntity>((Map<String, dynamic> e) =>
          NbaPlayerBaseInfoEntity.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoPlayerBaseInfo>[] is M) {
      return data.map<NbaPlayerBaseInfoPlayerBaseInfo>((
          Map<String, dynamic> e) =>
          NbaPlayerBaseInfoPlayerBaseInfo.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoPlayerRegularMap>[] is M) {
      return data.map<NbaPlayerBaseInfoPlayerRegularMap>((
          Map<String, dynamic> e) =>
          NbaPlayerBaseInfoPlayerRegularMap.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoPlayerPlayoffsMap>[] is M) {
      return data.map<NbaPlayerBaseInfoPlayerPlayoffsMap>((
          Map<String, dynamic> e) =>
          NbaPlayerBaseInfoPlayerPlayoffsMap.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoPlayerTrends>[] is M) {
      return data.map<NbaPlayerBaseInfoPlayerTrends>((Map<String, dynamic> e) =>
          NbaPlayerBaseInfoPlayerTrends.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerBaseInfoPlayerNews>[] is M) {
      return data.map<NbaPlayerBaseInfoPlayerNews>((Map<String, dynamic> e) =>
          NbaPlayerBaseInfoPlayerNews.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerInfosEntity>[] is M) {
      return data.map<NbaPlayerInfosEntity>((Map<String, dynamic> e) =>
          NbaPlayerInfosEntity.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerInfosPlayerDataAvgList>[] is M) {
      return data.map<NbaPlayerInfosPlayerDataAvgList>((
          Map<String, dynamic> e) =>
          NbaPlayerInfosPlayerDataAvgList.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerInfosPlayerDataCapList>[] is M) {
      return data.map<NbaPlayerInfosPlayerDataCapList>((
          Map<String, dynamic> e) =>
          NbaPlayerInfosPlayerDataCapList.fromJson(e)).toList() as M;
    }
    if (<NbaPlayerInfosPlayerBaseInfoList>[] is M) {
      return data.map<NbaPlayerInfosPlayerBaseInfoList>((
          Map<String, dynamic> e) =>
          NbaPlayerInfosPlayerBaseInfoList.fromJson(e)).toList() as M;
    }
    if (<NbaTeamEntity>[] is M) {
      return data.map<NbaTeamEntity>((Map<String, dynamic> e) =>
          NbaTeamEntity.fromJson(e)).toList() as M;
    }
    if (<NewsDefineEntity>[] is M) {
      return data.map<NewsDefineEntity>((Map<String, dynamic> e) =>
          NewsDefineEntity.fromJson(e)).toList() as M;
    }
    if (<PlayerDayDataEntity>[] is M) {
      return data.map<PlayerDayDataEntity>((Map<String, dynamic> e) =>
          PlayerDayDataEntity.fromJson(e)).toList() as M;
    }
    if (<RankAwardEntity>[] is M) {
      return data.map<RankAwardEntity>((Map<String, dynamic> e) =>
          RankAwardEntity.fromJson(e)).toList() as M;
    }
    if (<RankInfoEntity>[] is M) {
      return data.map<RankInfoEntity>((Map<String, dynamic> e) =>
          RankInfoEntity.fromJson(e)).toList() as M;
    }
    if (<RankListEntity>[] is M) {
      return data.map<RankListEntity>((Map<String, dynamic> e) =>
          RankListEntity.fromJson(e)).toList() as M;
    }
    if (<RankListMyRank>[] is M) {
      return data.map<RankListMyRank>((Map<String, dynamic> e) =>
          RankListMyRank.fromJson(e)).toList() as M;
    }
    if (<ReceivePropEntity>[] is M) {
      return data.map<ReceivePropEntity>((Map<String, dynamic> e) =>
          ReceivePropEntity.fromJson(e)).toList() as M;
    }
    if (<ReciveAwardEntity>[] is M) {
      return data.map<ReciveAwardEntity>((Map<String, dynamic> e) =>
          ReciveAwardEntity.fromJson(e)).toList() as M;
    }
    if (<ReciveAwardL5Avg>[] is M) {
      return data.map<ReciveAwardL5Avg>((Map<String, dynamic> e) =>
          ReciveAwardL5Avg.fromJson(e)).toList() as M;
    }
    if (<ReciveAwardGuessData>[] is M) {
      return data.map<ReciveAwardGuessData>((Map<String, dynamic> e) =>
          ReciveAwardGuessData.fromJson(e)).toList() as M;
    }
    if (<ReciveAwardGuessDataAwards>[] is M) {
      return data.map<ReciveAwardGuessDataAwards>((Map<String, dynamic> e) =>
          ReciveAwardGuessDataAwards.fromJson(e)).toList() as M;
    }
    if (<RewardGroupEntity>[] is M) {
      return data.map<RewardGroupEntity>((Map<String, dynamic> e) =>
          RewardGroupEntity.fromJson(e)).toList() as M;
    }
    if (<TeamPlayerInfoEntity>[] is M) {
      return data.map<TeamPlayerInfoEntity>((Map<String, dynamic> e) =>
          TeamPlayerInfoEntity.fromJson(e)).toList() as M;
    }
    if (<TeamPlayerInfoPotential>[] is M) {
      return data.map<TeamPlayerInfoPotential>((Map<String, dynamic> e) =>
          TeamPlayerInfoPotential.fromJson(e)).toList() as M;
    }
    if (<TeamRankEntity>[] is M) {
      return data.map<TeamRankEntity>((Map<String, dynamic> e) =>
          TeamRankEntity.fromJson(e)).toList() as M;
    }
    if (<TeamSimpleEntity>[] is M) {
      return data.map<TeamSimpleEntity>((Map<String, dynamic> e) =>
          TeamSimpleEntity.fromJson(e)).toList() as M;
    }
    if (<TradeInfoEntity>[] is M) {
      return data.map<TradeInfoEntity>((Map<String, dynamic> e) =>
          TradeInfoEntity.fromJson(e)).toList() as M;
    }
    if (<TradeInfoPlayerTrends>[] is M) {
      return data.map<TradeInfoPlayerTrends>((Map<String, dynamic> e) =>
          TradeInfoPlayerTrends.fromJson(e)).toList() as M;
    }
    if (<TradeInfoTotalSalary>[] is M) {
      return data.map<TradeInfoTotalSalary>((Map<String, dynamic> e) =>
          TradeInfoTotalSalary.fromJson(e)).toList() as M;
    }
    if (<TradeInfoTradePlayers>[] is M) {
      return data.map<TradeInfoTradePlayers>((Map<String, dynamic> e) =>
          TradeInfoTradePlayers.fromJson(e)).toList() as M;
    }
    if (<TradeInfoTradeLogs>[] is M) {
      return data.map<TradeInfoTradeLogs>((Map<String, dynamic> e) =>
          TradeInfoTradeLogs.fromJson(e)).toList() as M;
    }
    if (<TrainTaskEntity>[] is M) {
      return data.map<TrainTaskEntity>((Map<String, dynamic> e) =>
          TrainTaskEntity.fromJson(e)).toList() as M;
    }
    if (<TrainingInfoEntity>[] is M) {
      return data.map<TrainingInfoEntity>((Map<String, dynamic> e) =>
          TrainingInfoEntity.fromJson(e)).toList() as M;
    }
    if (<TrainingInfoAward>[] is M) {
      return data.map<TrainingInfoAward>((Map<String, dynamic> e) =>
          TrainingInfoAward.fromJson(e)).toList() as M;
    }
    if (<TrainingInfoProp>[] is M) {
      return data.map<TrainingInfoProp>((Map<String, dynamic> e) =>
          TrainingInfoProp.fromJson(e)).toList() as M;
    }
    if (<TrainingInfoTraining>[] is M) {
      return data.map<TrainingInfoTraining>((Map<String, dynamic> e) =>
          TrainingInfoTraining.fromJson(e)).toList() as M;
    }
    if (<TrainingInfoBuff>[] is M) {
      return data.map<TrainingInfoBuff>((Map<String, dynamic> e) =>
          TrainingInfoBuff.fromJson(e)).toList() as M;
    }
    if (<TrainingTaskEntity>[] is M) {
      return data.map<TrainingTaskEntity>((Map<String, dynamic> e) =>
          TrainingTaskEntity.fromJson(e)).toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (PropDefineEntity).toString(): PropDefineEntity.fromJson,
    (GuessInfosEntity).toString(): GuessInfosEntity.fromJson,
    (GuessInfosL5Avg).toString(): GuessInfosL5Avg.fromJson,
    (GuessInfosGuessData).toString(): GuessInfosGuessData.fromJson,
    (GuessInfosGuessReferenceValue).toString(): GuessInfosGuessReferenceValue
        .fromJson,
    (GuessParamEntity).toString(): GuessParamEntity.fromJson,
    (GuessParamGuessData).toString(): GuessParamGuessData.fromJson,
    (NbaPlayerBaseInfoEntity).toString(): NbaPlayerBaseInfoEntity.fromJson,
    (NbaPlayerBaseInfoPlayerBaseInfo)
        .toString(): NbaPlayerBaseInfoPlayerBaseInfo.fromJson,
    (NbaPlayerBaseInfoPlayerRegularMap)
        .toString(): NbaPlayerBaseInfoPlayerRegularMap.fromJson,
    (NbaPlayerBaseInfoPlayerPlayoffsMap)
        .toString(): NbaPlayerBaseInfoPlayerPlayoffsMap.fromJson,
    (NbaPlayerBaseInfoPlayerTrends).toString(): NbaPlayerBaseInfoPlayerTrends
        .fromJson,
    (NbaPlayerBaseInfoPlayerNews).toString(): NbaPlayerBaseInfoPlayerNews
        .fromJson,
    (NbaPlayerInfosEntity).toString(): NbaPlayerInfosEntity.fromJson,
    (NbaPlayerInfosPlayerDataAvgList)
        .toString(): NbaPlayerInfosPlayerDataAvgList.fromJson,
    (NbaPlayerInfosPlayerDataCapList)
        .toString(): NbaPlayerInfosPlayerDataCapList.fromJson,
    (NbaPlayerInfosPlayerBaseInfoList)
        .toString(): NbaPlayerInfosPlayerBaseInfoList.fromJson,
    (NbaTeamEntity).toString(): NbaTeamEntity.fromJson,
    (NewsDefineEntity).toString(): NewsDefineEntity.fromJson,
    (PlayerDayDataEntity).toString(): PlayerDayDataEntity.fromJson,
    (RankAwardEntity).toString(): RankAwardEntity.fromJson,
    (RankInfoEntity).toString(): RankInfoEntity.fromJson,
    (RankListEntity).toString(): RankListEntity.fromJson,
    (RankListMyRank).toString(): RankListMyRank.fromJson,
    (ReceivePropEntity).toString(): ReceivePropEntity.fromJson,
    (ReciveAwardEntity).toString(): ReciveAwardEntity.fromJson,
    (ReciveAwardL5Avg).toString(): ReciveAwardL5Avg.fromJson,
    (ReciveAwardGuessData).toString(): ReciveAwardGuessData.fromJson,
    (ReciveAwardGuessDataAwards).toString(): ReciveAwardGuessDataAwards
        .fromJson,
    (RewardGroupEntity).toString(): RewardGroupEntity.fromJson,
    (TeamPlayerInfoEntity).toString(): TeamPlayerInfoEntity.fromJson,
    (TeamPlayerInfoPotential).toString(): TeamPlayerInfoPotential.fromJson,
    (TeamRankEntity).toString(): TeamRankEntity.fromJson,
    (TeamSimpleEntity).toString(): TeamSimpleEntity.fromJson,
    (TradeInfoEntity).toString(): TradeInfoEntity.fromJson,
    (TradeInfoPlayerTrends).toString(): TradeInfoPlayerTrends.fromJson,
    (TradeInfoTotalSalary).toString(): TradeInfoTotalSalary.fromJson,
    (TradeInfoTradePlayers).toString(): TradeInfoTradePlayers.fromJson,
    (TradeInfoTradeLogs).toString(): TradeInfoTradeLogs.fromJson,
    (TrainTaskEntity).toString(): TrainTaskEntity.fromJson,
    (TrainingInfoEntity).toString(): TrainingInfoEntity.fromJson,
    (TrainingInfoAward).toString(): TrainingInfoAward.fromJson,
    (TrainingInfoProp).toString(): TrainingInfoProp.fromJson,
    (TrainingInfoTraining).toString(): TrainingInfoTraining.fromJson,
    (TrainingInfoBuff).toString(): TrainingInfoBuff.fromJson,
    (TrainingTaskEntity).toString(): TrainingTaskEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}