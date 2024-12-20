/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2024-12-20 17:58:24
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/box_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team%20new/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TeamIndexController extends GetxController
    with GetTickerProviderStateMixin {
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
  ScrollController scrollController = ScrollController();
  RefreshController refreshController = RefreshController();
  bool recieved = false;
  RxInt cup = 0.obs;

  int step = 0;
  int selectIndex = -1;
  //摇动卡牌动画
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;
  //卡牌呼吸动画
  late AnimationController breathController;
  late Animation<double> breathAnimation;
  //背景入场动画
  RxBool showBackground1 = false.obs;
  RxBool showBackground2 = false.obs;
  RxBool showBackground3 = false.obs;
  Duration showBgDuration = const Duration(milliseconds: 200);
  RxBool showChangeText = false.obs;
  @override
  void onInit() {
    super.onInit();
    shakeController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    shakeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: -0.01), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: -0.01, end: 0), weight: 1),
      TweenSequenceItem<double>(tween: Tween(begin: 0, end: 0.01), weight: 1),
    ]).animate(
      CurvedAnimation(
        parent: shakeController,
        curve: Curves.linear,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          shakeController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          shakeController.forward();
        }
      });

    breathController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    breathAnimation =
        Tween<double>(begin: 0.93, end: 0.9).animate(breathController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              shakeController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              shakeController.forward();
            }
          });
  }

  @override
  void onReady() {
    super.onReady();
    getBattleBox();
    getTeamInfoCup();
    CacheApi.getPropDefine();
  }

  @override
  void dispose() {
    super.dispose();
    shakeController.dispose();
  }

  void onRefresh() async {
    final trainingCtrl = Get.find<TrainingController>();
    final teamCtrl = Get.find<TeamController>();
    Future.wait([
      getBattleBox(),
      getTeamInfoCup(),
      trainingCtrl.getData(),
      teamCtrl.initData()
    ]).then((v) {}).whenComplete(() {
      refreshController.refreshCompleted();
    });
  }

  void matchBattle() async {
    await Get.toNamed(RouteNames.teamTeamBattle);
    getBattleBox();
    getTeamInfoCup();
    final ctrl = Get.find<TrainingController>();
    ctrl.trainingInfo = await TeamApi.getTrainingInfo();
    ctrl.update(["training_page"]);
    TeamController teamCtrl = Get.find();
    teamCtrl.updateTeamInfo();
  }

  ///获取战斗宝箱信息
  Future getBattleBox() async {
    cardPackInfo = await TeamApi.getBattleBox();
    handlerBatterBoxData();
  }

  ///激活宝箱
  void activeBattleBox(int index) async {
    cardPackInfo = await TeamApi.activeBox(index);
    handlerBatterBoxData();
  }

  ///开启战斗宝箱
  void openBattleBox(int index, int playerId) async {
    return;
    awardList = await TeamApi.opneBattleBox(index, playerId);
    getBattleBox();
    // showBoxDialog();
  }

  ///快速开启
  void speedOpneBattleBox(int index) async {
    await TeamApi.speedOpneBattleBox(index);
    // showBoxDialog();
    getBattleBox();
  }

  ///开启免费宝箱
  void openFreeGift() async {
    awardList = await TeamApi.openFreeGift();
    showBoxDialog();
  }

  ///获取队伍信息Cup
  Future getTeamInfoCup() async {
    TeamInfoEntity team = await PicksApi.getTeamInfo();
    cup.value = team.cup;
  }

  ///宝箱奖励弹窗
  void showBoxDialog() async {
    update(["boxDialog"]);
    await showModalBottomSheet(
        isScrollControlled: true,
        context: Get.context!,
        builder: (context) {
          return const FreeBoxDialog();
        });
    getBattleBox();
  }

  void handlerBatterBoxData() {
    /// 免费宝箱
    recieved = cardPackInfo.freeGiftCount == 0 &&
        cardPackInfo.freeGiftTime > DateTime.now().millisecondsSinceEpoch;
    Log.d(
        "__freeGiftCount:${DateUtil.getDateTimeByMs(cardPackInfo.freeGiftTime)}---now ${DateTime.now()}");
    if (recieved) {
      _startTimer(
        time: cardPackInfo.freeGiftTime,
        onTick: (s) {
          final hours = (s ~/ 3600).toString().padLeft(2, '0');
          final minutes = ((s % 3600) ~/ 60).toString().padLeft(2, '0');
          final secs = (s % 60).toString().padLeft(2, '0');
          cardPackInfo.freeTimeString.value = "$hours:$minutes:$secs";
        },
        onComplete: getBattleBox,
        timer: freeBoxTimer,
      );
    }

    /// 战斗宝箱
    int lenght = cardPackInfo.card.length;
    for (int i = lenght; i < 4; i++) {
      cardPackInfo.card.add(CardPackInfoCard(status: -1));
    }

    for (var item in cardPackInfo.card) {
      final now = DateTime.now();
      final endTime = DateUtil.getDateTimeByMs(item.openTime);
      final diff = endTime.difference(now).inSeconds;
      item.totalTime = ((diff % 3600) ~/ 60).toString();
      if (item.status == 1) {
        final minutes = ((diff % 3600) ~/ 60).toString().padLeft(2, '0');
        final secs = (diff % 60).toString().padLeft(2, '0');

        item.remainTime.value = "$minutes:$secs";
        _startTimer(
          time: item.openTime,
          onTick: (v) {
            final minutes = ((v % 3600) ~/ 60).toString().padLeft(2, '0');
            final secs = (v % 60).toString().padLeft(2, '0');
            item.remainTime.value = "$minutes:$secs";
            item.progress = (diff - v) / diff;
          },
          onComplete: getBattleBox,
          timer: battleBoxTimer,
        );
      }
    }
    update(["battleBox"]);
  }

  /// 通用计时器启动函数
  void _startTimer({
    required int time,
    required void Function(int) onTick,
    required VoidCallback onComplete,
    Timer? timer,
  }) {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      // Log.e("开始倒计时");
      final now = DateTime.now();
      final endTime = DateUtil.getDateTimeByMs(time);
      final diff = endTime.difference(now).inSeconds;
      // Log.e("倒计时$diff");
      if (diff < 0) {
        Log.i("倒计时完成");
        timer?.cancel();
        onComplete();
      } else {
        onTick(diff);
      }
    });
  }

  ///滚动到老虎机
  void scroToSlot() {
    if (scrollController.offset != 890.w) {
      scrollController.animateTo(
        890.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  ///滚动到战斗
  void scroToMatch() {
    if (scrollController.offset != (479.w)) {
      scrollController.animateTo(
        479.w,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future showBigCard(PlayerCardEntity card) async {
    shakeController.reset();
    shakeController.stop();

    step = 2;
    update(["open_box_page"]);
    showBackground1.value = true;
    await Future.delayed(showBgDuration);
    showBackground2.value = true;
    await Future.delayed(showBgDuration);
    showBackground3.value = true;
    await Future.delayed(showBgDuration);
    await Future.delayed(showBgDuration);
    card.isOpen.value = true;
    update(["open_box_page"]);
  }

  Future closeBigBox() async {
    showBackground1.value = false;
    await Future.delayed(showBgDuration);
    showBackground2.value = false;
    await Future.delayed(100.milliseconds);
    showBackground3.value = false;
    await Future.delayed(showBgDuration);
  }

  @override
  void onClose() {
    freeBoxTimer?.cancel();
    battleBoxTimer?.cancel();
    super.onClose();
  }

  openPage() {}

  closePage() {}
}
