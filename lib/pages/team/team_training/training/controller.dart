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
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TrainingController extends GetxController
    with GetTickerProviderStateMixin {
  final random = Random();
  bool isPlaying = false;
  RxInt currentIndex = 0.obs;
  var showBall = false.obs;
  var showPlayer = false.obs;
  var showCash = false.obs;
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

  final List<int> propList = [301, 302, 303, 304, 305, 306];

  Map<int, int> proCountMap = {
    102: 0,
    301: 0,
    302: 0,
    303: 0,
    304: 0,
    305: 0,
    306: 0,
  };

  //球员滚动
  late Timer _timer;
  late ScrollController playerScrollCtrl;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    playerScrollCtrl = ScrollController();
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
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.1), weight: 10),
        TweenSequenceItem<double>(
            tween: Tween(begin: 1.1, end: 1.0), weight: 10),
      ]).animate(CurvedAnimation(
          parent: slotsAnimlList[index], curve: Curves.easeInOut));
    });
    scaleAnimations = List.generate(6, (index) {
      return TweenSequence([
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1), weight: 60),
        TweenSequenceItem<double>(tween: Tween(begin: 1, end: 1.5), weight: 10),
        TweenSequenceItem<double>(tween: Tween(begin: 1.5, end: 1), weight: 10),
      ]).animate(CurvedAnimation(
          parent: slotsAnimlList[index], curve: Curves.easeInOut));
    });
  }

  // void _onScroll() {
  //   for (int i = 0; i < scrollerCtrlList.length; i++) {
  //     final controller = scrollerCtrlList[i];
  //     if (controller.positions.isNotEmpty) {
  //       final position = controller.position;
  //       if (position.userScrollDirection == ScrollDirection.forward) {
  //         // 用户正在向上滚动
  //         print('Scrolling forward in slot $i');
  //       } else if (position.userScrollDirection == ScrollDirection.reverse) {
  //         // 用户正在向下滚动
  //         print('Scrolling reverse in slot $i');
  //       } else if (position.userScrollDirection == ScrollDirection.idle) {
  //         // 滚动停止
  //         print('Scrolling idle in slot $i');
  //         if (position.pixels == position.maxScrollExtent) {
  //           // 滚动到底部
  //           print('Scrolled to the bottom in slot $i');
  //         } else if (position.pixels == 0) {
  //           // 滚动到顶部
  //           print('Scrolled to the top in slot $i');
  //         }
  //       }
  //     }
  //   }
  // }

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
    for (var controller in scrollerCtrlList) {
      controller.dispose();
    }
  }

  Future getData() async {
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId!;
    await Future.wait([
      // CacheApi.getRewardGroup(),
      TeamApi.getTrainingInfo(),
      // TeamApi.getMyTeamPlayer(teamId),
      TeamApi.getTrainTaskList(),
      TeamApi.getTrainDefine(),
      TeamApi.getMyTeamPlayer(teamId)
    ]).then((v) {
      // rewardList = v[0] as List<RewardGroupEntity>;
      trainingInfo = v[0] as TrainingInfoEntity;
      trainTaskList = v[1] as List<TrainTaskEntity>;
      trainDefine = v[2] as TrainDefineEntity;
      playerList = (v[3] as MyTeamEntity).teamPlayers;
      ballNum.value = trainingInfo.prop.num;
      recoverTimeAndCountDown();
      update(["training_page"]);
      Future.delayed(const Duration(milliseconds: 200), () {});
    });
  }

  ///获取配置数据计算倒计时
  void recoverTimeAndCountDown() {
    int recover = trainDefine.ballRecoverTime;
    DateTime recoverTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.ballRefreshTime)
            .add(Duration(seconds: recover));
    Log.d("恢复时间:$recoverTime");
    Log.d("现在时间:${DateTime.now()}");
    int seconds = recoverTime.difference(DateTime.now()).inSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (v) async {
      seconds--;

      ///获取回复篮球与当前时间倒计时，转换成mm:ss
      final minutes = seconds ~/ 60;
      final remainingSeconds = seconds % 60;
      recoverTimeStr.value =
          '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (seconds <= 0) {
        _timer.cancel();
        // 重新获取新的恢复时间进行倒计时
        trainingInfo = await TeamApi.getTrainingInfo();
        recoverTimeAndCountDown();
      }
    });
  }

  void buyTrainingBall(int count) {
    TeamApi.buyTrainingBall(count).then((v) {
      trainingInfo.prop.num = v;
      update(["training_page"]);
    });
  }

  void startSlot() async {
    final teamIndexCtrl = Get.find<TeamIndexController>();
    teamIndexCtrl.scroToSlot();
    trainingInfo = await TeamApi.playerTraining(playerList[0].uuid);
    for (int i = 0; i < slotCard.length; i++) {
      slotCard[i].value = false;
      scrollerCtrlList[i].jumpTo(0);
    }

    for (int i = 0; i < scrollerCtrlList.length; i++) {
      Future.delayed(Duration(milliseconds: i * 200), () {
        _scrollColumn(i);
      });
    }
  }

  void _scrollColumn(int index) {
    slotCard[index].value = true;
    int propIndex = propList.indexOf(trainingInfo.propArray[index]);

    ///在获奖的结果基础上旋转两周
    double offset = 68.w * (propIndex + propList.length * 3);
    slotsAnimlList[index].forward();
    scrollerCtrlList[index]
        .animateTo(offset,
            duration: const Duration(milliseconds: 600),
            curve: const Cubic(0.27, 0.59, 0.19, 1.1))
        .then((_) {
      if (index == 5) {
        showCash.value = true;
        showBall.value = true;
        showPlayer.value = true;
        Future.delayed(const Duration(milliseconds: 1000)).then((v) {
          showCash.value = false;
          showBall.value = false;
          showPlayer.value = false;
          reset();
          update(["training_page"]);
        });
      }
    });
  }

  void reset() {
    showCash.value = false;
    showBall.value = false;
    showPlayer.value = false;
    for (var element in slotsAnimlList) {
      element.reset();
    }
  }

  void _animateResult() {
    for (int i = 0; i < slotCard.length; i++) {
      if (i < trainingInfo.propArray.length) {
        int prop = trainingInfo.propArray[i];
        _animateIcon(i, prop);
      }
    }
  }

  void _animateIcon(int index, int prop) {
    final AnimationController controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final Animation<double> sizeAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween(begin: 1.0, end: 1.2), weight: 50),
      TweenSequenceItem<double>(tween: Tween(begin: 1.2, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.forward();

    sizeAnimation.addListener(() {
      update(["slot"]);
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      }
    });
  }

  void startPlayerScroll(int count) async {
    slotCard = [true.obs, true.obs, true.obs];
    update(["slot"]);

    if (playerScrollCtrl.hasClients) {
      // int delay = (50 + pow(count, 2.8)).toInt(); // Start fast, then slow
      await playerScrollCtrl.animateTo(
        playerScrollCtrl.offset + 75.w * 20,
        duration: const Duration(milliseconds: 2000),
        // curve: const Cubic(0.32, 0.48, 0.32, 0.98),
        // curve: const Cubic(0.22, 0.53, 0, 1.02),
        curve: const Cubic(0.27, 0.59, 0.19, 1.02),
      );

      // 当滚动到最后一个可见项时，重置到起点
      if (playerScrollCtrl.offset >=
          playerScrollCtrl.position.maxScrollExtent) {
        playerScrollCtrl.jumpTo(0);
      }
      currentIndex.value =
          ((playerScrollCtrl.offset ~/ 75.w).ceil() + 2) % (playerList.length);
    }
  }

  ///奖励飞跃动画
  ///102:钱
  ///301:钱
  ///302:中钱
  ///303:状态
  ///304:Buff、战术
  ///305:任务
  ///306:球
  void awardAnimation() async {
    Map<int, int> propMap = countAward();
    proCountMap = countProp();
    if (propMap[301]! > 0 || propMap[302]! > 0 || propMap[102]! > 0) {
      updateMoney();
    }
  }

  void updateMoney() {
    for (var e in trainingInfo.award) {
      for (var element
          in HomeController.to.userEntiry.teamLoginInfo!.teamPropList!) {
        if ((e.id == 102 && element.propId == 102) ||
            (e.id == 103 && element.propId == 103)) {
          element.num = element.num! + e.num;
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
