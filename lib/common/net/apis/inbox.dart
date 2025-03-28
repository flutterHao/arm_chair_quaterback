import 'package:arm_chair_quaterback/common/entities/chat_room_entity.dart';
import 'package:arm_chair_quaterback/common/entities/inbox_email_entity.dart';
import 'package:arm_chair_quaterback/common/entities/send_guess_comment_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';

class InboxApi {
  /// 查询邮件列表
  static Future<List<InboxEmailEntity>> getMailVOList() async {
    List json = await httpUtil.post(Api.getMailVOList);
    return json.map((e) => InboxEmailEntity.fromJson(e)).toList();
  }

  ///提取附件奖励
  static Future receiveMailAward(String mailIds) async {
    await httpUtil.post(Api.receiveMailAward, data: {"mailIds": mailIds});
  }

  ///阅读邮件
  static Future readMail(int mailId) async {
    await httpUtil.post(Api.readMail, data: {"mailId": mailId});
  }

  ///删除邮件
  static Future deleteMail(String mailIds) async {
    await httpUtil.post(Api.deleteMail, data: {"mailIds": mailIds});
  }

  ///获取竞猜聊天记录
  static Future<List<ChatMessageEntity>> getGuessComment({
    int? playerId,
    int? gameId = 0,
    int page = 0,
    int limit = 10,
  }) async {
    List list = await httpUtil.post(Api.getGuessComment, data: {
      "playerId": playerId ?? 0,
      "gameId": gameId ?? 0,
      "page": page,
      "limit": limit,
    });
    return list.map((e) => ChatMessageEntity.fromJson(e)).toList();
  }

  ///发送竞猜聊天消息
  static Future<ChatMessageEntity> sendGuessComment({
    required String context,
    int? playerId,
    int? gameId,
    int? parentReviewId,

    ///at的人的id
    String? atTeamId,

    ///targetId是回复了哪句话
    int? targetId,
  }) async {
    var json = await httpUtil.post(Api.sendGuessComment, data: {
      "context": context,
      "playerId": playerId ?? 0,
      "gameId": gameId ?? 0,
      "parentReviewId": parentReviewId ?? targetId ?? 0,
      "atTeamId": atTeamId ?? '',
      "targetId": targetId ?? 0,
    });

    return ChatMessageEntity.fromJson(json);
  }

  ///获取ovr排行榜聊天记录
  static Future<List<ChatMessageEntity>> getOVRRankChatMessages({
    int page = 0,
    int limit = 10,
  }) async {
    List list = await httpUtil.post(Api.getOVRRankChatMessages, data: {
      "page": page,
      "limit": limit,
    });
    return list.map((e) => ChatMessageEntity.fromJson(e)).toList();
  }

  ///发送ovr排行榜消息
  static Future<ChatMessageEntity> sendOVRRankMessage({
    required String context,
    int? parentReviewId,

    ///at的人的id
    String? atTeamId,

    ///回复的评论的评论id
    int? targetId,
  }) async {
    var json = await httpUtil.post(Api.sendOVRRankMessage, data: {
      "context": context,
      "parentReviewId": parentReviewId ?? targetId ?? 0,
      "atTeamId": atTeamId ?? '',
      "targetId": targetId ?? 0,
    });

    return ChatMessageEntity.fromJson(json);
  }

  ///获取聊天列表
  static Future<List<ChatRoomEntity>> getChatRoomList({
    int page = 0,
    int limit = 10,
  }) async {
    List list = await httpUtil.post(Api.getChatRoomList, data: {
      "page": page,
      "limit": limit,
    });
    return list.map((e) => ChatRoomEntity.fromJson(e)).toList();
  }

  ///聊天置顶
  static Future setPinned({
    required int chatId,
    required bool isPinned,
  }) async {
    await httpUtil.post(Api.setPinned, data: {
      "chatId": chatId,
      "isPinned": isPinned,
    });
  }

  /// 退出群聊
  static Future delChatRoom({
    required int chatId,
  }) async {
    await httpUtil.post(Api.delChatRoom, data: {
      "chatId": chatId,
    });
  }
}
