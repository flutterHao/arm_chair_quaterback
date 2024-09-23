// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:arm_chair_quaterback/common/entities/config/prop_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/guess_param_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_player_infos_entity.dart';
import 'package:arm_chair_quaterback/common/entities/nba_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/news_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_day_data_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/rank_list_entity.dart';
import 'package:arm_chair_quaterback/common/entities/recive_award_entity.dart';
import 'package:arm_chair_quaterback/common/entities/receive_prop_entity.dart';

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
      return data.map<RankListMyRank>((Map<String, dynamic> e) =>
          RankListMyRank.fromJson(e)).toList() as M;
    }
    if (<ReceivePropEntity>[] is M) {
      return data.map<ReceivePropEntity>((Map<String, dynamic> e) =>
          ReceivePropEntity.fromJson(e)).toList() as M;
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
    (ReciveAwardEntity).toString(): ReciveAwardEntity.fromJson,
    (ReciveAwardL5Avg).toString(): ReciveAwardL5Avg.fromJson,
    (ReciveAwardGuessData).toString(): ReciveAwardGuessData.fromJson,
    (ReciveAwardGuessDataAwards).toString(): ReciveAwardGuessDataAwards
        .fromJson,
    (ReceivePropEntity).toString(): ReceivePropEntity.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}