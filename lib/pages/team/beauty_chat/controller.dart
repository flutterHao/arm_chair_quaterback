/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 15:48:56
 * @LastEditTime: 2025-02-28 19:50:28
 */
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girls_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/data_utils.dart';
import 'package:arm_chair_quaterback/pages/team/beauty_chat/widgets/chat_detail_page.dart';
import 'package:get/get.dart';

class BeautyChatController extends GetxController {
  BeautyChatController();
  GirlChatEntity girlChatEntity = GirlChatEntity();

  _initData() {
    Future.wait([
      CacheApi.getGirlsDefine(),
      CacheApi.getGirlsChat(),
      TeamApi.getSlotChatEventVO(),
    ]).then((v) {
      girlChatEntity = v[2] as GirlChatEntity;
      getChatList();
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
    _initData();
  }

  void toChat() {
    Get.off(
      ChatDetailPage(),
      opaque: false,
      transition: Transition.fadeIn,
    );
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

  void getChatList() async {
    int story = 1;
    if (girlChatEntity.historicalChatRecords.isNotEmpty) {
      story = girlChatEntity.historicalChatRecords.last.storyLineId;
    }
    for (var element in CacheApi.girlChatList) {
      if (element.id >= girlChatEntity.currentMessageId &&
          story == element.storyLineId) {
        await nextMessage(-1, element.id);
        if (element.choices.isNotEmpty) {
          return;
        }
      }
    }
  }

  Future nextMessage(int choice, int messageId) async {
    int girlId = girlChatEntity.girl.girlId;
    await TeamApi.nextMessage(girlId, messageId, choice).then((v) async {
      await getSlotChatEventVO();

      ///选择后重写获得新的妹子聊天
      if (choice != -1) {
        getChatList();
      }
      // girlChatEntity.currentMessageId++;
      // girlChatEntity.historicalChatRecords.add(
      //   GirlDialogueDefineEntity()..dialogue = message,
      // );
    });
  }
}
