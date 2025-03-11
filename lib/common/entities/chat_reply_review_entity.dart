import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'package:arm_chair_quaterback/generated/json/chat_reply_review_entity.g.dart';
import 'dart:convert';
export 'package:arm_chair_quaterback/generated/json/chat_reply_review_entity.g.dart';

@JsonSerializable()
class ChatReplyReviewEntity {
  late List<dynamic> atTeamSimple = [];
  late ChatReplyReviewEmojis emojis;
  late int gameId = 0;
  late int parentReviewId = 0;
  late String teamLogo = '';
  late String teamName = '';
  late int targetId = 0;
  @JSONField(name: "updateTime")
  int ut = 0;
  late bool delete = false;
  late int atTeamId = 0;
  @JSONField(name: "createTime")
  int ct = 0;
  late int teamId = 0;
  late String context = '';
  late int id = 0;
  late List<dynamic> myEmojis = [];
  late int playerId = 0;

  ChatReplyReviewEntity();

  int get createTime => Utils.getTimeZoneOffset().inMilliseconds + ct;

  int get updateTime => Utils.getTimeZoneOffset().inMilliseconds + ut;

  factory ChatReplyReviewEntity.fromJson(Map<String, dynamic> json) =>
      $ChatReplyReviewEntityFromJson(json);

  Map<String, dynamic> toJson() => $ChatReplyReviewEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ChatReplyReviewEmojis {
  ChatReplyReviewEmojis();

  factory ChatReplyReviewEmojis.fromJson(Map<String, dynamic> json) =>
      $ChatReplyReviewEmojisFromJson(json);

  Map<String, dynamic> toJson() => $ChatReplyReviewEmojisToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
