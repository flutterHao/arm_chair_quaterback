/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-10-15 20:19:57
 * @LastEditTime: 2024-12-19 19:49:57
 */
import 'dart:math';

import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';
import 'dart:convert';

import 'package:get/get.dart';
export 'package:arm_chair_quaterback/generated/json/team_player_info_entity.g.dart';

@JsonSerializable()
class TeamPlayerInfoEntity {
  late int buyPrice = 0;
  late int buyPlayerScore = 0;
  late int updateTime = 0;
  late String uuid = '';
  late int gradeExp = 0;
  late int fromType = 0;
  late int createTime = 0;
  late int playerGrade = 0;
  late int teamId = 0;
  late int id = 0;
  late int position = 0;
  late int power = 0;
  late int playerStatus = 1;
  late TeamPlayerInfoPotential potential;
  late bool bindStatus = false;
  late int breakThroughGrade = 0; //星级
  late int playerId = 0;
  TeamPlayerInfoPotential? upStarBase;
  @JSONField(deserialize: false, serialize: false)
  RxBool isChange = false.obs; //是否换人
  @JSONField(deserialize: false, serialize: false)
  int recoverCost = 0;
  // @JSONField(deserialize: false, serialize: false)
  // RxBool isSelect = false.obs;

  TeamPlayerInfoEntity();

  int getBreakThroughGrade() {
    if ((breakThroughGrade ?? 0) >= 1) {
      return breakThroughGrade!;
    }
    return 1;
  }

  int getNextBreakThroughGrade() {
    var i = getBreakThroughGrade() + 1;
    return i;
  }

  int getPreBreakThroughGrade() {
    var i = getBreakThroughGrade() - 1;
    return i;
  }

  factory TeamPlayerInfoEntity.fromJson(Map<String, dynamic> json) =>
      $TeamPlayerInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $TeamPlayerInfoEntityToJson(this);

  //�油
  bool isSubstitute() {
    return position == 0;
  }

  bool isBag() {
    return position == -1;
  }

  String getPosition() {
    switch (position) {
      case 1:
        return "C";
      case 2:
        return "PF";
      case 3:
        return "SF";
      case 4:
        return "SG";
      case 5:
        return "PG";
    }
    return "";
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class TeamPlayerInfoPotential {
  late int blk = 0;
  late int ast = 0;
  late int threePt = 0;
  late int stl = 0;
  late int pts = 0;
  late int reb = 0;

  TeamPlayerInfoPotential();

  int _getMaxValue() {
    var value = max(pts ?? 0, threePt ?? 0);
    value = max(value, ast ?? 0);
    value = max(value, reb ?? 0);
    value = max(value, blk ?? 0);
    value = max(value, stl ?? 0);
    return value;
  }

  int getMax() {
    var maxValue = _getMaxValue();
    int step = getStep();
    var value =
        maxValue % step == 0 ? maxValue + step : (maxValue ~/ step + 1) * step;
    return value;
  }

  double getMaxValue() {
    var value = max(pts, threePt);
    value = max(value, ast);
    value = max(value, reb);
    value = max(value, blk);
    value = max(value, stl);
    return value.toDouble();
  }

  int getStep() {
    var value = _getMaxValue();
    int step = value > 100
        ? 20
        : value > 500
            ? 100
            : 10;
    return step;
  }

  factory TeamPlayerInfoPotential.fromJson(Map<String, dynamic> json) =>
      $TeamPlayerInfoPotentialFromJson(json);

  Map<String, dynamic> toJson() => $TeamPlayerInfoPotentialToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
