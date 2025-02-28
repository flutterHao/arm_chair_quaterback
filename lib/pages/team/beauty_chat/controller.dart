/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2025-02-26 15:48:56
 * @LastEditTime: 2025-02-28 15:18:23
 */
import 'package:arm_chair_quaterback/common/entities/girl_chat_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girl_dialogue_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/girls_define_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
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
    Get.to(
      ChatDetailPage(),
      opaque: false,
      transition: Transition.fadeIn,
    );
  }

  void getSlotChatEventVO() {
    TeamApi.getSlotChatEventVO().then((v) {
      girlChatEntity = v;
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

  void getChatList() {
    girlChatEntity.historicalChatRecords.clear();
    for (var element in CacheApi.girlChatList) {
      if (element.id >= girlChatEntity.currentMessageId) {
        if (element.choices.isEmpty) {
          girlChatEntity.historicalChatRecords.add(element);
        } else {
          //玩家选择
          girlChatEntity.currentMessageId = element.id;
          girlChatEntity.historicalChatRecords.add(element);
          return;
        }
      }
    }
  }

  List<String> getChooseList(String text) {
    // 使用正则表达式匹配双引号内的内容
    RegExp regExp = RegExp(r'"([^"]*)"');
    Iterable<Match> matches = regExp.allMatches(text);

    List<String> segments = matches.map((match) => match.group(1)!).toList();
    return segments;
  }

  void nextMessage(int choice, String message) {
    int girlId = girlChatEntity.girl.girlId;
    int nessageDefineId = girlChatEntity.currentMessageId;
    TeamApi.nextMessage(girlId, nessageDefineId, choice).then((v) {
      // getSlotChatEventVO();
      girlChatEntity.currentMessageId++;
      girlChatEntity.historicalChatRecords.add(
        GirlDialogueDefineEntity()..dialogue = message,
      );
      update(["beauty_chat"]);
    });
  }
}
