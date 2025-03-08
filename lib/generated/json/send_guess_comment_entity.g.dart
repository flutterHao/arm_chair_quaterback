import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/send_guess_comment_entity.dart';
import 'package:arm_chair_quaterback/common/entities/chat_reply_review_entity.dart';

import 'package:arm_chair_quaterback/common/utils/utils.dart';


ChatMessageEntity $ChatMessageEntityFromJson(Map<String, dynamic> json) {
  final ChatMessageEntity chatMessageEntity = ChatMessageEntity();
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    chatMessageEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    chatMessageEntity.teamName = teamName;
  }
  final String? atTeamId = jsonConvert.convert<String>(json['atTeamId']);
  if (atTeamId != null) {
    chatMessageEntity.atTeamId = atTeamId;
  }
  final bool? delete = jsonConvert.convert<bool>(json['delete']);
  if (delete != null) {
    chatMessageEntity.delete = delete;
  }
  final int? targetId = jsonConvert.convert<int>(json['targetId']);
  if (targetId != null) {
    chatMessageEntity.targetId = targetId;
  }
  final int? ct = jsonConvert.convert<int>(json['createTime']);
  if (ct != null) {
    chatMessageEntity.ct = ct;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    chatMessageEntity.teamId = teamId;
  }
  final String? context = jsonConvert.convert<String>(json['context']);
  if (context != null) {
    chatMessageEntity.context = context;
  }
  final int? ut = jsonConvert.convert<int>(json['updateTime']);
  if (ut != null) {
    chatMessageEntity.ut = ut;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    chatMessageEntity.id = id;
  }
  final List<AtTeamSimple>? atTeamSimple = (json['atTeamSimple'] as List<
      dynamic>?)?.map(
          (e) => jsonConvert.convert<AtTeamSimple>(e) as AtTeamSimple).toList();
  if (atTeamSimple != null) {
    chatMessageEntity.atTeamSimple = atTeamSimple;
  }
  final List<ChatReplyReviewEntity>? replyReview = (json['replyReview'] as List<
      dynamic>?)
      ?.map(
          (e) =>
      jsonConvert.convert<ChatReplyReviewEntity>(e) as ChatReplyReviewEntity)
      .toList();
  if (replyReview != null) {
    chatMessageEntity.replyReview = replyReview;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    chatMessageEntity.gameId = gameId;
  }
  final int? parentReviewId = jsonConvert.convert<int>(json['parentReviewId']);
  if (parentReviewId != null) {
    chatMessageEntity.parentReviewId = parentReviewId;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    chatMessageEntity.playerId = playerId;
  }
  return chatMessageEntity;
}

Map<String, dynamic> $ChatMessageEntityToJson(ChatMessageEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['atTeamId'] = entity.atTeamId;
  data['delete'] = entity.delete;
  data['targetId'] = entity.targetId;
  data['createTime'] = entity.ct;
  data['teamId'] = entity.teamId;
  data['context'] = entity.context;
  data['updateTime'] = entity.ut;
  data['id'] = entity.id;
  data['atTeamSimple'] = entity.atTeamSimple.map((v) => v.toJson()).toList();
  data['replyReview'] = entity.replyReview.map((v) => v.toJson()).toList();
  data['gameId'] = entity.gameId;
  data['parentReviewId'] = entity.parentReviewId;
  data['playerId'] = entity.playerId;
  return data;
}

extension ChatMessageEntityExtension on ChatMessageEntity {
  ChatMessageEntity copyWith({
    String? teamLogo,
    String? teamName,
    String? atTeamId,
    bool? delete,
    int? targetId,
    int? ct,
    int? teamId,
    String? context,
    int? ut,
    int? id,
    List<AtTeamSimple>? atTeamSimple,
    List<ChatReplyReviewEntity>? replyReview,
    int? gameId,
    int? parentReviewId,
    int? playerId,
  }) {
    return ChatMessageEntity()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..atTeamId = atTeamId ?? this.atTeamId
      ..delete = delete ?? this.delete
      ..targetId = targetId ?? this.targetId
      ..ct = ct ?? this.ct
      ..teamId = teamId ?? this.teamId
      ..context = context ?? this.context
      ..ut = ut ?? this.ut
      ..id = id ?? this.id
      ..atTeamSimple = atTeamSimple ?? this.atTeamSimple
      ..replyReview = replyReview ?? this.replyReview
      ..gameId = gameId ?? this.gameId
      ..parentReviewId = parentReviewId ?? this.parentReviewId
      ..playerId = playerId ?? this.playerId;
  }
}

AtTeamSimple $AtTeamSimpleFromJson(Map<String, dynamic> json) {
  final AtTeamSimple atTeamSimple = AtTeamSimple();
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    atTeamSimple.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    atTeamSimple.teamName = teamName;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    atTeamSimple.teamId = teamId;
  }
  return atTeamSimple;
}

Map<String, dynamic> $AtTeamSimpleToJson(AtTeamSimple entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['teamId'] = entity.teamId;
  return data;
}

extension AtTeamSimpleExtension on AtTeamSimple {
  AtTeamSimple copyWith({
    String? teamLogo,
    String? teamName,
    int? teamId,
  }) {
    return AtTeamSimple()
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..teamId = teamId ?? this.teamId;
  }
}