import 'dart:async';
import 'dart:math';

import 'package:arm_chair_quaterback/common/entities/my_team_entity.dart';
import 'package:arm_chair_quaterback/common/entities/team_player_info_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_define_entity.dart';
import 'package:arm_chair_quaterback/common/entities/train_task_entity.dart';
import 'package:arm_chair_quaterback/common/entities/training_info_entity.dart';
import 'package:arm_chair_quaterback/common/net/apis/team.dart';
import 'package:arm_chair_quaterback/common/services/services.dart';
import 'package:arm_chair_quaterback/common/utils/click_feed_back.dart';
import 'package:arm_chair_quaterback/common/utils/logger.dart';
import 'package:arm_chair_quaterback/pages/home/index.dart';
import 'package:arm_chair_quaterback/pages/team/team_index/controller.dart';
import 'package:arm_chair_quaterback/pages/team/team_training/training/widgets/training_award_dialog.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/constant/getx_builder_ids.dart';

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
  var caShScale = false.obs;
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
  int awardLength = 3;
  List<RxBool> isAwards = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  List<RxBool> showBoxList = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  List<RxBool> isShowColor = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];
  late AnimationController colorAnimatedCtrl;
  late Animation<double> colorAnimation;

  final List<int> propList = [1, 2, 3, 4, 5];
  final List<int> statusList = [104, 103, 102, 101];

  //球员滚动
  late Timer _timer;
  late Timer _timer1;
  late ScrollController playerScollCtrl;
  List<ScrollController> statusScollerList = [];
  int playerIdx = 0;
  var showPlayerBox = false.obs;
  // AnimationController showBoxAnimationCtrl;
  // Animation<double>
  bool playerScrollerEnd = false;
  RxInt currentPlayerIndex = 3.obs;

  ///战术卡牌
  RxBool showChooseDialog = false.obs;
  RxBool isChange = false.obs;
  int tacticId = 0;
  int changeTacticId = 0;
  List<TrainingInfoBuff> tacticList = [];
  List<TrainingInfoBuff> chooseTacticList = [];
  RxBool isNotTip = false.obs;
  late AnimationController shakeController;
  late Animation<double> shakeAnimation;
  //卡牌动画
  List<AnimationController> tacAnimlList = [];
  List<Animation<double>> tacSizeAnimations = [];
  List<Animation<double>> tacScaleAnimations = [];
  List<Animation<double>> tacPosAnimations = [];

  //任务
  RxInt taskValue = 0.obs;
  int currentTaskNeed = 10;
  RxDouble taskProgress = 0.0.obs;
  RxString taskCountDownString = "".obs;
  late DateTime refreshTime = DateTime.now();
  //奖励飞行动画
  late AnimationController flyAnimationCtrl;
  late Animation<double> flyAnimation;

  //箭头动画
  late AnimationController arrowAnimCtrl;
  late Animation<double> arrowAnimated;

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getNoTip();
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

    //飞行
    flyAnimationCtrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    flyAnimation = Tween<double>(begin: 0, end: 1).animate(flyAnimationCtrl);

    shakeController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
    shakeAnimation = Tween<double>(begin: -0.01, end: 0.01).animate(
      CurvedAnimation(
        parent: shakeController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          shakeController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          shakeController.forward();
        }
      });

    colorAnimatedCtrl = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    colorAnimation = Tween<double>(begin: 0, end: 1).animate(colorAnimatedCtrl);

    arrowAnimCtrl = AnimationController(
      duration: 150.milliseconds,
      vsync: this,
    );

    arrowAnimated = Tween<double>(begin: 0.0, end: 10).animate(arrowAnimCtrl)
      ..addListener(() {
        if (arrowAnimated.value >= 10) {
          arrowAnimCtrl.reverse();
        } else if (arrowAnimated.value <= 0.0) {
          arrowAnimCtrl.forward();
        }
      });
  }

  void changeDuration(Duration newDuration) {
    // 停止当前的动画控制器
    arrowAnimCtrl.stop();

    // 重新初始化动画控制器
    arrowAnimCtrl = AnimationController(
      duration: newDuration,
      vsync: this,
    );

    // 重新创建动画
    arrowAnimated = Tween<double>(begin: 0.0, end: 10).animate(arrowAnimCtrl)
      ..addListener(() {
        if (arrowAnimated.value >= 10) {
          arrowAnimCtrl.reverse();
        } else if (arrowAnimated.value <= 0.0) {
          arrowAnimCtrl.forward();
        }
      });

    // 重新启动动画
    arrowAnimCtrl.forward();
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
          currentTaskNeed = trainTaskList[i].taskNeed;
        }
      }
      taskValue.value = trainingInfo.training.taskItemCount;
      recoverTimeAndCountDown();
      taskCountDownTime();
      update(["training_page"]);
    }).catchError((v) {
      EasyLoading.showToast(v.toString());
      isPlaying.value = false;
    });
  }

  Future getPlayerList() async {
    if (HomeController.to.userEntiry.teamLoginInfo == null) {
      await HomeController.to.refreshUserEntity();
    }
    int teamId = HomeController.to.userEntiry.teamLoginInfo!.team!.teamId ?? 0;
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
    refreshTime = now;
    DateTime taskRefreshTime =
        DateUtil.getDateTimeByMs(trainingInfo.training.taskEndTime);

    int taskSeconds = taskRefreshTime.difference(now).inSeconds;
    if (trainingInfo.training.todayTaskOver == 1) return;
    _timer1 = Timer.periodic(const Duration(seconds: 1), (v) async {
      taskSeconds--;
      final hours = taskSeconds ~/ 3600;
      final minutes = (taskSeconds % 3600) ~/ 60;
      final remainingSeconds = taskSeconds % 60;
      taskCountDownString.value =
          '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
      if (taskSeconds <= 0) {
        if (refreshTime.difference(now).inSeconds < 10) {
          return;
        }
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
      ballNum.value = v;
      // update(["training_page"]);
    });
  }

  void chooseTactic(BuildContext context) async {
    if (tacticId == 0) return;
    if (tacticList.length >= 5) {
      ///如果卡槽有这个直接添加
      TrainingInfoBuff buff =
          chooseTacticList.where((e) => e.id == tacticId).first;
      if (tacticList
          .where((e) => e.color == buff.color && e.face == buff.face)
          .isNotEmpty) {
        var myBuff = tacticList
            .where((e) => e.color == buff.color && e.face == buff.face)
            .first;
        if (myBuff.takeEffectGameCount >= 6) {
          shakeController.forward();
          ClickFeedBack.selectionClick();
          EasyLoading.showToast("Tactics Slot is fulled");
          await chooseEnd(context, 0);
          return;
        }
        changeTacticId = tacticId;
      } else if (changeTacticId == 0) {
        if (!isChange.value) {
          shakeController.forward();
          isChange.value = true;
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                return TrainingAwardDialog(buff);
              });
        }

        return;
      }
    }
    int type = 1; //1替换,0直接添加
    if (changeTacticId != 0) {
      for (int i = 0; i < tacticList.length; i++) {
        if (tacticList[i].id == changeTacticId) {
          for (int j = 0; j < chooseTacticList.length; j++) {
            if (tacticId == chooseTacticList[j].id) {
              tacticList[i] = chooseTacticList[j];
              // double x = 162.5.w + i * 37.w;
              // chooseTacticList[j].offset.value = Offset(x, 45.w);
              type = 0;
            }
          }
        }
      }
    } else {
      ///直接添加
      for (int i = 0; i < chooseTacticList.length; i++) {
        if (tacticId == chooseTacticList[i].id) {
          tacticList.add(chooseTacticList[i]);
          // double x = 162.5.w + i * 37.w;
          // chooseTacticList[i].offset.value = Offset(x, 45.w);
        }
      }
    }
    TeamApi.chooseTactic(tacticId, replaceTacticId: changeTacticId)
        .then((v) async {
      shakeController.value = 0;
      shakeController.stop();

      ///tacticList替换上面的buff
      await chooseEnd(context, type);

      tacticList = v;
      update(["training_page"]);
    }).whenComplete(() {});
  }

  Future chooseEnd(BuildContext context, int type) async {
    update(["training_page"]);

    tacticId = 0;
    changeTacticId = 0;
    showBuff.value = false;
    isPlaying.value = false;
    if (type == 0) await Future.delayed(const Duration(seconds: 1));
    if (isChange.value) {
      await Future.delayed(const Duration(milliseconds: 500));
      Navigator.of(context).pop();
    }
    isChange.value = false;
    for (var element in chooseTacticList) {
      element.isOpen.value = false;
    }
  }

  void saveNotTip() {
    String date =
        DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d);
    StorageService.to.setBool("noTip$date", isNotTip.value);
  }

  void getNoTip() {
    String date =
        DateUtil.formatDate(DateTime.now(), format: DateFormats.y_mo_d);
    isNotTip.value = StorageService.to.getBool("noTip$date");
    Log.d("noTip:${isNotTip.value}");
  }

  void chooseFinish() {
    tacticId = 0;
    changeTacticId = 0;
    isChange.value = false;
    showBuff.value = false;
    isPlaying.value = false;
    for (var element in chooseTacticList) {
      element.isOpen.value = false;
    }
    update(["training_page"]);
  }

  void initSlot() {
    isPlaying.value = true;
    cash.value = 0;
    for (var e in showBoxList) {
      e.value = false;
    }
    // showBuff.value = false;
  }

  void startSlot() async {
    if (isPlaying.value) return;
    initSlot();
    final teamIndexCtrl = Get.find<TeamIndexController>();
    teamIndexCtrl.scroToSlot();
    playerIdx = random.nextInt(playerList.length);
    ballNum.value = ballNum.value - 1;
    await TeamApi.playerTraining(playerList[playerIdx].uuid).then((v) {
      trainingInfo = v;

      //更新道具
      for (int i = 0; i < trainTaskList.length; i++) {
        if (trainingInfo.training.currentTaskId == trainTaskList[i].taskLevel) {
          currentTaskNeed = trainTaskList[i].taskNeed;
        }
      }
      // update(["training_page"]);
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
      showAward();
    }
  }

  ///奖励表达
  Future showAward() async {
    isPlaying.value = true;
    int cashNum = 0;
    List<int> awads = [];
    awardLength = 0;
    for (var e in trainingInfo.award) {
      ///槽位显示中奖放大动画
      for (int i = 0; i < trainingInfo.propArray.length; i++) {
        if (trainingInfo.propArray[i] == e.id) {
          awardLength++;
          isAwards[i].value = true;
          showBoxList[i].value = true;
          //槽位恢复
          Future.delayed(const Duration(milliseconds: 200), () async {
            isAwards[i].value = false;
            isShowColor[i].value = true;
            colorAnimatedCtrl.forward();
            await Future.delayed(const Duration(milliseconds: 150));
            isShowColor[i].value = false;
            colorAnimatedCtrl.reset();
          });
        }
      }
      if (e.id == 5) {
        cashNum = e.num;
      }
      awads.add(e.id);
    }
    await Future.delayed(const Duration(milliseconds: 300));

    ///2:状态
    if (awads.contains(2)) {
      await startPlayerScroll(0);
      await Future.delayed(const Duration(milliseconds: 500));
    }

    ///3:道具
    if (awads.contains(3)) {
      taskValue.value = trainingInfo.training.taskItemCount;
      update(["training_page"]);
      await Future.delayed(const Duration(milliseconds: 600));
    }

    ///4:篮球
    if (awads.contains(4)) {
      showBall.value = true;
      ballNum.value = trainingInfo.prop.num;
      await Future.delayed(const Duration(milliseconds: 800), () {
        showBall.value = false;
      });
    }

    ///5:钞票
    if (awads.contains(5)) {
      showCash.value = true;
      cash.value = cashNum;
      caShScale.value = true;
      Future.delayed(const Duration(milliseconds: 1000), () async {
        caShScale.value = false;
      });
      await Future.delayed(const Duration(milliseconds: 1500), () async {
        showCash.value = false;
        updateMoney();
        await Future.delayed(const Duration(milliseconds: 300));
      });
    }

    ///战术 buff
    if (awads.contains(1)) {
      chooseTacticList.clear();
      tacticList = trainingInfo.buff;
      chooseTacticList = List.from(trainingInfo.chooseBuffs);
      //初始化卡牌的位置和朝向
      double spacing = 10.w * chooseTacticList.length;
      for (int i = 0; i < chooseTacticList.length; i++) {
        var item = chooseTacticList[i];
        double x = (375.w -
                    (chooseTacticList.length * 74.w +
                        (chooseTacticList.length - 1) * spacing)) /
                2 +
            i * (74.w + spacing);
        item.offset.value = Offset(x, 78.5.w);
        // item.isOpen.value = false;
      }

      update(["training_page"]);
      showBuff.value = true;
      await Future.delayed(const Duration(milliseconds: 300));
      for (var element in chooseTacticList) {
        await Future.delayed(const Duration(milliseconds: 100));
        element.isOpen.value = true;
      }
      // await Future.delayed(const Duration(milliseconds: 300));
      //  showBuff.value = false;
    }

    if (!awads.contains(1)) {
      isPlaying.value = false;
    }
    for (var element in slotsAnimlList) {
      element.reset();
    }
    // getPlayerList();
    update(["training_page"]);
  }

  ///球员滚动
  Future startPlayerScroll(int count) async {
    ///状态控制
    await Future.delayed(const Duration(milliseconds: 150));
    trainingInfo.selectPlayer.value =
        trainingInfo.statusReplyPlayers.map((e) => e.playerId).toList();
    statusScollerList.clear();
    for (int i = 0; i < trainingInfo.statusReplyPlayers.length; i++) {
      statusScollerList.add(ScrollController());
    }
    showPlayerBox.value = true;
    await Future.delayed(const Duration(milliseconds: 300));
    showPlayer.value = true;
    arrowAnimCtrl.forward();
    update(["playerList"]);
    if (playerScollCtrl.hasClients) {
      playerScollCtrl.jumpTo(0);
      double isTwo = trainingInfo.statusReplyPlayers.length == 2 ? -32.w : 0;
      double offset = (playerIdx + playerList.length * 3 - 3) * 65.w + isTwo;
      playerScollCtrl.addListener(() {
        currentPlayerIndex.value = (playerScollCtrl.offset / 65.w).round() + 3;
      });
      await playerScollCtrl
          .animateTo(
        playerScollCtrl.offset + offset,
        duration: const Duration(milliseconds: 2000),
        // curve: Curves.easeInOut,
        curve: const Cubic(0.27, 0.59, 0.19, 1.07),
      )
          .then((v) async {
        playerScrollerEnd = true;
        update(["playerList"]);

        ///找到跳转到原来状态
        await Future.delayed(const Duration(milliseconds: 200));
        List<int> oldList = [];
        for (int i = 0; i < statusScollerList.length; i++) {
          int oldIndex = 0;
          for (var player in playerList) {
            if (trainingInfo.statusReplyPlayers[i].uuid == player.uuid) {
              oldIndex = statusList.indexOf(player.playerStatus);
            }
          }
          oldList.add(oldIndex);
          if (statusScollerList[i].hasClients) {
            statusScollerList[i].jumpTo(oldIndex * 30.w - 3.w);
          }
        }
        showStatus.value = true;

        // update(["playerList"]);
        for (int i = 0; i < statusScollerList.length; i++) {
          await Future.delayed(Duration(milliseconds: 100 + i * 25), () {});
          statusScroll(i, oldList[i]);
        }

        await Future.delayed(
            Duration(milliseconds: 500 + statusScollerList.length * 250), () {
          showPlayerBox.value = false;
          showPlayer.value = false;
          playerScrollerEnd = false;
          showStatus.value = false;
          arrowAnimCtrl.reset();
          arrowAnimCtrl.stop();
        });
      });
    }
  }

  void colosePlayerAwards() {
    // if (!playerScrollerEnd) return;
    // showPlayerBox.value = false;
    // showPlayer.value = false;
    // playerScrollerEnd = false;
    // showStatus.value = false;
    // isPlaying.value = false;
  }

  void statusScroll(int index, int oldIndex) async {
    if (statusScollerList[index].hasClients) {
      int newIndex = statusList
          .indexOf(trainingInfo.statusReplyPlayers[index].playerStatus);
      double offset = 30.w * (newIndex);
      statusScollerList[index].animateTo(
        offset,
        duration: const Duration(milliseconds: 300),
        curve: oldIndex == newIndex
            ? Curves.bounceOut
            : const Cubic(0.27, 0.59, 0.19, 1.0),
        // curve: const Cubic(0.27, 0.59, 0.19, 1.0),
      );
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
    HomeController.to.update([GetXBuilderIds.idMoneyAndCoinWidget]);
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
}
