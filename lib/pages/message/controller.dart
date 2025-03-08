import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/scores_entity.dart';
import 'package:arm_chair_quaterback/common/entities/send_guess_comment_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/inbox.dart';
import 'package:arm_chair_quaterback/common/net/apis/league.dart';
import 'package:arm_chair_quaterback/common/utils/error_utils.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/pages/message/widgets/RichTextController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageController extends GetxController {
  MessageController({required this.type, this.playerId, this.gameId});

  ///type 1 赛程和球员 2 赛季ovr排行榜
  final int type;
  final int? playerId;
  final int? gameId;

  RefreshController refreshController = RefreshController();
  RichTextController textEditingController =
      RichTextController(patternMatchMap: {
    RegExp("@*x*asdfasldfjlasjfsafekkkgakfeaja"): TextStyle(color: Colors.blue)
  });
  final FocusNode focusNode = FocusNode();
  ScrollController scrollController = ScrollController();

  RxList<ChatMessageEntity> list = RxList<ChatMessageEntity>();
  int page = 0;
  int limit = 20;

  ScoresEntity? scoresEntity;
  StreamSubscription? subscription;

  ChatMessageEntity? atChatMessage;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      print(
          'scrollController:${scrollController.position.pixels},${scrollController.position.maxScrollExtent}');
      if (scrollController.position.maxScrollExtent - 120 <
          scrollController.position.pixels) {
        loadMoreData();
      }
    });

    listenMessage();
    initData();
  }

  void listenMessage() {
    if (type == 1) {
      subscription = WSInstance.enterRoom(playerId: playerId, gameId: gameId)
          .listen((value) {
        if (value.serviceId == Api.wsGuessChatRoomUpdated) {
          ChatMessageEntity chatMessageEntity =
              ChatMessageEntity.fromJson(value.payload);
          addChatMessage(chatMessageEntity);
        }
      });
    } else {
      subscription = WSInstance.enterOVRRoom().listen((value) {
        if (value.serviceId == Api.wsOVRChatRoomUpdated) {
          ChatMessageEntity chatMessageEntity =
              ChatMessageEntity.fromJson(value.payload);
          addChatMessage(chatMessageEntity);
        }
      });
    }
  }

  initData() {
    List<Future> futures = [];
    if (type == 1) {
      futures.add(getGuessComment());
      if (playerId != null) {
        futures.addAll([
          CacheApi.getNBAPlayerInfo(),
        ]);
      } else {
        futures.addAll([
          CacheApi.getNBATeamDefine(),
          getNBAGameHeaderData(),
        ]);
      }
    } else {
      futures.addAll([
        getOVRRankChatMessages(),
      ]);
    }
    Future.wait(futures).then((v) {
      // print('scoresEntity:$scoresEntity');
      update();
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  Future<ScoresEntity> getNBAGameHeaderData() {
    Completer<ScoresEntity> completer = Completer();
    LeagueApi.getNBAGameHeaderData(gameId!).then((result) {
      scoresEntity = result;
      completer.complete(result);
    }, onError: (e) {
      ErrorUtils.toast(e);
      completer.completeError(e);
    });
    return completer.future;
  }

  Future<List<ChatMessageEntity>> getGuessComment() {
    Completer<List<ChatMessageEntity>> completer = Completer();
    InboxApi.getGuessComment(
            playerId: playerId, gameId: gameId, page: page, limit: limit)
        .then((result) {
      if (result.isEmpty) {
        refreshController.loadNoData();
      } else {
        list.addAll(result);
        refreshController.loadComplete();
        page++;
      }
      completer.complete(result);
    }, onError: (e) {
      ErrorUtils.toast(e);
      refreshController.loadFailed();
      completer.completeError(e);
    });
    return completer.future;
  }

  Future<List<ChatMessageEntity>> getOVRRankChatMessages() {
    Completer<List<ChatMessageEntity>> completer = Completer();
    InboxApi.getOVRRankChatMessages(page: page, limit: limit).then((result) {
      if (result.isEmpty) {
        refreshController.loadNoData();
      } else {
        list.addAll(result);
        refreshController.loadComplete();
        page++;
      }
      completer.complete(result);
    }, onError: (e) {
      ErrorUtils.toast(e);
      refreshController.loadFailed();
      completer.completeError(e);
    });
    return completer.future;
  }

  loadMoreData() {
    print('loadMoreData------');
    if (refreshController.footerStatus == LoadStatus.noMore) {
      return;
    }
    if (type == 1) {
      getGuessComment();
    } else {
      getOVRRankChatMessages();
    }
  }

  send(String str) {
    focusNode.requestFocus();
    if (!Utils.canOperate()) return;
    if (str.isEmpty) {
      return;
    }
    textEditingController.clear();
    // list.insertAll(0, [str]);
    String temp = str;
    if (atChatMessage != null) {
      temp = temp.replaceFirst("@${atChatMessage!.teamName}", "");
    }
    if (type == 1) {
      sendGuessComment(temp);
    } else {
      sendOVRRankMessage(temp);
    }
  }

  sendGuessComment(String context, {int? targetId}) {
    InboxApi.sendGuessComment(
            context: context,
            gameId: gameId,
            playerId: playerId,
            targetId: targetId)
        .then((result) {
      // addChatMessage(result);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  sendOVRRankMessage(String context, {int? atTeamId, int? targetId}) {
    InboxApi.sendOVRRankMessage(
            context: context, atTeamId: atTeamId, targetId: targetId)
        .then((result) {
      // addChatMessage(result);
    }, onError: (e) {
      ErrorUtils.toast(e);
    });
  }

  addChatMessage(ChatMessageEntity chatMessage) {
    list.insert(0, chatMessage);
  }

  String getTitle() {
    if (type == 1) {
      if (playerId != null) {
        return Utils.getPlayBaseInfo(playerId!).elname;
      }
      if (gameId != null && scoresEntity != null) {
        return "${Utils.getTeamInfo(scoresEntity!.homeTeamId ?? 0).shortEname}  VS  ${Utils.getTeamInfo(scoresEntity!.awayTeamId ?? 0).shortEname}";
      }
      return "MESSAGE";
    } else {
      return "OVR RANK";
    }
  }

  avatarLongPress(ChatMessageEntity chatMessage) {
    if(Utils.isMe(chatMessage.teamId)) return;
    atChatMessage = chatMessage;
    String tempText = "@${chatMessage.teamName}";
    textEditingController.patternMatchMap = {
      RegExp(tempText): TextStyle(color: Colors.blue)
    };
    textEditingController.text = "${textEditingController.text}$tempText";
    textEditingController.selection = TextSelection(baseOffset: tempText.length, extentOffset: tempText.length);
  }

  @override
  void onClose() {
    if (type == 1) {
      WSInstance.exitRoom(playerId: playerId, gameId: gameId);
    }
    subscription?.cancel();
    refreshController.dispose();
    textEditingController.dispose();
    focusNode.dispose();
    scrollController.dispose();
    super.onClose();
  }

}
