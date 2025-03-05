/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 15:48:56
 * @LastEditTime: 2025-03-04 11:33:03
 */

import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girls_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/next_massage_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/store/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeautyChatController extends GetxController {
  BeautyChatController();
  GirlChatEntity girlChatEntity = GirlChatEntity();
  ScrollController scrollController = ScrollController();

  initData() {
    Future.wait([
      CacheApi.getGirlsDefine(),
      CacheApi.getGirlsChat(),
      getSlotChatEventVO()
    ]).then((v) {
      getStoreChat(isLoading: true);
      update(["beauty_chat"]);
    });
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void toChat() {
    // Get.to(
    //   ChatDetailPage(),
    //   opaque: false,
    //   transition: Transition.fadeIn,
    // );
    Get.toNamed(RouteNames.beautyChatDtl);
    getSlotChatEventVO();
  }

  Future getSlotChatEventVO() async {
    await TeamApi.getSlotChatEventVO().then((v) {
      girlChatEntity = v;
      GirlDialogueDefineEntity? item = CacheApi.girlChatList.firstWhereOrNull(
          (element) => element.id == girlChatEntity.currentMessageId);
      if (item != null) {
        if (item.choices.isNotEmpty) {
          girlChatEntity.historicalChatRecords.last.choices = item.choices;
        }
      }

      update(["beauty_chat"]);
      if (scrollController.hasClients) {
        final offset = scrollController.position.maxScrollExtent;
        scrollController.jumpTo(offset);
      }
    });
  }

  GirlsDefineEntity getCurrentGirl() {
    for (var element in CacheApi.girlsDefineList) {
      if (element.id == girlChatEntity.girl.girlId) {
        return element;
      }
    }
    return GirlsDefineEntity();
  }

  void getStoreChat({bool isLoading = false}) async {
    int story = 1;
    if (girlChatEntity.historicalChatRecords.isNotEmpty) {
      story = girlChatEntity.historicalChatRecords.last.myStoryId;
    } else {
      story = CacheApi.girlChatList
              .firstWhereOrNull(
                  (element) => element.id == girlChatEntity.currentMessageId)
              ?.id ??
          1;
    }
    for (var element in CacheApi.girlChatList) {
      //读取配置，获取妹子的话，传给后端保存
      if (element.id >= girlChatEntity.currentMessageId) {
        if (story == element.storyLineId) {
          await nextMessage(-1, element.id, isLoading);
          if (element.choices.isNotEmpty) {
            return;
          }
        }
      }
    }
  }

  Future nextMessage(int choice, int messageId, bool isLoading) async {
    int girlId = girlChatEntity.girl.girlId;
    await TeamApi.nextMessage(girlId, messageId, choice)
        .then((NextMessageEntity v) async {
      if (!isLoading) await Future.delayed(Duration(milliseconds: 1500));
      _addMessage(v.messageDefineId, choice);
      // if(v.type==3)
      // await getSlotChatEventVO();

      ///选择后重写获得新的妹子聊天
      if (choice != -1) {
        getStoreChat();
      }
    });
  }

  void _addMessage(int messageId, int choice) {
    girlChatEntity.currentMessageId = messageId;

    var item = CacheApi.girlDefineMap[messageId] ?? GirlDialogueDefineEntity();
    item.type = choice < 0 ? 1 : 2;
    item.updateTime = DateTime.now().toLocal().microsecondsSinceEpoch;
    item.context = item.dialogue;
    girlChatEntity.historicalChatRecords.add(item);
    update(["beauty_chat"]);
    scrollToBottom();
  }

  void scrollToBottom() {
    final offset = scrollController.position.maxScrollExtent;
    scrollController.animateTo(offset,
        duration: 100.milliseconds, curve: Curves.linear);
  }

  String girlGrade(int grade) {
    switch (grade) {
      case 1:
        return 'B';
      case 2:
        return 'A';
      case 3:
        return 'S';
      case 4:
        return 'SRR';
      default:
        return 'B';
    }
  }

  String getGirlImage(String img) {
    String url = ConfigStore.to.getServiceUrl();
    String image = "$url/$img";
    return image;
  }

  int getTextType(int id) {
    return CacheApi.girlDefineMap[id]?.textType ?? 1;
  }

  // List<String> geAwards(int id) {
  //   return CacheApi.girlDefineMap[id]?.awards??[];
  // }
}
