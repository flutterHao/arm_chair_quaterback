import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/home/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///1:战术(buff)
///2:状态
///3:道具
///4:篮球
///5:钞票
class TrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final random = Random();
  RxBool isPlaying = false.obs;
  // RxInt currentIndex = 0.obs;
  var showBall = false.obs;
  var showPlayer = false.obs;
  var showStatus = false.obs;
  var showCash = false.obs;
  var showBuff = false.obs;
  RxInt cash = 0.obs;

  TrainingInfoEntity trainingInfo = TrainingInfoEntity();
  List<TeamPlayerInfoEntity> playerList = [];
  List<TrainTaskEntity> trainTaskList = [];
  TrainDefineEntity trainDefine = TrainDefineEntity();
  RxInt ballNum = 0.obs;
  RxString recoverTimeStr = "".obs;
  List<RxBool> slotCard = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];
  final List<ScrollController> scrollerCtrlList =
      List.generate(6, (_) => ScrollController());

  List<AnimationController> slotsAnimlList = [];
  List<Animation<double>> sizeAnimations = [];
  List<Animation<double>> scaleAnimations = [];
  List<RxBool> isAwards = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  final List<int> propList = [1, 2, 3, 4, 5];
  final List<int> statusList = [104, 103, 102, 101];

  //球员滚动
  late Timer _timer;
  late Timer _timer1;
  late ScrollController playerScollCtrl;
  List<ScrollController> statusScollerList = [];
  int playerIdx = 0;
  bool showResult = false;

  ///战术卡牌
  RxBool isChange = false.obs;
  int tacticId = 0;
  int changeTacticId = 0;
  List<TrainingInfoBuff> tacticList = [];
  List<TrainingInfoBuff> chooseTacticList = [];
  List<AnimationController> tacAnimlList = [];
  List<Animation<double>> tacSizeAnimations = [];
  List<Animation<double>> tacScaleAnimations = [];
  List<Animation<double>> tacPosAnimations = [];

  //任务
  int currentTask = 10;
  RxString taskCountDownString = "".obs;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    playerScollCtrl = ScrollController();
    slotsAnimlList = List.generate(6, (_) {
      return AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      );
    });
    sizeAnimations = List.generate(6, (index) {
      return TweenSequence([
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 0.9), weight: 1),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 0.9), weight: 40),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.9, end: 0.8), weight: 10),
        TweenSequenceItem<double>(
            tween: Tween(begin: 0.8, end: 1.0), weight: 10),
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.2), weight: 10),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.2, end: 1.0), weight: 10),
      ]).animate(CurvedAnimation(
          parent: slotsAnimlList[index], curve: Curves.easeInOut));
    });
    scaleAnimations = List.generate(6, (index) {
      return TweenSequence([
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 60),
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.2), weight: 10),
        TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1), weight: 10),
      ]).animate(
          CurvedAnimation(parent: slotsAnimlList[index], curve: Curves.linear));
    });
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
    getData();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _timer1.cancel();
    for (var controller in scrollerCtrlList) {
      controller.dispose();
    }
  }

  Future getData() async {
    await Future.wait([
      // CacheApi.getRewardGroup(),
      TeamApi.getTrainingInfo(),
      // TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getTrainTaskList(),
      TeamApi.getTrainDefine(),
      getPlayerList(),
    ]).then((v) {
      // rewardList = v[0] as List<RewardGroupEntity>;
      trainingInfo = v[0] as TrainingInfoEntity;
      trainTaskList = v[1] as List<TrainTaskEntity>;
      trainDefine = v[2] as TrainDefineEntity;
      ballNum.value = trainingInfo.prop.num;
      tacticList = trainingInfo.buff;
      for (int i = 0; i < trainTaskList.length; i++) {
        if (trainingInfo.training.currentTaskId == trainTaskList[i].taskLevel) {
          currentTask = trainTaskList[i].taskNeed;
        }
      }
      recoverTimeAndCountDown();
      taskCountDownTime();
      update(["training_page"]);
    }).catchError((v) {
      EasyLoading.showToast(v.toString());
      isPlaying.value = false;
    });
  }

  Future getPlayerList() async {
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId!;
    MyTeamEntity teamEntity = await TeamApi.getMyTeamPlayer(teamId);
    playerList = teamEntity.teamPlayers;
  }

  ///获取配置数据计算倒计时
  void recoverTimeAndCountDown() {
    if (trainingInfo.prop.num >= trainDefine.ballMaxNum) {
      return;
    }
    int recover = trainDefine.ballRecoverTime;
    DateTime now = DateTime.now();
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.ballRefreshTime)
            .add(Duration(seconds: recover));
    int recoverSeconds = recoverTime.difference(now).inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      recoverSeconds--;

      ///获取回复篮球与当前时间倒计时，转换成mm:ss
      final minutes = recoverSeconds ~/ 60;
      final remainingSeconds = recoverSeconds % 60;
      recoverTimeStr.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (recoverSeconds <= 0) {
        _timer.cancel();
        // 重新获取新的恢复时间进行倒计时
        trainingInfo = await TeamApi.getTrainingInfo();
        update(["training_page"]);
        recoverTimeAndCountDown();
      }
    });
  }

  ///任务倒计时
  void taskCountDownTime() async {
    DateTime now = DateTime.now();

    DateTime taskRefreshTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.taskEndTime);

    int taskSeconds = taskRefreshTime.difference(now).inSeconds;
    _timer1 = Timer.periodic(const Duration(seconds: 1), (v) async {
      taskSeconds--;
      final hours = taskSeconds ~/ 3600;
      final minutes = (taskSeconds % 3600) ~/ 60;
      final remainingSeconds = taskSeconds % 60;
      taskCountDownString.value =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (taskSeconds <= 0) {
        _timer1.cancel();
        // 重新获取新的恢复时间进行倒计时
        trainingInfo = await TeamApi.getTrainingInfo();
        update(["training_page"]);
        taskCountDownTime();
      }
    });
  }

  void buyTrainingBall(int count) {
    TeamApi.buyTrainingBall(count).then((v) {
      trainingInfo.prop.num = v;
      update(["training_page"]);
    });
  }

  void chooseTactic() {
    if (tacticId == 0) return;
    if (tacticList.length >= 5 && changeTacticId == 0) {
      isChange.value = true;
      return;
    }
    showBuff.value = false;
    TeamApi.chooseTactic(tacticId, replaceTacticId: changeTacticId).then((v) {
      tacticList = v;
    }).whenComplete(() {
      tacticId = 0;
      changeTacticId = 0;
      isChange.value = false;
      showBuff.value = false;
      update(["training_page"]);
    });
  }

  void startSlot() async {
    if (isPlaying.value) return;
    isPlaying.value = true;
    final teamIndexCtrl = Get.find<TeamIndexController>();
    teamIndexCtrl.scroToSlot();
    playerIdx = random.nextInt(playerList.length);
    await TeamApi.playerTraining(playerList[playerIdx].uuid).then((v) {
      trainingInfo = v;
      update(["training_page"]);
      for (int i = 0; i < slotCard.length; i++) {
        slotCard[i].value = false;
        scrollerCtrlList[i].jumpTo(0);
      }

      for (int i = 0; i < scrollerCtrlList.length; i++) {
        Future.delayed(Duration(milliseconds: i * 200), () {
          _scrollColumn(i);
        });
      }
    }).catchError((v) {
      isPlaying.value = false;
      // EasyLoading.showToast(v.message.toString());
    });
  }

  void _scrollColumn(int index) async {
    slotCard[index].value = true;
    int propIndex = propList.indexOf(trainingInfo.propArray[index]);

    ///在获奖的结果基础上旋转三周
    double offset = 68.w * (propIndex + propList.length * 3);
    slotsAnimlList[index].forward();
    await scrollerCtrlList[index].animateTo(offset,
        duration: const Duration(milliseconds: 600),
        curve: const Cubic(0.27, 0.59, 0.19, 1.1));
    if (index == 5) {
      ///最后一个旋转结束
      List<int> awads = [];
      for (var e in trainingInfo.award) {
        ///槽位显示中奖放大动画
        for (int i = 0; i < trainingInfo.propArray.length; i++) {
          if (trainingInfo.propArray[i] == e.id) {
            isAwards[i].value = true;
            //槽位恢复
            Future.delayed(const Duration(milliseconds: 200), () {
              isAwards[i].value = false;
            });
          }
        }
        if (e.id == 5) {
          cash.value = e.num;
        }
        awads.add(e.id);
      }

      ///奖励表达
      ///战术 buff
      if (awads.contains(1)) {
        showBuff.value = true;
        tacticList = trainingInfo.buff;
        chooseTacticList = trainingInfo.chooseBuffs;
        update(["training_page"]);
        await Future.delayed(const Duration(milliseconds: 200));
        for (var element in chooseTacticList) {
          await Future.delayed(const Duration(milliseconds: 100));
          element.isOpen.value = true;
        }
        // await Future.delayed(const Duration(milliseconds: 300));
        //  showBuff.value = false;
      }

      ///2:状态
      if (awads.contains(2)) {
        await startPlayerScroll(0);
      }

      ///3:道具
      if (awads.contains(3)) {}

      ///4:篮球
      if (awads.contains(4)) {
        showBall.value = true;
        await Future.delayed(const Duration(milliseconds: 300), () {
          showBall.value = false;
        });
      }

      ///5:钞票
      if (awads.contains(5)) {
        showCash.value = true;
        await Future.delayed(const Duration(milliseconds: 600), () {
          showCash.value = false;
        });
      }
      isPlaying.value = false;
      for (var element in slotsAnimlList) {
        element.reset();
      }
      // getPlayerList();
      update(["training_page"]);
    }
  }

  ///球员滚动
  Future startPlayerScroll(int count) async {
    ///状态控制
    await Future.delayed(const Duration(milliseconds: 300));
    trainingInfo.selectPlayer.value =
        trainingInfo.statusReplyPlayers.map((e) => e.playerId).toList();
    statusScollerList.clear();
    for (int i = 0; i < trainingInfo.statusReplyPlayers.length; i++) {
      statusScollerList.add(ScrollController());
    }
    showPlayer.value = true;
    update(["playerList"]);
    if (playerScollCtrl.hasClients) {
      playerScollCtrl.jumpTo(0);
      double offset = (playerIdx + playerList.length * 3 - 4) * 50.w;
      await playerScollCtrl
          .animateTo(
        playerScollCtrl.offset + offset,
        duration: const Duration(milliseconds: 1500),
        // curve: Curves.easeInOut,
        curve: const Cubic(0.27, 0.59, 0.19, 1.05),
      )
          .then((v) async {
        showResult = true;
        showStatus.value = true;
        // for (var controller in statusScollerList) {
        //   controller.dispose();
        // }

        update(["playerList"]);
        // update(["training_page"]);
        for (int i = 0; i < statusScollerList.length; i++) {
          await Future.delayed(Duration(milliseconds: 200 + i * 50), () {});
          statusScroll(i);
        }
        await Future.delayed(const Duration(milliseconds: 1500), () {
          showPlayer.value = false;
          showResult = false;
          showStatus.value = false;
        });
      });
    }
  }

  void statusScroll(int index) async {
    // int oldIndex =
    //     statusList.indexOf(trainingInfo.statusReplyPlayers[index].playerStatus);
    // statusScollerList[index].jumpTo(oldIndex * 30.w);
    if (statusScollerList[index].hasClients) {
      statusScollerList[index].jumpTo(0);
      int newIndex = statusList
          .indexOf(trainingInfo.statusReplyPlayers[index].playerStatus);
      double offset = 30.w * (newIndex);
      statusScollerList[index].animateTo(offset,
          duration: const Duration(milliseconds: 600),
          curve: const Cubic(0.27, 0.59, 0.19, 1.0));
    }
  }

  void updateMoney() {
    for (var e in trainingInfo.award) {
      if (e.id == 5) {
        for (var element
            in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
          if (element.propId == 102) {
            element.num = element.num! + e.num;
          }
        }
      }
    }
    HomeController.to.update(["userInfo"]);
  }

  ///计算由那些奖励
  Map<int, int> countAward() {
    Map<int, int> map = {
      102: 0,
      301: 0,
      302: 0,
      303: 0,
      304: 0,
      305: 0,
      306: 0,
    };
    for (TrainingInfoAward award in trainingInfo.award) {
      if (award.num > 0) {
        map[award.id] = (map[award.id] ?? 0) + 1;
      }
    }
    return map;
  }

  ///计算每个的数量
  Map<int, int> countProp() {
    Map<int, int> map = {
      102: 0,
      301: 0,
      302: 0,
      303: 0,
      304: 0,
      305: 0,
      306: 0,
    };
    for (int i in trainingInfo.propArray) {
      map[i] = (map[i] ?? 0) + 1;
    }

    return map;
  }

//   ///返回大于3的元素
//   List<int> findConsecutiveElements(List<int> slots) {
//     List<int> result = [];
//     if (slots.isEmpty) return result;

//     int currentElement = slots[0];
//     int count = 1;

//     for (int i = 1; i < slots.length; i++) {
//       if (slots[i] == currentElement) {
//         count++;
//       } else {
//         if (count >= 3) {
//           result.add(currentElement);
//         }
//         currentElement = slots[i];
//         count = 1;
//       }
//     }

//     // 检查最后一个元素的连续出现次数
//     if (count >= 3) {
//       result.add(currentElement);
//     }

//     return result;
//   }
}
