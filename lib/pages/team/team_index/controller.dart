/*
 * @Description: 
 * @Author: lihonghao
 * @Date: 2024-09-26 16:49:14
 * @LastEditTime: 2025-01-20 10:53:07
 */

import 'dart:async';

import 'package:arm_chair_quaterback/common/entities/card_pack_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/player_card_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/WebSocket.dart';
import 'package:arm_chair_quaterback/common/net/apis/cache.dart';
import 'package:arm_chair_quaterback/common/net/apis/picks.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/routers/names.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/common/utils/utils.dart';
import 'package:arm_chair_quaterback/generated/assets.dart';
import 'package:arm_chair_quaterback/common/widgets/dialog/tip_dialog.dart';
import 'package:arm_chair_quaterback/pages/home/home_controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/controller.dart';
import 'package:arm_chair_quaterback/pages/team/illustratiions/detail_controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/open_box/open_box_page.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/widgets/box_dialog.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/team_new/controller.dart';
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
  bool isOpen = false;
  bool loadDataSuccess = false;

  late StreamSubscription<int> subscription;

  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 4; i++) {
      cardPackInfo.card.add(CardPackInfoCard(status: -1));
    }
    subscription = WSInstance.netStream.listen((_) {
      if (!loadDataSuccess) {
        _initData();
      }
    });
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
        Tween<double>(begin: 0.95, end: 0.9).animate(breathController);
  }

  @override
  void onReady() {
    super.onReady();

    _initData();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
    shakeController.dispose();
  }

  _initData() {
    final trainingCtrl = Get.find<TrainingController>();
    final teamCtrl = Get.find<TeamController>();
    Future.wait([
      getBattleBox(),
      getTeamInfoCup(),
      CacheApi.getPropDefine(),
      CacheApi.getCardPackDefine(),
      trainingCtrl.getData(),
      teamCtrl.initData()
    ]).then((v) {
      loadDataSuccess = true;
    });
  }

  void onRefresh() async {
    final trainingCtrl = Get.find<TrainingController>();
    final teamCtrl = Get.find<TeamController>();
    Future.wait([
      getBattleBox(),
      getTeamInfoCup(),
      CacheApi.getPropDefine(),
      CacheApi.getCardPackDefine(),
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
  void openBattleBox(int index, PlayerCardEntity card) async {
    // return;
    if (isOpen) return;
    isOpen = true;
    awardList = await TeamApi.opneBattleBox(index, card.playerId);
    showBigCard(card);
    getBattleBox();
    IllustratiionsController ctrl = Get.find();
    ctrl.getPlayerCollectInfo();
    // showBoxDialog();
  }

  ///快速开启
  void speedOpneBattleBox(int index, int cost) async {
    // bool result = HomeController.to.updateChips(-cost);
    // if (!result) return;
    await TeamApi.speedOpneBattleBox(index).then((v) async {
      HomeController.to.updateTeamProp();
      await toOpenBoxPage(cardPackInfo.card[index]);
    });
    // showBoxDialog();
    getBattleBox();
  }

  Future toOpenBoxPage(CardPackInfoCard item) async {
    isOpen = false;
    step = 0;
    for (var e in item.playerCards) {
      e.isOpen.value = false;
      e.isSelect.value = false;
    }
    await Get.to(
        opaque: false,
        () => OpenBoxPage(item: item),
        duration: 300.milliseconds,
        transition: Transition.fadeIn);
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
    HomeController.to.updateMoney();
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
      int needTime =
          CacheApi.cardPackDefineMap[item.cardId]?.cardPackOpenTime ?? 0;
      item.totalTimeValue = needTime;
      if (needTime ~/ 3600 > 0) {
        item.totalTime = "${needTime ~/ 3600} H";
      } else {
        item.totalTime = "${(needTime % 3600) ~/ 60} MIN";
      }
      if (item.status == 1) {
        final hours = (diff ~/ 3600).toString().padLeft(2, '0');
        final minutes = ((diff % 3600) ~/ 60).toString().padLeft(2, '0');
        final secs = (diff % 60).toString().padLeft(2, '0');

        item.remainTime.value = "$hours:$minutes:$secs";
        _startTimer(
          time: item.openTime,
          onTick: (v) {
            final hours = (diff ~/ 3600).toString().padLeft(2, '0');
            final minutes = ((v % 3600) ~/ 60).toString().padLeft(2, '0');
            final secs = (v % 60).toString().padLeft(2, '0');
            item.remainTime.value = "$hours:$minutes:$secs";
            item.progress = (item.totalTimeValue - v) / item.totalTimeValue;
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

  ///设置晃动动画，等级低轻微晃动
  void forwardShake(int currentId, CardPackInfoCard e) {
    int milliseconds = 200;
    //按照等级排序,3张以上3张剧烈晃动，一下两张
    e.players.sort((a, b) => _grade(a).compareTo(_grade(b)));
    if (e.players.length > 3) {
      int index = e.players.indexOf(currentId);
      milliseconds = index < 3 ? 100 : 250;
    } else {
      int index = e.players.indexOf(currentId);
      milliseconds = index < 2 ? 100 : 250;
    }
    shakeController.duration = Duration(milliseconds: milliseconds);
    shakeController.forward();
  }

  int _grade(int playerId) {
    String grade = Utils.getPlayBaseInfo(playerId).grade;
    grade = grade.replaceAll("-", "").replaceAll("+", "");
    switch (grade) {
      case "S":
        return 0;
      case "A":
        return 1;
      case "B":
        return 2;
      case "C":
        return 3;
      case "D":
        return 4;
      default:
        return 5;
    }
  }
}
