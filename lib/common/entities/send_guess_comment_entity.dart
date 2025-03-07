import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:arm_chair_quaterback/generated/json/send_guess_comment_entity.g.dart';

@JsonSerializable()
class ChatMessageEntity {
  String teamLogo = '';
  String teamName = '';
  int atTeamId = 0;
  bool delete = false;
  int targetId = 0;
  @JSONField(name: "createTime")
  int ct = 0;
  int teamId = 0;
  String context = '';
  @JSONField(name: "updateTime")
  int ut = 0;
  int id = 0;

  int gameId = 0;
  int parentReviewId = 0;
  int playerId = 0;

  ChatMessageEntity();

  int get createTime => Utils.getTimeZoneOffset().inMilliseconds + ct;

  int get updateTime => Utils.getTimeZoneOffset().inMilliseconds + ut;

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) =>
      $ChatMessageEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChatMessageEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
