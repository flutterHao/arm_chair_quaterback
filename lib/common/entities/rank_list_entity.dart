import 'package:arm_chair_quaterback/common/entities/rank_info_entity.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/rank_list_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/rank_list_entity.g.dart';

@JsonSerializable()
class RankListEntity {
  List<RankInfoEntity> ranks = [];
  RankListMyRank myRank = RankListMyRank();

  RankListEntity();

  factory RankListEntity.fromJson(Map<String, dynamic> json) =>
      $RankListEntityFromJson(json);

  Map<String, dynamic> toJson() => $RankListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class RankListMyRank {
  int? guessCount;
  int? teamLogo;
  String? teamName;
  int? chip;
  int? createTime;
  double? success;
  int? teamId;
  int? rank;
  int? updateTime;
  int? cycle;
  int? win;

  RankListMyRank();

  factory RankListMyRank.fromJson(Map<String, dynamic> json) =>
      $RankListMyRankFromJson(json);

  Map<String, dynamic> toJson() => $RankListMyRankToJson(this);

  String get getSuccess =>
      success == null ? "0" : (100 * success!).toStringAsFixed(0);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
