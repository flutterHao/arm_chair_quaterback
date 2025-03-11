import 'package:arm_chair_quaterback/common/entities/chat_reply_review_entity.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:arm_chair_quaterback/generated/json/send_guess_comment_entity.g.dart';

@JsonSerializable()
class ChatMessageEntity {
  String teamLogo = '';
  String teamName = '';
  /// 多个id用逗号隔开
  String atTeamId = '';
  bool delete = false;
  int targetId = 0;
  @JSONField(name: "createTime")
  int ct = 0;
  int teamId = 0;
  String context = '';
  @JSONField(name: "updateTime")
  int ut = 0;
  int id = 0;
  List<AtTeamSimple> atTeamSimple = [];
  ChatReplyReviewEntity? replyMessage;

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

@JsonSerializable()
class AtTeamSimple{
  String teamLogo = '';
  String teamName = '';
  int teamId = 0;

  AtTeamSimple();

  factory AtTeamSimple.fromJson(Map<String, dynamic> json) =>
      $AtTeamSimpleFromJson(json);

  Map<String, dynamic> toJson() => $AtTeamSimpleToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

