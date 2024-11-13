/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-11-13 15:10:51
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/net/http.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/box_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_avater.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  TeamIndexController();

  ///宝箱
  var box1Claimed = false.obs;
  var box2Claimed = false.obs;
  var box1Timer = 0.obs;
  var box2Timer = 0.obs;
  var isCountdownActive = false.obs; // 倒计时是否激活
  Timer? freeBoxTimer;
  Timer? battleBoxTimer;

  List<TrainingInfoAward> awardList = [];
  CardPackInfoEntity cardPackInfo = CardPackInfoEntity();

  // @override
  // void onInit() {
  //   super.onInit();
  //   CacheApi.getNBATeamDefine();
  //   CacheApi.getNBAPlayerInfo();
  // }

  @override
  void onReady() {
    super.onReady();
    getBattleBox();
  }

  ///获取战斗宝箱信息
  void getBattleBox() async {
    cardPackInfo = await TeamApi.getBattleBox();
    handlerBatterBoxData();
  }

  ///激活宝箱
  void activeBattleBox(int index) async {
    cardPackInfo = await TeamApi.activeBox(index);
    handlerBatterBoxData();
  }

  ///开启战斗宝箱
  void openBattleBox(int index) async {
    awardList = await TeamApi.opneBattleBox(index);
    showBoxDialog();
  }

  ///快速开启
  void speedOpneBattleBox(int index) async {
    awardList = await TeamApi.speedOpneBattleBox(index);
    showBoxDialog();
  }

  ///开启免费宝箱
  void openFreeGift() async {
    awardList = await TeamApi.openFreeGift();
    showBoxDialog();
  }

  ///宝箱奖励弹窗
  void showBoxDialog() async {
    update(["boxDialog"]);
    await showDialog(
        context: Get.context!,
        builder: (context) {
          return const BoxDialog();
        });
    getBattleBox();
  }

  void handlerBatterBoxData() {
    ///免费宝箱
    if (cardPackInfo.freeGiftCount == 2) {
      freeBoxTimer?.cancel();
      freeBoxTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        DateTime now = DateTime.now();
        DateTime endTime = DateUtil.getDateTimeByMs(cardPackInfo.freeGiftTime);
        int diff = endTime.difference(now).inSeconds;
        if (diff <= 0) {
          battleBoxTimer?.cancel();
          getBattleBox();
        } else {
          final hours = (diff ~/ 3600).toString().padLeft(2, '0');
          final minutes = ((diff % 3600) ~/ 60).toString().padLeft(2, '0');
          final secs = (diff % 60).toString().padLeft(2, '0');
          cardPackInfo.freeTimeString.value = "$hours:$minutes:$secs";
        }
      });
    }

    ///战斗宝箱
    if (cardPackInfo.card.length < 4) {
      cardPackInfo.card.add(CardPackInfoCard(status: -1));
    }
    for (var item in cardPackInfo.card) {
      if (item.status == 1) {
        battleBoxTimer?.cancel();
        battleBoxTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
          DateTime now = DateTime.now();
          DateTime endTime = DateUtil.getDateTimeByMs(item.openTime);
          int diff = endTime.difference(now).inSeconds;
          if (diff <= 0) {
            battleBoxTimer?.cancel();
            getBattleBox();
          } else {
            final minutes = ((diff % 3600) ~/ 60).toString().padLeft(2, '0');
            final secs = (diff % 60).toString().padLeft(2, '0');
            item.remainTime.value = "$minutes:$secs";
          }
        });
      }
    }
    update(["battleBox"]);
  }

  ///打开宝箱
  // void claimBox(int boxNumber) {
  //   if (boxNumber == 1 && !box1Claimed.value) {
  //     box1Claimed.value = true;
  //     box1Timer.value = 4 * 60 * 60; // 4小时
  //     Log.d("领取宝箱$boxNumber");
  //   } else if (boxNumber == 2 && !box2Claimed.value) {
  //     box2Claimed.value = true;
  //     box2Timer.value = 4 * 60 * 60; // 4小时
  //     Log.d("领取宝箱$boxNumber");
  //   }

  //   // 如果两个都已领取，开始倒计时
  //   if (box1Claimed.value && box2Claimed.value) {
  //     freeBoxStartTimer();
  //   }
  // }

  // void freeBoxStartTimer() {
  //   if (freeBoxTimer != null) {
  //     freeBoxTimer!.cancel();
  //   }

  //   isCountdownActive.value = true;

  //   // 每秒更新倒计时
  //   freeBoxTimer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
  //     if (box1Timer.value > 0 || box2Timer.value > 0) {
  //       if (box1Timer.value > 0) box1Timer.value--;
  //       if (box2Timer.value > 0) box2Timer.value--;

  //       // 确保只显示剩余时间较短的一个
  //       if (box1Timer.value <= 0 && box2Timer.value <= 0) {
  //         t.cancel();
  //         isCountdownActive.value = false;
  //       }
  //     } else {
  //       t.cancel();
  //       isCountdownActive.value = false;
  //     }
  //   });
  // }

  String getCountDownTimeStr() {
    int seconds = isCountdownActive.value
        ? (box1Timer.value < box2Timer.value
            ? box1Timer.value
            : box2Timer.value)
        : 0;
    final hours = (seconds ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$secs";
  }

  @override
  void onClose() {
    freeBoxTimer?.cancel();
    battleBoxTimer?.cancel();
    super.onClose();
  }
}
