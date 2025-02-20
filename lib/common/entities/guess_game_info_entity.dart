import 'package:arm_chair_quaterback/common/entities/guess_data.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/guess_game_info_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/guess_game_info_entity.g.dart';

@JsonSerializable()
class GuessGameInfoEntity {
  late int gameId;
  late double newsId;
  @JSONField(name: 'gameStartTime')
  late int gst;
  late int teamId;
  late List<GuessData> guessData;
  late Map<String,double> guessReferenceValue;
  late double id;
  late double type;
  late int awayTeamId;
  late int playerId;
  late int moreCount;
  late int lessCount;
  bool? success;

  GuessGameInfoEntity();

  int get gameStartTime =>
      gst + Utils.getTimeZoneOffset().inMilliseconds;

  factory GuessGameInfoEntity.fromJson(Map<String, dynamic> json) =>
      $GuessGameInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $GuessGameInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
