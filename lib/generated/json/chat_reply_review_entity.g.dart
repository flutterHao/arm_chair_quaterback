import 'package:arm_chair_quaterback/generated/json/base/json_convert_content.dart';
import 'package:arm_chair_quaterback/common/entities/chat_reply_review_entity.dart';

ChatReplyReviewEntity $ChatReplyReviewEntityFromJson(
    Map<String, dynamic> json) {
  final ChatReplyReviewEntity chatReplyReviewEntity = ChatReplyReviewEntity();
  final ChatReplyReviewEmojis? emojis = jsonConvert.convert<
      ChatReplyReviewEmojis>(json['emojis']);
  if (emojis != null) {
    chatReplyReviewEntity.emojis = emojis;
  }
  final int? gameId = jsonConvert.convert<int>(json['gameId']);
  if (gameId != null) {
    chatReplyReviewEntity.gameId = gameId;
  }
  final int? parentReviewId = jsonConvert.convert<int>(json['parentReviewId']);
  if (parentReviewId != null) {
    chatReplyReviewEntity.parentReviewId = parentReviewId;
  }
  final String? teamLogo = jsonConvert.convert<String>(json['teamLogo']);
  if (teamLogo != null) {
    chatReplyReviewEntity.teamLogo = teamLogo;
  }
  final String? teamName = jsonConvert.convert<String>(json['teamName']);
  if (teamName != null) {
    chatReplyReviewEntity.teamName = teamName;
  }
  final int? targetId = jsonConvert.convert<int>(json['targetId']);
  if (targetId != null) {
    chatReplyReviewEntity.targetId = targetId;
  }
  final int? updateTime = jsonConvert.convert<int>(json['updateTime']);
  if (updateTime != null) {
    chatReplyReviewEntity.updateTime = updateTime;
  }
  final bool? delete = jsonConvert.convert<bool>(json['delete']);
  if (delete != null) {
    chatReplyReviewEntity.delete = delete;
  }
  final int? atTeamId = jsonConvert.convert<int>(json['atTeamId']);
  if (atTeamId != null) {
    chatReplyReviewEntity.atTeamId = atTeamId;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    chatReplyReviewEntity.createTime = createTime;
  }
  final int? teamId = jsonConvert.convert<int>(json['teamId']);
  if (teamId != null) {
    chatReplyReviewEntity.teamId = teamId;
  }
  final String? context = jsonConvert.convert<String>(json['context']);
  if (context != null) {
    chatReplyReviewEntity.context = context;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    chatReplyReviewEntity.id = id;
  }
  final List<dynamic>? myEmojis = (json['myEmojis'] as List<dynamic>?)?.map(
          (e) => e).toList();
  if (myEmojis != null) {
    chatReplyReviewEntity.myEmojis = myEmojis;
  }
  final int? playerId = jsonConvert.convert<int>(json['playerId']);
  if (playerId != null) {
    chatReplyReviewEntity.playerId = playerId;
  }
  return chatReplyReviewEntity;
}

Map<String, dynamic> $ChatReplyReviewEntityToJson(
    ChatReplyReviewEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['emojis'] = entity.emojis.toJson();
  data['gameId'] = entity.gameId;
  data['parentReviewId'] = entity.parentReviewId;
  data['teamLogo'] = entity.teamLogo;
  data['teamName'] = entity.teamName;
  data['targetId'] = entity.targetId;
  data['updateTime'] = entity.updateTime;
  data['delete'] = entity.delete;
  data['atTeamId'] = entity.atTeamId;
  data['createTime'] = entity.createTime;
  data['teamId'] = entity.teamId;
  data['context'] = entity.context;
  data['id'] = entity.id;
  data['myEmojis'] = entity.myEmojis;
  data['playerId'] = entity.playerId;
  return data;
}

extension ChatReplyReviewEntityExtension on ChatReplyReviewEntity {
  ChatReplyReviewEntity copyWith({
    ChatReplyReviewEmojis? emojis,
    int? gameId,
    int? parentReviewId,
    String? teamLogo,
    String? teamName,
    int? targetId,
    int? updateTime,
    bool? delete,
    int? atTeamId,
    int? createTime,
    int? teamId,
    String? context,
    int? id,
    List<dynamic>? myEmojis,
    int? playerId,
  }) {
    return ChatReplyReviewEntity()
      ..emojis = emojis ?? this.emojis
      ..gameId = gameId ?? this.gameId
      ..parentReviewId = parentReviewId ?? this.parentReviewId
      ..teamLogo = teamLogo ?? this.teamLogo
      ..teamName = teamName ?? this.teamName
      ..targetId = targetId ?? this.targetId
      ..updateTime = updateTime ?? this.updateTime
      ..delete = delete ?? this.delete
      ..atTeamId = atTeamId ?? this.atTeamId
      ..createTime = createTime ?? this.createTime
      ..teamId = teamId ?? this.teamId
      ..context = context ?? this.context
      ..id = id ?? this.id
      ..myEmojis = myEmojis ?? this.myEmojis
      ..playerId = playerId ?? this.playerId;
  }
}

ChatReplyReviewEmojis $ChatReplyReviewEmojisFromJson(
    Map<String, dynamic> json) {
  final ChatReplyReviewEmojis chatReplyReviewEmojis = ChatReplyReviewEmojis();
  return chatReplyReviewEmojis;
}

Map<String, dynamic> $ChatReplyReviewEmojisToJson(
    ChatReplyReviewEmojis entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  return data;
}

extension ChatReplyReviewEmojisExtension on ChatReplyReviewEmojis {
}